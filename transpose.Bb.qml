import QtQuick 2.0
import MuseScore 1.0

MuseScore {
      menuPath: "Plugins.transpose2HalfStepsUp"
      onRun: {
            for (var i = 2; i-- > 0; ) {
                  cmd("transpose-up");
            }
            Qt.quit();
      }
}
