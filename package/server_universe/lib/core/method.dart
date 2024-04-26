enum Method {
  get,
  post,
  put,
  delete,
  patch,
  options,
  head,
  copy,
  link,
  unlink,
  purge,
  lock,
  unlock,
  propfind,
  view,
  all;

  Method methodFromString(String str) => Method.values.firstWhere(
        (method) => method.name == str,
        orElse: () => this,
      );
}
