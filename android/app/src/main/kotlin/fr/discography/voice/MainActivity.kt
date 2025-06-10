package fr.discography.voice

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun getInitialRoute(): String? {
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

        return null  // usa la route di default: "/"
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        // Puoi aggiungere qui un MethodChannel se vuoi gestire i comandi a runtime
    }
}
