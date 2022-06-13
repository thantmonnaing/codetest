package com.example.codetest


import android.content.Context
import android.content.Intent
import android.view.View
import android.view.inputmethod.InputMethodManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.codetest"

    private val CHANNEL_Name = "com.codetest/question3"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method.equals("dowloadAndCompressTheInternet")) {
                val greetings: String = "42"
                result.success(greetings)
            }
        }

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_Name
        ).setMethodCallHandler { call, result ->
            if (call.method.equals("customkeyboard")) {
                customkeyboard();
                result.success("Custom Keyboard")
            }
        }
    }

    private fun customkeyboard() {
        val intent = Intent(android.provider.Settings.ACTION_INPUT_METHOD_SETTINGS)
        startActivityForResult(intent, 0);
    }




//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState);
//        MethodChannel(
//            fengin.dartExecutor.binaryMessenger,
//            CHANNEL_Name
//        ).setMethodCallHandler { call, result ->
//            if (call.method.equals("customkeyboard")) {
//                customkeyboard();
//                result.success("")
//            }
//        }
//        private void customkeyboard(){
//            startActivityForResult(new Intent(android.provider.Settings.ACTION_INPUT_METHOD_SETTINGS), 0);
//        }
//    }
}




//    @override
//    protected void onCreate(@NonNull @org.jetbrains.annotations.Nullable Bundle savedInstanceState)
//    {
//        super.onCreate(savedInstanceState);
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_Name).setMethodCallHandler {
//            call, result ->
//            if (call.method.equals("customkeyboard")) {
//                customkeyboard();
//                result.success(greetings)
//            }
//        }
//
//        private void customkeyboard(){
//            startActivity(new Intent(action:"android.settings.INPUT_ METHOD_SETTINGS"))
//        }
//
//    }
