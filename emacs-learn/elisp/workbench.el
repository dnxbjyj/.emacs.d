(with-current-buffer
    (url-retrieve-synchronously "http://fanyi.youdao.com/openapi.do?keyfrom=YouDaoCV&key=659600698&type=data&doctype=json&version=1.1&q=cat")
  (set-buffer-multibyte t)
  (buffer-string))
