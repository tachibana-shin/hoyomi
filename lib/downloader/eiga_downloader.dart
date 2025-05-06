class EigaDownloader {
        static EigaDownloader? _instance;
        // Avoid self instance
        EigaDownloader._();
        static EigaDownloader get instance => _instance ??= EigaDownloader._();
}