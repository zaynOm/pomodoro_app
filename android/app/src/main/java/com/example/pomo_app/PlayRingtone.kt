package com.example.pomo_app

import android.app.Service
import android.content.Intent
import android.media.MediaPlayer
import android.media.Ringtone
import android.os.IBinder
import android.media.RingtoneManager
import android.net.Uri
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.Log


class PlayRingtone : Service() {

    lateinit var  r: Ringtone

    override fun onBind(intent: Intent): IBinder {
        TODO("Return the communication channel to the service.")
    }

    @RequiresApi(Build.VERSION_CODES.P)
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        r = RingtoneManager.getRingtone(applicationContext, Uri.parse(intent?.getStringExtra("ringtoneUri")))
        r.isLooping = false
        r.play()
        return START_STICKY
    }

    override fun onDestroy() {
        r.stop()
    }
}