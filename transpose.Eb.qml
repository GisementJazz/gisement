import QtQuick 2.0
import MuseScore 1.0

MuseScore {
      menuPath: "Plugins.transpose3HalfStepsDown"
      onRun: {
            for (var i = 3; i-- > 0; ) {
                  cmd("transpose-down");
            }
            Qt.quit();
      }
}
