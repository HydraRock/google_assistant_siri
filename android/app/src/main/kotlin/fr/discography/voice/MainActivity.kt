package fr.discography.voice

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

private const val CHANNEL = "fr.discography.voice/intent"

class MainActivity : FlutterActivity() {
    private fun routeFromIntent(intent: Intent?): String? {
        val query = intent?.getStringExtra("q")
        if (!query.isNullOrBlank()) {
            return "/listdossier?name=$query"
        }

        val data = intent?.data
        val nameFromUri = data?.getQueryParameter("name")
        if (!nameFromUri.isNullOrBlank()) {
            return "/listdossier?name=$nameFromUri"
        }

        val feature = intent?.getStringExtra("feature")
        if (!feature.isNullOrBlank()) {
            return "/listdossier"
        }

        return null
    }

    override fun getInitialRoute(): String? {
        return routeFromIntent(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        routeFromIntent(intent)?.let { route ->
            flutterEngine?.dartExecutor?.binaryMessenger?.let { messenger ->
                MethodChannel(messenger, CHANNEL).invokeMethod("navigate", route)
            }
        }
    }
}
