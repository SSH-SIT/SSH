module.exports = (arrBuffer) => {
  var binary = "";
  var bytes = [].slice.call(new Uint8Array(arrBuffer));
  bytes.forEach((b) => (binary += String.fromCharCode(b)));

  return window.btoa(binary);
};
