const exec = require("cordova/exec");

// Garantiza que success/error siempre sean funciones válidas
function safeCallback(cb) {
  return typeof cb === "function" ? cb : function () {};
}

// Normaliza parámetros para evitar que iOS reciba null/undefined
function normalizeParams(params) {
  return params && typeof params === "object" ? params : {};
}

const MetaEvents = {
  logEvent(name, params, success, error) {
    exec(
      safeCallback(success),
      safeCallback(error),
      "MetaEvents",
      "logEvent",
      [name, normalizeParams(params)]
    );
  },

  logPurchase(amount, currency, params, success, error) {
    exec(
      safeCallback(success),
      safeCallback(error),
      "MetaEvents",
      "logPurchase",
      [amount, currency, normalizeParams(params)]
    );
  },

  setConversionValue(value, success, error) {
    exec(
      safeCallback(success),
      safeCallback(error),
      "MetaEvents",
      "setConversionValue",
      [value]
    );
  },

  logFunnelStep(stepName, params, success, error) {
    exec(
      safeCallback(success),
      safeCallback(error),
      "MetaEvents",
      "logFunnelStep",
      [stepName, normalizeParams(params)]
    );
  },
};

module.exports = MetaEvents;
