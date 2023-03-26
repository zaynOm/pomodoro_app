package com.example.pomo_app

import android.content.Context
import android.content.Intent
import android.database.Cursor
import android.media.RingtoneManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val channel = "com.example.pomo_app/mychannel"

    private lateinit var ringtoneName: String
    private var newUri: String = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_RINGTONE).toString()

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channel
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getAllRingtones" -> {
                    result.success(getAllRingtones(this))
                }
                "setRingtone" -> {
                    setRingtone(this, call.argument<String>("ringtoneName").toString())
                }
                "startRingtone" -> {
                        Intent(this, PlayRingtone ::class.java).also { intent ->
                            intent.putExtra("ringtoneUri", newUri)
                            startService(intent)
                        }
                    }
                "stopRingtone" -> {
                    Intent(this, PlayRingtone::class.java).also { intent ->
                        stopService(intent)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getAllRingtones(context: Context): List<String> {
        val manager = RingtoneManager(context)
        manager.setType(RingtoneManager.TYPE_RINGTONE)

        val cursor: Cursor = manager.cursor

        val list: MutableList<String> = mutableListOf()
        while (cursor.moveToNext()) {
            val notificationTitle: String = cursor.getString(RingtoneManager.TITLE_COLUMN_INDEX)
            list.add(notificationTitle)
        }
        return list
    }

    private fun setRingtone(context: Context, myRingtoneName: String) {

        val manager = RingtoneManager(context)
        val cursor: Cursor = manager.cursor

        while (cursor.moveToNext()) {
            ringtoneName = cursor.getString(RingtoneManager.TITLE_COLUMN_INDEX)
            if (ringtoneName == myRingtoneName) {
                newUri = cursor.getString(RingtoneManager.URI_COLUMN_INDEX)
                    .toString() + "/" + cursor.getString(RingtoneManager.ID_COLUMN_INDEX)

            }
        }
    }

}


/* val notificationUri: String =
            cursor.getString(RingtoneManager.URI_COLUMN_INDEX).toString() + "/" + cursor.getString(
                RingtoneManager.ID_COLUMN_INDEX
            )*/
