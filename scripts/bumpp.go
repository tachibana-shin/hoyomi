package main

import (
	"flag"
	"fmt"
	"os"
	"regexp"
	"strconv"
	"strings"

	"gopkg.in/yaml.v3"
)

func main() {
	// Define a command-line flag to specify the bump type (major, minor, patch, build)
	bumpType := flag.String("bump", "patch", "version bump type: major, minor, patch, build")
	flag.Parse()

	// Read the pubspec.yaml file
	data, err := os.ReadFile("../pubspec.yaml")
	if err != nil {
		fmt.Println("Error reading pubspec.yaml:", err)
		os.Exit(1)
	}

	// Unmarshal the YAML content into a map
	var content map[string]interface{}
	if err := yaml.Unmarshal(data, &content); err != nil {
		fmt.Println("Error parsing YAML:", err)
		os.Exit(1)
	}

	// Retrieve the current version from the YAML
	version, ok := content["version"].(string)
	if !ok {
		fmt.Println("Version not found or invalid in pubspec.yaml")
		os.Exit(1)
	}

	// Bump the version according to the provided bump type
	newVersion, err := bumpVersion(version, *bumpType)
	if err != nil {
		fmt.Println("Error bumping version:", err)
		os.Exit(1)
	}
	content["version"] = newVersion

	// Marshal the updated content back to YAML
	out, err := yaml.Marshal(content)
	if err != nil {
		fmt.Println("Error marshaling YAML:", err)
		os.Exit(1)
	}

	// Write the updated YAML back to pubspec.yaml
	if err := os.WriteFile("../pubspec.yaml", out, 0644); err != nil {
		fmt.Println("Error writing pubspec.yaml:", err)
		os.Exit(1)
	}

	fmt.Println("Updated version to", newVersion)
}

// bumpVersion parses the semantic version and increments the appropriate field.
// The expected version format is: x.y.z or x.y.z+build.
func bumpVersion(version, bumpType string) (string, error) {
	// Regular expression to capture version components
	re := regexp.MustCompile(`^(\d+)\.(\d+)\.(\d+)(?:\+(\d+))?$`)
	matches := re.FindStringSubmatch(strings.TrimSpace(version))
	if matches == nil {
		return "", fmt.Errorf("version format is invalid")
	}

	major, _ := strconv.Atoi(matches[1])
	minor, _ := strconv.Atoi(matches[2])
	patch, _ := strconv.Atoi(matches[3])
	build := 0
	if matches[4] != "" {
		build, _ = strconv.Atoi(matches[4])
	}

	// Update version components based on the bump type
	switch bumpType {
	case "major":
		major++
		minor = 0
		patch = 0
		build = 0
	case "minor":
		minor++
		patch = 0
		build = 0
	case "patch":
		patch++
		build = 0
	case "build":
		build++
	default:
		return "", fmt.Errorf("invalid bump type: %s", bumpType)
	}

	// Reconstruct the version string; include build if it is greater than 0
	if build > 0 {
		return fmt.Sprintf("%d.%d.%d+%d", major, minor, patch, build), nil
	}
	return fmt.Sprintf("%d.%d.%d", major, minor, patch), nil
}
