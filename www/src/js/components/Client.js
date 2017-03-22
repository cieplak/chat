export default function Client() {
  this._handler = console.log;
  this.axios = axios.create();
}

Client.prototype.url = function (value) {
  if (!value) return this.axios.defaults.baseURL;
  this.axios.defaults.baseURL = value;
  return this;
};

Client.prototype.handler = function (value) {
  if (!value) return this._handler;
  this._handler = value;
  return this;
};

Client.prototype.get = function (path) {
  var handler = this.handler();
  this.axios.get(path)
  .then(function (response) {
    handler(response);
  })
  .catch(function (error) {
    handler(error);
  });
  return this;
};

Client.prototype.post = function (path, body) {
  var handler = this.handler();
  this.axios.post(path, body)
  .then(function (response) {
    handler(response);
  })
  .catch(function (error) {
    handler(error);
  });
};
