package com.thousand.tmcsatti
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import com.yandex.mapkit.MapKitFactory;
class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        // MapKitFactory.setApiKey("b51c2cab-1212-4f56-a22d-77d0a2632811") // басындагы турган ключ
        MapKitFactory.setApiKey("2a3a1619-cd5e-48dd-8564-83a064c7dac2")
        super.configureFlutterEngine(flutterEngine)
    }
}
