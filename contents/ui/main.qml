import QtQuick 2.0
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.private.pager 2.0

Item {
    id: root
    Plasmoid.status: Plasmoid.ActiveStatus
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
    
    PagerModel {
        id: pagerModel
        enabled: root.visible
    }

    function formatText(activeDesktop) {
        var totalDesktops = pagerModel.count-1;
        var indicatorText = "";

        for (var i = 0; i <= totalDesktops; i++) {
            if (i == activeDesktop) {
                indicatorText += "┃";
            } else {
                indicatorText += "ǀ";
            }
        }

        return indicatorText;
    }

    Plasmoid.fullRepresentation: PlasmaComponents.Label {
        text: formatText(pagerModel.currentPage)
    }
}