const exec = require("cordova/exec");

// Ensure success/error callbacks are always valid functions
function safeCallback(cb) {
  return typeof cb === "function" ? cb : function () {};
}

// Normalize params to avoid null/undefined issues on iOS
function normalizeParams(params) {
  return params && typeof params === "object" ? params : {};
}

const FBAnalytics = {
  logEvent(name, params, success, error) {
    exec(
      safeCallback(success),
      safeCallback(error),
      "FBAnalytics",
      "logEvent",
      [name, normalizeParams(params)],
    );
  },

  logPurchase(amount, currency, params, success, error) {
    exec(
      safeCallback(success),
      safeCallback(error),
      "FBAnalytics",
      "logPurchase",
      [amount, currency, normalizeParams(params)],
    );
  },

  setConversionValue(value, success, error) {
    exec(
      safeCallback(success),
      safeCallback(error),
      "FBAnalytics",
      "setConversionValue",
      [value],
    );
  },

  logFunnelStep(stepName, params, success, error) {
    exec(
      safeCallback(success),
      safeCallback(error),
      "FBAnalytics",
      "logFunnelStep",
      [stepName, normalizeParams(params)],
    );
  },
};

module.exports = FBAnalytics;
