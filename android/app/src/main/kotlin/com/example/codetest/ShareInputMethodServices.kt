package com.example.codetest

import android.content.Context
import android.inputmethodservice.InputMethodService
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.Button

class ShareInputMethodServices : InputMethodService(), View.OnClickListener {
    override fun onCreateInputView(): View {
        return layoutInflater.inflate(R.layout.keyboard_main, null)
    }

    override fun onClick(v: View) {
        //handle all the keyboard key clicks here
        if (v.requestFocus()) {
            val imm: InputMethodManager =
                getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
            imm.showSoftInput(v, InputMethodManager.SHOW_IMPLICIT)
        }
    }

    companion object {
        private const val TAG = "ShareInputMethodServices"
    }
}