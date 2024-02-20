enum FileType { svg, mp4, png, unknown }

FileType detectFileType(String url) {
  // Extract the file extension from the URL
  String extension = url.split('?').first.split('.').last.toLowerCase();

  // Match the file extension to the FileType
  switch (extension) {
    case 'svg':
      return FileType.svg;
    case 'mp4':
      return FileType.mp4;
    case 'png':
      return FileType.png;
    default:
      // If the file type is not recognized
      return FileType.unknown;
  }
}
