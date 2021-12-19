class Constants {
  Constants._();
  static String KEY_HTTP = 'http';
  static int ID_LENGTH = 11;
  static String REGEX_EMAIL =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static List<String> REGEX_URL_YOUTUBE = [
    r'^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$',
    r'^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$',
    r'^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$',
  ];
}
