package com.aksamedia.aksacademy

import android.content.Intent
import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import java.util.*


class SplashActivity : AppCompatActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_splash)
    Timer().schedule(object : TimerTask() {
      override fun run() {
        finish()
        startActivity(Intent(this@SplashActivity, MainActivity::class.java))
      }

    }, 2000)
  }
}