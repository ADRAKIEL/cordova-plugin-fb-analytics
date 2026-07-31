package com.fb.analytics;

import org.apache.cordova.*;
import org.json.*;

import android.os.Bundle;
import android.content.Context;
import android.app.Application;

import com.facebook.FacebookSdk;
import com.facebook.appevents.AppEventsLogger;

import java.math.BigDecimal;
import java.util.Currency;

public class FBAnalytics extends CordovaPlugin {

    private AppEventsLogger logger;

    @Override
    public void pluginInitialize() {

        Context context = cordova.getActivity().getApplicationContext();

        FacebookSdk.sdkInitialize(context);

        Application application = cordova.getActivity().getApplication();
        AppEventsLogger.activateApp(application);

        logger = AppEventsLogger.newLogger(context);
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        switch (action) {
            case "logEvent":
                logEvent(args, callbackContext);
                return true;

            case "logPurchase":
                logPurchase(args, callbackContext);
                return true;

            case "setConversionValue":
                setConversionValue(callbackContext);
                return true;

            case "logFunnelStep":
                logFunnelStep(args, callbackContext);
                return true;

            default:
                return false;
        }
    }

    private void logEvent(JSONArray args, CallbackContext callbackContext) {
        try {
            String eventName = args.optString(0, null);

            if (isNullOrEmpty(eventName)) {
                sendError("Event name is required", callbackContext);
                return;
            }

            JSONObject params = (args.length() > 1 && args.opt(1) instanceof JSONObject)
                    ? args.getJSONObject(1)
                    : null;

            Bundle bundle = convertToBundle(params);

            logger.logEvent(eventName, bundle);

            sendOk("logEvent: " + eventName, callbackContext);

        } catch (Exception e) {
            sendError(e.getMessage(), callbackContext);
        }
    }

    private void logPurchase(JSONArray args, CallbackContext callbackContext) {
        try {
            String sAmount = args.optString(0, null);
            String sCurrency = args.optString(1, null);

            if (isNullOrEmpty(sAmount) || isNullOrEmpty(sCurrency)) {
                sendError("Amount and currency are required", callbackContext);
                return;
            }

            BigDecimal amount = new BigDecimal(sAmount);
            Currency currency = Currency.getInstance(sCurrency);

            JSONObject params = (args.length() > 2 && args.opt(2) instanceof JSONObject)
                    ? args.getJSONObject(2)
                    : null;

            Bundle bundle = convertToBundle(params);

            logger.logPurchase(amount, currency, bundle);

            sendOk("logPurchase", callbackContext);

        } catch (Exception e) {
            sendError(e.getMessage(), callbackContext);
        }
    }

    private void setConversionValue(CallbackContext callbackContext) {
        sendOk("setConversionValue", callbackContext);
    }

    private void logFunnelStep(JSONArray args, CallbackContext callbackContext) {
        try {
            String stepName = args.optString(0, null);

            if (isNullOrEmpty(stepName)) {
                sendError("Step name is required", callbackContext);
                return;
            }

            JSONObject params = (args.length() > 1 && args.opt(1) instanceof JSONObject)
                    ? args.getJSONObject(1)
                    : null;

            Bundle bundle = convertToBundle(params);

            String eventName = "funnel_" + stepName;

            logger.logEvent(eventName, bundle);

            sendOk(eventName, callbackContext);

        } catch (Exception e) {
            sendError(e.getMessage(), callbackContext);
        }
    }

    private void sendOk(String message, CallbackContext callbackContext) {
        callbackContext.success("OK: " + message);
    }

    private void sendError(String message, CallbackContext callbackContext) {
        callbackContext.error("ERROR: " + message);
    }

    private Bundle convertToBundle(JSONObject json) {
        Bundle bundle = new Bundle();

        if (json == null) return bundle;

        JSONArray keys = json.names();
        if (keys == null) return bundle;

        for (int i = 0; i < keys.length(); i++) {
            try {
                String key = keys.getString(i);
                Object value = json.get(key);

                if (value instanceof String) {
                    bundle.putString(key, (String) value);
                } else if (value instanceof Integer) {
                    bundle.putInt(key, (Integer) value);
                } else if (value instanceof Long) {
                    bundle.putLong(key, (Long) value);
                } else if (value instanceof Double) {
                    bundle.putDouble(key, (Double) value);
                } else if (value instanceof Boolean) {
                    bundle.putBoolean(key, (Boolean) value);
                }

            } catch (Exception ignored) {}
        }

        return bundle;
    }

    private boolean isNullOrEmpty(String string) {
        return string == null || string.isEmpty();
    }
}
