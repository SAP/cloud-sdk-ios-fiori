import SwiftUI
import Foundation

/// Public list of icons available for reference by the Developer.
public enum FioriIcon {
    public enum actions {
        ///
        public static let accept: Image = .init("fiori.accept", bundle: Bundle.accessor)
        ///
        public static let actionSettingsFill: Image = .init("fiori.action.settings.fill", bundle: Bundle.accessor)
        ///
        public static let actionSettings: Image = .init("fiori.action.settings", bundle: Bundle.accessor)
        ///
        public static let action: Image = .init("fiori.action", bundle: Bundle.accessor)
        ///
        public static let activate: Image = .init("fiori.activate", bundle: Bundle.accessor)
        ///
        public static let activities: Image = .init("fiori.activities", bundle: Bundle.accessor)
        ///
        public static let addActivity: Image = .init("fiori.add.activity", bundle: Bundle.accessor)
        ///
        public static let addCoursebook: Image = .init("fiori.add.coursebook", bundle: Bundle.accessor)
        ///
        public static let addDocument: Image = .init("fiori.add.document", bundle: Bundle.accessor)
        ///
        public static let addEmployee: Image = .init("fiori.add.employee", bundle: Bundle.accessor)
        ///
        public static let addEquipment: Image = .init("fiori.add.equipment", bundle: Bundle.accessor)
        ///
        public static let addFavorite: Image = .init("fiori.add.favorite", bundle: Bundle.accessor)
        ///
        public static let addFilter: Image = .init("fiori.add.filter", bundle: Bundle.accessor)
        ///
        public static let addFolder: Image = .init("fiori.add.folder", bundle: Bundle.accessor)
        ///
        public static let addPhoto: Image = .init("fiori.add.photo", bundle: Bundle.accessor)
        ///
        public static let addProcess: Image = .init("fiori.add.process", bundle: Bundle.accessor)
        ///
        public static let addProduct: Image = .init("fiori.add.product", bundle: Bundle.accessor)
        ///
        public static let add: Image = .init("fiori.add", bundle: Bundle.accessor)
        ///
        public static let alphabeticalOrder: Image = .init("fiori.alphabetical.order", bundle: Bundle.accessor)
        ///
        public static let attachment: Image = .init("fiori.attachment", bundle: Bundle.accessor)
        ///
        public static let backToTop: Image = .init("fiori.back.to.top", bundle: Bundle.accessor)
        ///
        public static let begin: Image = .init("fiori.begin", bundle: Bundle.accessor)
        ///
        public static let blur: Image = .init("fiori.blur", bundle: Bundle.accessor)
        ///
        public static let boldText: Image = .init("fiori.bold.text", bundle: Bundle.accessor)
        ///
        public static let bookmark: Image = .init("fiori.bookmark", bundle: Bundle.accessor)
        ///
        public static let bulletTextFill: Image = .init("fiori.bullet.text.fill", bundle: Bundle.accessor)
        ///
        public static let bulletText: Image = .init("fiori.bullet.text", bundle: Bundle.accessor)
        ///
        public static let call: Image = .init("fiori.call", bundle: Bundle.accessor)
        ///
        public static let camera: Image = .init("fiori.camera", bundle: Bundle.accessor)
        ///
        public static let cancelMaintenance: Image = .init("fiori.cancel.maintenance", bundle: Bundle.accessor)
        ///
        public static let cancelShare: Image = .init("fiori.cancel.share", bundle: Bundle.accessor)
        ///
        public static let cancel: Image = .init("fiori.cancel", bundle: Bundle.accessor)
        ///
        public static let cause: Image = .init("fiori.cause", bundle: Bundle.accessor)
        ///
        public static let chainLink: Image = .init("fiori.chain.link", bundle: Bundle.accessor)
        ///
        public static let clearFilter: Image = .init("fiori.clear.filter", bundle: Bundle.accessor)
        ///
        public static let collapseGroup: Image = .init("fiori.collapse.group", bundle: Bundle.accessor)
        ///
        public static let collapse: Image = .init("fiori.collapse", bundle: Bundle.accessor)
        ///
        public static let comment: Image = .init("fiori.comment", bundle: Bundle.accessor)
        ///
        public static let compare2: Image = .init("fiori.compare.2", bundle: Bundle.accessor)
        ///
        public static let complete: Image = .init("fiori.complete", bundle: Bundle.accessor)
        ///
        public static let copy: Image = .init("fiori.copy", bundle: Bundle.accessor)
        ///
        public static let createEntryTime: Image = .init("fiori.create.entry.time", bundle: Bundle.accessor)
        ///
        public static let createForm: Image = .init("fiori.create.form", bundle: Bundle.accessor)
        ///
        public static let createLeaveRequest: Image = .init("fiori.create.leave.request", bundle: Bundle.accessor)
        ///
        public static let createSession: Image = .init("fiori.create.session", bundle: Bundle.accessor)
        ///
        public static let create: Image = .init("fiori.create", bundle: Bundle.accessor)
        ///
        public static let crop: Image = .init("fiori.crop", bundle: Bundle.accessor)
        ///
        public static let cursorArrow: Image = .init("fiori.cursor.arrow", bundle: Bundle.accessor)
        ///
        public static let customize: Image = .init("fiori.customize", bundle: Bundle.accessor)
        ///
        public static let decline: Image = .init("fiori.decline", bundle: Bundle.accessor)
        ///
        public static let decreaseLineHeight: Image = .init("fiori.decrease.line.height", bundle: Bundle.accessor)
        ///
        public static let deleteFill: Image = .init("fiori.delete.fill", bundle: Bundle.accessor)
        ///
        public static let delete: Image = .init("fiori.delete", bundle: Bundle.accessor)
        ///
        public static let detailView: Image = .init("fiori.detail.view", bundle: Bundle.accessor)
        ///
        public static let developerSettings: Image = .init("fiori.developer.settings", bundle: Bundle.accessor)
        ///
        public static let disconnected: Image = .init("fiori.disconnected", bundle: Bundle.accessor)
        ///
        public static let displayMore: Image = .init("fiori.display.more", bundle: Bundle.accessor)
        ///
        public static let display: Image = .init("fiori.display", bundle: Bundle.accessor)
        ///
        public static let down: Image = .init("fiori.down", bundle: Bundle.accessor)
        ///
        public static let downloadFromCloud: Image = .init("fiori.download.from.cloud", bundle: Bundle.accessor)
        ///
        public static let download: Image = .init("fiori.download", bundle: Bundle.accessor)
        ///
        public static let drawRectangle: Image = .init("fiori.draw.rectangle", bundle: Bundle.accessor)
        ///
        public static let drillDown: Image = .init("fiori.drill.down", bundle: Bundle.accessor)
        ///
        public static let drillUp: Image = .init("fiori.drill.up", bundle: Bundle.accessor)
        ///
        public static let dropDownList: Image = .init("fiori.drop.down.list", bundle: Bundle.accessor)
        ///
        public static let dropdown: Image = .init("fiori.dropdown", bundle: Bundle.accessor)
        ///
        public static let duplicate: Image = .init("fiori.duplicate", bundle: Bundle.accessor)
        ///
        public static let editOutside: Image = .init("fiori.edit.outside", bundle: Bundle.accessor)
        ///
        public static let edit: Image = .init("fiori.edit", bundle: Bundle.accessor)
        ///
        public static let emailRead: Image = .init("fiori.email.read", bundle: Bundle.accessor)
        ///
        public static let email: Image = .init("fiori.email", bundle: Bundle.accessor)
        ///
        public static let enterMore: Image = .init("fiori.enter.more", bundle: Bundle.accessor)
        ///
        public static let eraser: Image = .init("fiori.eraser", bundle: Bundle.accessor)
        ///
        public static let exitFullScreen: Image = .init("fiori.exit.full.screen", bundle: Bundle.accessor)
        ///
        public static let expandGroup: Image = .init("fiori.expand.group", bundle: Bundle.accessor)
        ///
        public static let expand: Image = .init("fiori.expand", bundle: Bundle.accessor)
        ///
        public static let favoriteList: Image = .init("fiori.favorite.list", bundle: Bundle.accessor)
        ///
        public static let favorite: Image = .init("fiori.favorite", bundle: Bundle.accessor)
        ///
        public static let faxMachine: Image = .init("fiori.fax.machine", bundle: Bundle.accessor)
        ///
        public static let feed: Image = .init("fiori.feed", bundle: Bundle.accessor)
        ///
        public static let filterFill: Image = .init("fiori.filter.fill", bundle: Bundle.accessor)
        ///
        public static let filter: Image = .init("fiori.filter", bundle: Bundle.accessor)
        ///
        public static let flag: Image = .init("fiori.flag", bundle: Bundle.accessor)
        ///
        public static let fullScreen: Image = .init("fiori.full.screen", bundle: Bundle.accessor)
        ///
        public static let fx: Image = .init("fiori.fx", bundle: Bundle.accessor)
        ///
        public static let generalLeaveRequest: Image = .init("fiori.general.leave.request", bundle: Bundle.accessor)
        ///
        public static let generateShortcut: Image = .init("fiori.generate.shortcut", bundle: Bundle.accessor)
        ///
        public static let group2: Image = .init("fiori.group.2", bundle: Bundle.accessor)
        ///
        public static let heading1: Image = .init("fiori.heading1", bundle: Bundle.accessor)
        ///
        public static let heading2: Image = .init("fiori.heading2", bundle: Bundle.accessor)
        ///
        public static let heading3: Image = .init("fiori.heading3", bundle: Bundle.accessor)
        ///
        public static let hide: Image = .init("fiori.hide", bundle: Bundle.accessor)
        ///
        public static let hint: Image = .init("fiori.hint", bundle: Bundle.accessor)
        ///
        public static let homeFill: Image = .init("fiori.home.fill", bundle: Bundle.accessor)
        ///
        public static let homeShare: Image = .init("fiori.home.share", bundle: Bundle.accessor)
        ///
        public static let home: Image = .init("fiori.home", bundle: Bundle.accessor)
        ///
        public static let horizontalGrip: Image = .init("fiori.horizontal.grip", bundle: Bundle.accessor)
        ///
        public static let imageViewer: Image = .init("fiori.image.viewer", bundle: Bundle.accessor)
        ///
        public static let inboxFill: Image = .init("fiori.inbox.fill", bundle: Bundle.accessor)
        ///
        public static let inbox: Image = .init("fiori.inbox", bundle: Bundle.accessor)
        ///
        public static let incomingCall: Image = .init("fiori.incoming.call", bundle: Bundle.accessor)
        ///
        public static let increaseLineHeight: Image = .init("fiori.increase.line.height", bundle: Bundle.accessor)
        ///
        public static let indent: Image = .init("fiori.indent", bundle: Bundle.accessor)
        ///
        public static let inspectDown: Image = .init("fiori.inspect.down", bundle: Bundle.accessor)
        ///
        public static let inspect: Image = .init("fiori.inspect", bundle: Bundle.accessor)
        ///
        public static let inspection: Image = .init("fiori.inspection", bundle: Bundle.accessor)
        ///
        public static let italicText: Image = .init("fiori.italic.text", bundle: Bundle.accessor)
        ///
        public static let journeyArrive: Image = .init("fiori.journey.arrive", bundle: Bundle.accessor)
        ///
        public static let journeyChange: Image = .init("fiori.journey.change", bundle: Bundle.accessor)
        ///
        public static let journeyDepart: Image = .init("fiori.journey.depart", bundle: Bundle.accessor)
        ///
        public static let keyUserSettings: Image = .init("fiori.key.user.settings", bundle: Bundle.accessor)
        ///
        public static let keyboardAndMouse: Image = .init("fiori.keyboard.and.mouse", bundle: Bundle.accessor)
        ///
        public static let legend: Image = .init("fiori.legend", bundle: Bundle.accessor)
        ///
        public static let less: Image = .init("fiori.less", bundle: Bundle.accessor)
        ///
        public static let list: Image = .init("fiori.list", bundle: Bundle.accessor)
        ///
        public static let locateMe: Image = .init("fiori.locate.me", bundle: Bundle.accessor)
        ///
        public static let locked: Image = .init("fiori.locked", bundle: Bundle.accessor)
        ///
        public static let log: Image = .init("fiori.log", bundle: Bundle.accessor)
        ///
        public static let mediaForward: Image = .init("fiori.media.forward", bundle: Bundle.accessor)
        ///
        public static let mediaPause: Image = .init("fiori.media.pause", bundle: Bundle.accessor)
        ///
        public static let mediaPlay: Image = .init("fiori.media.play", bundle: Bundle.accessor)
        ///
        public static let mediaReverse: Image = .init("fiori.media.reverse", bundle: Bundle.accessor)
        ///
        public static let mediaRewind: Image = .init("fiori.media.rewind", bundle: Bundle.accessor)
        ///
        public static let menuFill: Image = .init("fiori.menu.fill", bundle: Bundle.accessor)
        ///
        public static let menu: Image = .init("fiori.menu", bundle: Bundle.accessor)
        ///
        public static let menu2: Image = .init("fiori.menu2", bundle: Bundle.accessor)
        ///
        public static let microphone: Image = .init("fiori.microphone", bundle: Bundle.accessor)
        ///
        public static let minimize: Image = .init("fiori.minimize", bundle: Bundle.accessor)
        ///
        public static let move: Image = .init("fiori.move", bundle: Bundle.accessor)
        ///
        public static let multiSelect: Image = .init("fiori.multi.select", bundle: Bundle.accessor)
        ///
        public static let multiselectAll: Image = .init("fiori.multiselect.all", bundle: Bundle.accessor)
        ///
        public static let multiselectNone: Image = .init("fiori.multiselect.none", bundle: Bundle.accessor)
        ///
        public static let myView: Image = .init("fiori.my.view", bundle: Bundle.accessor)
        ///
        public static let navBack: Image = .init("fiori.nav.back", bundle: Bundle.accessor)
        ///
        public static let navigationDownArrow: Image = .init("fiori.navigation.down.arrow", bundle: Bundle.accessor)
        ///
        public static let navigationLeftArrow: Image = .init("fiori.navigation.left.arrow", bundle: Bundle.accessor)
        ///
        public static let navigationRightArrow: Image = .init("fiori.navigation.right.arrow", bundle: Bundle.accessor)
        ///
        public static let navigationUpArrow: Image = .init("fiori.navigation.up.arrow", bundle: Bundle.accessor)
        ///
        public static let negative: Image = .init("fiori.negative", bundle: Bundle.accessor)
        ///
        public static let notes: Image = .init("fiori.notes", bundle: Bundle.accessor)
        ///
        public static let notification2: Image = .init("fiori.notification.2", bundle: Bundle.accessor)
        ///
        public static let numberedText: Image = .init("fiori.numbered.text", bundle: Bundle.accessor)
        ///
        public static let openCommandField: Image = .init("fiori.open.command.field", bundle: Bundle.accessor)
        ///
        public static let outbox: Image = .init("fiori.outbox", bundle: Bundle.accessor)
        ///
        public static let outdent: Image = .init("fiori.outdent", bundle: Bundle.accessor)
        ///
        public static let outgoingCall: Image = .init("fiori.outgoing.call", bundle: Bundle.accessor)
        ///
        public static let overflow: Image = .init("fiori.overflow", bundle: Bundle.accessor)
        ///
        public static let paging: Image = .init("fiori.paging", bundle: Bundle.accessor)
        ///
        public static let paperPlane: Image = .init("fiori.paper.plane", bundle: Bundle.accessor)
        ///
        public static let paste: Image = .init("fiori.paste", bundle: Bundle.accessor)
        ///
        public static let pause: Image = .init("fiori.pause", bundle: Bundle.accessor)
        ///
        public static let paymentApproval: Image = .init("fiori.payment.approval", bundle: Bundle.accessor)
        ///
        public static let pdfReader: Image = .init("fiori.pdf.reader", bundle: Bundle.accessor)
        ///
        public static let phone: Image = .init("fiori.phone", bundle: Bundle.accessor)
        ///
        public static let pixelate: Image = .init("fiori.pixelate", bundle: Bundle.accessor)
        ///
        public static let play: Image = .init("fiori.play", bundle: Bundle.accessor)
        ///
        public static let popupWindow: Image = .init("fiori.popup.window", bundle: Bundle.accessor)
        ///
        public static let positive: Image = .init("fiori.positive", bundle: Bundle.accessor)
        ///
        public static let post: Image = .init("fiori.post", bundle: Bundle.accessor)
        ///
        public static let print: Image = .init("fiori.print", bundle: Bundle.accessor)
        ///
        public static let process: Image = .init("fiori.process", bundle: Bundle.accessor)
        ///
        public static let projector: Image = .init("fiori.projector", bundle: Bundle.accessor)
        ///
        public static let pullDown: Image = .init("fiori.pull.down", bundle: Bundle.accessor)
        ///
        public static let pushpinOff: Image = .init("fiori.pushpin.off", bundle: Bundle.accessor)
        ///
        public static let pushpinOn: Image = .init("fiori.pushpin.on", bundle: Bundle.accessor)
        ///
        public static let receipt: Image = .init("fiori.receipt", bundle: Bundle.accessor)
        ///
        public static let record: Image = .init("fiori.record", bundle: Bundle.accessor)
        ///
        public static let redo: Image = .init("fiori.redo", bundle: Bundle.accessor)
        ///
        public static let refresh: Image = .init("fiori.refresh", bundle: Bundle.accessor)
        ///
        public static let repost: Image = .init("fiori.repost", bundle: Bundle.accessor)
        ///
        public static let request: Image = .init("fiori.request", bundle: Bundle.accessor)
        ///
        public static let reset: Image = .init("fiori.reset", bundle: Bundle.accessor)
        ///
        public static let resizeCorner: Image = .init("fiori.resize.corner", bundle: Bundle.accessor)
        ///
        public static let resizeHorizontal: Image = .init("fiori.resize.horizontal", bundle: Bundle.accessor)
        ///
        public static let resize: Image = .init("fiori.resize", bundle: Bundle.accessor)
        ///
        public static let resizeVertical: Image = .init("fiori.resize.vertical", bundle: Bundle.accessor)
        ///
        public static let response: Image = .init("fiori.response", bundle: Bundle.accessor)
        ///
        public static let restart: Image = .init("fiori.restart", bundle: Bundle.accessor)
        ///
        public static let save: Image = .init("fiori.save", bundle: Bundle.accessor)
        ///
        public static let scissors: Image = .init("fiori.scissors", bundle: Bundle.accessor)
        ///
        public static let search: Image = .init("fiori.search", bundle: Bundle.accessor)
        ///
        public static let settings: Image = .init("fiori.settings", bundle: Bundle.accessor)
        ///
        public static let share2: Image = .init("fiori.share.2", bundle: Bundle.accessor)
        ///
        public static let share: Image = .init("fiori.share", bundle: Bundle.accessor)
        ///
        public static let shield: Image = .init("fiori.shield", bundle: Bundle.accessor)
        ///
        public static let shortcut: Image = .init("fiori.shortcut", bundle: Bundle.accessor)
        ///
        public static let show: Image = .init("fiori.show", bundle: Bundle.accessor)
        ///
        public static let signature: Image = .init("fiori.signature", bundle: Bundle.accessor)
        ///
        public static let simulate: Image = .init("fiori.simulate", bundle: Bundle.accessor)
        ///
        public static let slimArrowDown: Image = .init("fiori.slim.arrow.down", bundle: Bundle.accessor)
        ///
        public static let slimArrowLeft: Image = .init("fiori.slim.arrow.left", bundle: Bundle.accessor)
        ///
        public static let slimArrowRight: Image = .init("fiori.slim.arrow.right", bundle: Bundle.accessor)
        ///
        public static let slimArrowUp: Image = .init("fiori.slim.arrow.up", bundle: Bundle.accessor)
        ///
        public static let sortAscending: Image = .init("fiori.sort.ascending", bundle: Bundle.accessor)
        ///
        public static let sortDescending: Image = .init("fiori.sort.descending", bundle: Bundle.accessor)
        ///
        public static let sort: Image = .init("fiori.sort", bundle: Bundle.accessor)
        ///
        public static let sortingRanking: Image = .init("fiori.sorting.ranking", bundle: Bundle.accessor)
        ///
        public static let soundLoud: Image = .init("fiori.sound.loud", bundle: Bundle.accessor)
        ///
        public static let soundOff: Image = .init("fiori.sound.off", bundle: Bundle.accessor)
        ///
        public static let sound: Image = .init("fiori.sound", bundle: Bundle.accessor)
        ///
        public static let step: Image = .init("fiori.step", bundle: Bundle.accessor)
        ///
        public static let stop: Image = .init("fiori.stop", bundle: Bundle.accessor)
        ///
        public static let switchClasses: Image = .init("fiori.switch.classes", bundle: Bundle.accessor)
        ///
        public static let switchViews: Image = .init("fiori.switch.views", bundle: Bundle.accessor)
        ///
        public static let synchronize: Image = .init("fiori.synchronize", bundle: Bundle.accessor)
        ///
        public static let syntax: Image = .init("fiori.syntax", bundle: Bundle.accessor)
        ///
        public static let syringe: Image = .init("fiori.syringe", bundle: Bundle.accessor)
        ///
        public static let sysAdd: Image = .init("fiori.sys.add", bundle: Bundle.accessor)
        ///
        public static let sysBack2: Image = .init("fiori.sys.back.2", bundle: Bundle.accessor)
        ///
        public static let sysBack: Image = .init("fiori.sys.back", bundle: Bundle.accessor)
        ///
        public static let sysCancel2: Image = .init("fiori.sys.cancel.2", bundle: Bundle.accessor)
        ///
        public static let sysCancel: Image = .init("fiori.sys.cancel", bundle: Bundle.accessor)
        ///
        public static let sysEnter2: Image = .init("fiori.sys.enter.2", bundle: Bundle.accessor)
        ///
        public static let sysEnterFill: Image = .init("fiori.sys.enter.fill", bundle: Bundle.accessor)
        ///
        public static let sysEnter: Image = .init("fiori.sys.enter", bundle: Bundle.accessor)
        ///
        public static let sysFindNext: Image = .init("fiori.sys.find.next", bundle: Bundle.accessor)
        ///
        public static let sysFind: Image = .init("fiori.sys.find", bundle: Bundle.accessor)
        ///
        public static let sysFirstPage: Image = .init("fiori.sys.first.page", bundle: Bundle.accessor)
        ///
        public static let sysHelp2: Image = .init("fiori.sys.help.2", bundle: Bundle.accessor)
        ///
        public static let sysHelpFill: Image = .init("fiori.sys.help.fill", bundle: Bundle.accessor)
        ///
        public static let sysHelp: Image = .init("fiori.sys.help", bundle: Bundle.accessor)
        ///
        public static let sysLastPage: Image = .init("fiori.sys.last.page", bundle: Bundle.accessor)
        ///
        public static let sysMinus: Image = .init("fiori.sys.minus", bundle: Bundle.accessor)
        ///
        public static let sysNextPage: Image = .init("fiori.sys.next.page", bundle: Bundle.accessor)
        ///
        public static let sysPrevPage: Image = .init("fiori.sys.prev.page", bundle: Bundle.accessor)
        ///
        public static let systemExit2: Image = .init("fiori.system.exit.2", bundle: Bundle.accessor)
        ///
        public static let systemExit: Image = .init("fiori.system.exit", bundle: Bundle.accessor)
        ///
        public static let tag: Image = .init("fiori.tag", bundle: Bundle.accessor)
        ///
        public static let tags: Image = .init("fiori.tags", bundle: Bundle.accessor)
        ///
        public static let textAlignCenter: Image = .init("fiori.text.align.center", bundle: Bundle.accessor)
        ///
        public static let textAlignJustified: Image = .init("fiori.text.align.justified", bundle: Bundle.accessor)
        ///
        public static let textAlignLeft: Image = .init("fiori.text.align.left", bundle: Bundle.accessor)
        ///
        public static let textAlignRight: Image = .init("fiori.text.align.right", bundle: Bundle.accessor)
        ///
        public static let textFormatting: Image = .init("fiori.text.formatting", bundle: Bundle.accessor)
        ///
        public static let thumbDown: Image = .init("fiori.thumb.down", bundle: Bundle.accessor)
        ///
        public static let thumbUp: Image = .init("fiori.thumb.up", bundle: Bundle.accessor)
        ///
        public static let toasterDown: Image = .init("fiori.toaster.down", bundle: Bundle.accessor)
        ///
        public static let toasterUp: Image = .init("fiori.toaster.up", bundle: Bundle.accessor)
        ///
        public static let touch: Image = .init("fiori.touch", bundle: Bundle.accessor)
        ///
        public static let trendDown: Image = .init("fiori.trend.down", bundle: Bundle.accessor)
        ///
        public static let trendUp: Image = .init("fiori.trend.up", bundle: Bundle.accessor)
        ///
        public static let uiNotifications: Image = .init("fiori.ui.notifications", bundle: Bundle.accessor)
        ///
        public static let underlineText: Image = .init("fiori.underline.text", bundle: Bundle.accessor)
        ///
        public static let undo: Image = .init("fiori.undo", bundle: Bundle.accessor)
        ///
        public static let unfavorite: Image = .init("fiori.unfavorite", bundle: Bundle.accessor)
        ///
        public static let unlocked: Image = .init("fiori.unlocked", bundle: Bundle.accessor)
        ///
        public static let up: Image = .init("fiori.up", bundle: Bundle.accessor)
        ///
        public static let upload: Image = .init("fiori.upload", bundle: Bundle.accessor)
        ///
        public static let uploadToCloud: Image = .init("fiori.upload.to.cloud", bundle: Bundle.accessor)
        ///
        public static let userEdit: Image = .init("fiori.user.edit", bundle: Bundle.accessor)
        ///
        public static let userSettings: Image = .init("fiori.user.settings", bundle: Bundle.accessor)
        ///
        public static let validate: Image = .init("fiori.validate", bundle: Bundle.accessor)
        ///
        public static let valueHelp: Image = .init("fiori.value.help", bundle: Bundle.accessor)
        ///
        public static let verticalGrip: Image = .init("fiori.vertical.grip", bundle: Bundle.accessor)
        ///
        public static let video: Image = .init("fiori.video", bundle: Bundle.accessor)
        ///
        public static let visits: Image = .init("fiori.visits", bundle: Bundle.accessor)
        ///
        public static let webCam: Image = .init("fiori.web.cam", bundle: Bundle.accessor)
        ///
        public static let workflowTasks: Image = .init("fiori.workflow.tasks", bundle: Bundle.accessor)
        ///
        public static let wrench: Image = .init("fiori.wrench", bundle: Bundle.accessor)
        ///
        public static let writeNewDocument: Image = .init("fiori.write.new.document", bundle: Bundle.accessor)
        ///
        public static let writeNew: Image = .init("fiori.write.new", bundle: Bundle.accessor)
        ///
        public static let zoomIn: Image = .init("fiori.zoom.in", bundle: Bundle.accessor)
        ///
        public static let zoomOut: Image = .init("fiori.zoom.out", bundle: Bundle.accessor)
    }

    public enum arrows {
        ///
        public static let arrowBottom: Image = .init("fiori.arrow.bottom", bundle: Bundle.accessor)
        ///
        public static let arrowDown: Image = .init("fiori.arrow.down", bundle: Bundle.accessor)
        ///
        public static let arrowLeft: Image = .init("fiori.arrow.left", bundle: Bundle.accessor)
        ///
        public static let arrowRight: Image = .init("fiori.arrow.right", bundle: Bundle.accessor)
        ///
        public static let arrowTop: Image = .init("fiori.arrow.top", bundle: Bundle.accessor)
        ///
        public static let backToTop: Image = .init("fiori.back.to.top", bundle: Bundle.accessor)
        ///
        public static let begin: Image = .init("fiori.begin", bundle: Bundle.accessor)
        ///
        public static let cause: Image = .init("fiori.cause", bundle: Bundle.accessor)
        ///
        public static let chartAxis: Image = .init("fiori.chart.axis", bundle: Bundle.accessor)
        ///
        public static let closeCommandField: Image = .init("fiori.close.command.field", bundle: Bundle.accessor)
        ///
        public static let collapseAll: Image = .init("fiori.collapse.all", bundle: Bundle.accessor)
        ///
        public static let collapseGroup: Image = .init("fiori.collapse.group", bundle: Bundle.accessor)
        ///
        public static let combine: Image = .init("fiori.combine", bundle: Bundle.accessor)
        ///
        public static let down: Image = .init("fiori.down", bundle: Bundle.accessor)
        ///
        public static let downloadFromCloud: Image = .init("fiori.download.from.cloud", bundle: Bundle.accessor)
        ///
        public static let download: Image = .init("fiori.download", bundle: Bundle.accessor)
        ///
        public static let drillDown: Image = .init("fiori.drill.down", bundle: Bundle.accessor)
        ///
        public static let drillUp: Image = .init("fiori.drill.up", bundle: Bundle.accessor)
        ///
        public static let dropDownList: Image = .init("fiori.drop.down.list", bundle: Bundle.accessor)
        ///
        public static let dropdown: Image = .init("fiori.dropdown", bundle: Bundle.accessor)
        ///
        public static let duplicate: Image = .init("fiori.duplicate", bundle: Bundle.accessor)
        ///
        public static let editOutside: Image = .init("fiori.edit.outside", bundle: Bundle.accessor)
        ///
        public static let enterMore: Image = .init("fiori.enter.more", bundle: Bundle.accessor)
        ///
        public static let expandAll: Image = .init("fiori.expand.all", bundle: Bundle.accessor)
        ///
        public static let expandGroup: Image = .init("fiori.expand.group", bundle: Bundle.accessor)
        ///
        public static let feederArrow: Image = .init("fiori.feeder.arrow", bundle: Bundle.accessor)
        ///
        public static let forward: Image = .init("fiori.forward", bundle: Bundle.accessor)
        ///
        public static let fullScreen: Image = .init("fiori.full.screen", bundle: Bundle.accessor)
        ///
        public static let inboxFill: Image = .init("fiori.inbox.fill", bundle: Bundle.accessor)
        ///
        public static let inbox: Image = .init("fiori.inbox", bundle: Bundle.accessor)
        ///
        public static let initiative: Image = .init("fiori.initiative", bundle: Bundle.accessor)
        ///
        public static let inspect: Image = .init("fiori.inspect", bundle: Bundle.accessor)
        ///
        public static let journeyArrive: Image = .init("fiori.journey.arrive", bundle: Bundle.accessor)
        ///
        public static let journeyChange: Image = .init("fiori.journey.change", bundle: Bundle.accessor)
        ///
        public static let journeyDepart: Image = .init("fiori.journey.depart", bundle: Bundle.accessor)
        ///
        public static let locateMe: Image = .init("fiori.locate.me", bundle: Bundle.accessor)
        ///
        public static let mediaForward: Image = .init("fiori.media.forward", bundle: Bundle.accessor)
        ///
        public static let mediaPause: Image = .init("fiori.media.pause", bundle: Bundle.accessor)
        ///
        public static let mediaPlay: Image = .init("fiori.media.play", bundle: Bundle.accessor)
        ///
        public static let mediaReverse: Image = .init("fiori.media.reverse", bundle: Bundle.accessor)
        ///
        public static let mediaRewind: Image = .init("fiori.media.rewind", bundle: Bundle.accessor)
        ///
        public static let move: Image = .init("fiori.move", bundle: Bundle.accessor)
        ///
        public static let navBack: Image = .init("fiori.nav.back", bundle: Bundle.accessor)
        ///
        public static let navigationDownArrow: Image = .init("fiori.navigation.down.arrow", bundle: Bundle.accessor)
        ///
        public static let navigationLeftArrow: Image = .init("fiori.navigation.left.arrow", bundle: Bundle.accessor)
        ///
        public static let navigationRightArrow: Image = .init("fiori.navigation.right.arrow", bundle: Bundle.accessor)
        ///
        public static let navigationUpArrow: Image = .init("fiori.navigation.up.arrow", bundle: Bundle.accessor)
        ///
        public static let openCommandField: Image = .init("fiori.open.command.field", bundle: Bundle.accessor)
        ///
        public static let play: Image = .init("fiori.play", bundle: Bundle.accessor)
        ///
        public static let process: Image = .init("fiori.process", bundle: Bundle.accessor)
        ///
        public static let pullDown: Image = .init("fiori.pull.down", bundle: Bundle.accessor)
        ///
        public static let redo: Image = .init("fiori.redo", bundle: Bundle.accessor)
        ///
        public static let refresh: Image = .init("fiori.refresh", bundle: Bundle.accessor)
        ///
        public static let repost: Image = .init("fiori.repost", bundle: Bundle.accessor)
        ///
        public static let reset: Image = .init("fiori.reset", bundle: Bundle.accessor)
        ///
        public static let resizeHorizontal: Image = .init("fiori.resize.horizontal", bundle: Bundle.accessor)
        ///
        public static let resize: Image = .init("fiori.resize", bundle: Bundle.accessor)
        ///
        public static let resizeVertical: Image = .init("fiori.resize.vertical", bundle: Bundle.accessor)
        ///
        public static let response: Image = .init("fiori.response", bundle: Bundle.accessor)
        ///
        public static let restart: Image = .init("fiori.restart", bundle: Bundle.accessor)
        ///
        public static let share: Image = .init("fiori.share", bundle: Bundle.accessor)
        ///
        public static let shortcut: Image = .init("fiori.shortcut", bundle: Bundle.accessor)
        ///
        public static let slimArrowDown: Image = .init("fiori.slim.arrow.down", bundle: Bundle.accessor)
        ///
        public static let slimArrowLeft: Image = .init("fiori.slim.arrow.left", bundle: Bundle.accessor)
        ///
        public static let slimArrowRight: Image = .init("fiori.slim.arrow.right", bundle: Bundle.accessor)
        ///
        public static let slimArrowUp: Image = .init("fiori.slim.arrow.up", bundle: Bundle.accessor)
        ///
        public static let sortAscending: Image = .init("fiori.sort.ascending", bundle: Bundle.accessor)
        ///
        public static let sortDescending: Image = .init("fiori.sort.descending", bundle: Bundle.accessor)
        ///
        public static let sort: Image = .init("fiori.sort", bundle: Bundle.accessor)
        ///
        public static let sortingRanking: Image = .init("fiori.sorting.ranking", bundle: Bundle.accessor)
        ///
        public static let sourceCode: Image = .init("fiori.source.code", bundle: Bundle.accessor)
        ///
        public static let split: Image = .init("fiori.split", bundle: Bundle.accessor)
        ///
        public static let step: Image = .init("fiori.step", bundle: Bundle.accessor)
        ///
        public static let synchronize: Image = .init("fiori.synchronize", bundle: Bundle.accessor)
        ///
        public static let sysBack2: Image = .init("fiori.sys.back.2", bundle: Bundle.accessor)
        ///
        public static let sysBack: Image = .init("fiori.sys.back", bundle: Bundle.accessor)
        ///
        public static let systemExit2: Image = .init("fiori.system.exit.2", bundle: Bundle.accessor)
        ///
        public static let systemExit: Image = .init("fiori.system.exit", bundle: Bundle.accessor)
        ///
        public static let trendDown: Image = .init("fiori.trend.down", bundle: Bundle.accessor)
        ///
        public static let trendUp: Image = .init("fiori.trend.up", bundle: Bundle.accessor)
        ///
        public static let undo: Image = .init("fiori.undo", bundle: Bundle.accessor)
        ///
        public static let up: Image = .init("fiori.up", bundle: Bundle.accessor)
        ///
        public static let upload: Image = .init("fiori.upload", bundle: Bundle.accessor)
        ///
        public static let uploadToCloud: Image = .init("fiori.upload.to.cloud", bundle: Bundle.accessor)
        ///
        public static let visits: Image = .init("fiori.visits", bundle: Bundle.accessor)
    }

    public enum calendars {
        ///
        public static let accelerated: Image = .init("fiori.accelerated", bundle: Bundle.accessor)
        ///
        public static let addCalendar: Image = .init("fiori.add.calendar", bundle: Bundle.accessor)
        ///
        public static let appointment2: Image = .init("fiori.appointment.2", bundle: Bundle.accessor)
        ///
        public static let appointment: Image = .init("fiori.appointment", bundle: Bundle.accessor)
        ///
        public static let calendarFill: Image = .init("fiori.calendar.fill", bundle: Bundle.accessor)
        ///
        public static let calendar: Image = .init("fiori.calendar", bundle: Bundle.accessor)
        ///
        public static let checkAvailability: Image = .init("fiori.check.availability", bundle: Bundle.accessor)
        ///
        public static let dateTime: Image = .init("fiori.date.time", bundle: Bundle.accessor)
        ///
        public static let ganttBars: Image = .init("fiori.gantt.bars", bundle: Bundle.accessor)
        ///
        public static let measurementDocument: Image = .init("fiori.measurement.document", bundle: Bundle.accessor)
        ///
        public static let notes: Image = .init("fiori.notes", bundle: Bundle.accessor)
        ///
        public static let perDiem: Image = .init("fiori.per.diem", bundle: Bundle.accessor)
        ///
        public static let selectAppointments: Image = .init("fiori.select.appointments", bundle: Bundle.accessor)
        ///
        public static let timeOff: Image = .init("fiori.time.off", bundle: Bundle.accessor)
        ///
        public static let workflowTasks: Image = .init("fiori.workflow.tasks", bundle: Bundle.accessor)
    }

    public enum callout {
        ///
        public static let comment: Image = .init("fiori.comment", bundle: Bundle.accessor)
        ///
        public static let discussion2: Image = .init("fiori.discussion.2", bundle: Bundle.accessor)
        ///
        public static let discussion: Image = .init("fiori.discussion", bundle: Bundle.accessor)
        ///
        public static let feedback: Image = .init("fiori.feedback", bundle: Bundle.accessor)
        ///
        public static let helloWorld: Image = .init("fiori.hello.world", bundle: Bundle.accessor)
        ///
        public static let messagePopup: Image = .init("fiori.message.popup", bundle: Bundle.accessor)
        ///
        public static let notification2: Image = .init("fiori.notification.2", bundle: Bundle.accessor)
        ///
        public static let post: Image = .init("fiori.post", bundle: Bundle.accessor)
        ///
        public static let salesNotification: Image = .init("fiori.sales.notification", bundle: Bundle.accessor)
        ///
        public static let tagCloudChart: Image = .init("fiori.tag.cloud.chart", bundle: Bundle.accessor)
        ///
        public static let thingType: Image = .init("fiori.thing.type", bundle: Bundle.accessor)
        ///
        public static let travelRequest: Image = .init("fiori.travel.request", bundle: Bundle.accessor)
        ///
        public static let uiNotifications: Image = .init("fiori.ui.notifications", bundle: Bundle.accessor)
    }

    public enum charts {
        ///
        public static let alongStackedChart: Image = .init("fiori.along.stacked.chart", bundle: Bundle.accessor)
        ///
        public static let areaChart: Image = .init("fiori.area.chart", bundle: Bundle.accessor)
        ///
        public static let barChart: Image = .init("fiori.bar.chart", bundle: Bundle.accessor)
        ///
        public static let bubbleChart: Image = .init("fiori.bubble.chart", bundle: Bundle.accessor)
        ///
        public static let businessObjectsExperienceFill: Image = .init("fiori.business.objects.experience.fill", bundle: Bundle.accessor)
        ///
        public static let businessObjectsExperience: Image = .init("fiori.business.objects.experience", bundle: Bundle.accessor)
        ///
        public static let chartAxis: Image = .init("fiori.chart.axis", bundle: Bundle.accessor)
        ///
        public static let chartTableView: Image = .init("fiori.chart.table.view", bundle: Bundle.accessor)
        ///
        public static let chartTreeMap: Image = .init("fiori.chart.tree.map", bundle: Bundle.accessor)
        ///
        public static let checklist2: Image = .init("fiori.checklist.2", bundle: Bundle.accessor)
        ///
        public static let checklistItem2: Image = .init("fiori.checklist.item.2", bundle: Bundle.accessor)
        ///
        public static let checklistItem: Image = .init("fiori.checklist.item", bundle: Bundle.accessor)
        ///
        public static let checklist: Image = .init("fiori.checklist", bundle: Bundle.accessor)
        ///
        public static let chevronPhase2: Image = .init("fiori.chevron.phase.2", bundle: Bundle.accessor)
        ///
        public static let chevronPhase: Image = .init("fiori.chevron.phase", bundle: Bundle.accessor)
        ///
        public static let choroplethChart: Image = .init("fiori.choropleth.chart", bundle: Bundle.accessor)
        ///
        public static let circleTask2: Image = .init("fiori.circle.task.2", bundle: Bundle.accessor)
        ///
        public static let circleTaskFill: Image = .init("fiori.circle.task.fill", bundle: Bundle.accessor)
        ///
        public static let circleTask: Image = .init("fiori.circle.task", bundle: Bundle.accessor)
        ///
        public static let columnChartDualAxis: Image = .init("fiori.column.chart.dual.axis", bundle: Bundle.accessor)
        ///
        public static let crossedLineChart: Image = .init("fiori.crossed.line.chart", bundle: Bundle.accessor)
        ///
        public static let donutChart: Image = .init("fiori.donut.chart", bundle: Bundle.accessor)
        ///
        public static let filterAnalytics: Image = .init("fiori.filter.analytics", bundle: Bundle.accessor)
        ///
        public static let fullStackedChart: Image = .init("fiori.full.stacked.chart", bundle: Bundle.accessor)
        ///
        public static let fullStackedColumnChart: Image = .init("fiori.full.stacked.column.chart", bundle: Bundle.accessor)
        ///
        public static let ganttBars: Image = .init("fiori.gantt.bars", bundle: Bundle.accessor)
        ///
        public static let geographicBubbleChart: Image = .init("fiori.geographic.bubble.chart", bundle: Bundle.accessor)
        ///
        public static let heatmapChart: Image = .init("fiori.heatmap.chart", bundle: Bundle.accessor)
        ///
        public static let horizontalBarChart2: Image = .init("fiori.horizontal.bar.chart.2", bundle: Bundle.accessor)
        ///
        public static let horizontalBarChart: Image = .init("fiori.horizontal.bar.chart", bundle: Bundle.accessor)
        ///
        public static let horizontalBulletChart: Image = .init("fiori.horizontal.bullet.chart", bundle: Bundle.accessor)
        ///
        public static let horizontalCombinationChart: Image = .init("fiori.horizontal.combination.chart", bundle: Bundle.accessor)
        ///
        public static let horizontalStackedChart: Image = .init("fiori.horizontal.stacked.chart", bundle: Bundle.accessor)
        ///
        public static let horizontalWaterfallChart: Image = .init("fiori.horizontal.waterfall.chart", bundle: Bundle.accessor)
        ///
        public static let legend: Image = .init("fiori.legend", bundle: Bundle.accessor)
        ///
        public static let lineChartDualAxis: Image = .init("fiori.line.chart.dual.axis", bundle: Bundle.accessor)
        ///
        public static let lineChart: Image = .init("fiori.line.chart", bundle: Bundle.accessor)
        ///
        public static let lineChartTimeAxis: Image = .init("fiori.line.chart.time.axis", bundle: Bundle.accessor)
        ///
        public static let lineCharts: Image = .init("fiori.line.charts", bundle: Bundle.accessor)
        ///
        public static let masterTaskTriangle2: Image = .init("fiori.master.task.triangle.2", bundle: Bundle.accessor)
        ///
        public static let masterTaskTriangle: Image = .init("fiori.master.task.triangle", bundle: Bundle.accessor)
        ///
        public static let mirroredTaskCircle2: Image = .init("fiori.mirrored.task.circle.2", bundle: Bundle.accessor)
        ///
        public static let mirroredTaskCircle: Image = .init("fiori.mirrored.task.circle", bundle: Bundle.accessor)
        ///
        public static let multipleBarChart: Image = .init("fiori.multiple.bar.chart", bundle: Bundle.accessor)
        ///
        public static let multipleLineChart: Image = .init("fiori.multiple.line.chart", bundle: Bundle.accessor)
        ///
        public static let multiplePieChart: Image = .init("fiori.multiple.pie.chart", bundle: Bundle.accessor)
        ///
        public static let multipleRadarChart: Image = .init("fiori.multiple.radar.chart", bundle: Bundle.accessor)
        ///
        public static let orgChartFill: Image = .init("fiori.org.chart.fill", bundle: Bundle.accessor)
        ///
        public static let orgChart: Image = .init("fiori.org.chart", bundle: Bundle.accessor)
        ///
        public static let overviewChart: Image = .init("fiori.overview.chart", bundle: Bundle.accessor)
        ///
        public static let pieChart: Image = .init("fiori.pie.chart", bundle: Bundle.accessor)
        ///
        public static let pipelineAnalysis: Image = .init("fiori.pipeline.analysis", bundle: Bundle.accessor)
        ///
        public static let programTriangles2: Image = .init("fiori.program.triangles.2", bundle: Bundle.accessor)
        ///
        public static let programTrianglesFill: Image = .init("fiori.program.triangles.fill", bundle: Bundle.accessor)
        ///
        public static let programTriangles: Image = .init("fiori.program.triangles", bundle: Bundle.accessor)
        ///
        public static let projectDefinitionTriangle2: Image = .init("fiori.project.definition.triangle.2", bundle: Bundle.accessor)
        ///
        public static let projectDefinitionTriangle: Image = .init("fiori.project.definition.triangle", bundle: Bundle.accessor)
        ///
        public static let provision: Image = .init("fiori.provision", bundle: Bundle.accessor)
        ///
        public static let radarChart: Image = .init("fiori.radar.chart", bundle: Bundle.accessor)
        ///
        public static let rhombusMilestone2: Image = .init("fiori.rhombus.milestone.2", bundle: Bundle.accessor)
        ///
        public static let rhombusMilestone: Image = .init("fiori.rhombus.milestone", bundle: Bundle.accessor)
        ///
        public static let scatterChart: Image = .init("fiori.scatter.chart", bundle: Bundle.accessor)
        ///
        public static let tableChart: Image = .init("fiori.table.chart", bundle: Bundle.accessor)
        ///
        public static let tableView: Image = .init("fiori.table.view", bundle: Bundle.accessor)
        ///
        public static let tagCloudChart: Image = .init("fiori.tag.cloud.chart", bundle: Bundle.accessor)
        ///
        public static let temperature: Image = .init("fiori.temperature", bundle: Bundle.accessor)
        ///
        public static let toolsOpportunityFill: Image = .init("fiori.tools.opportunity.fill", bundle: Bundle.accessor)
        ///
        public static let toolsOpportunity: Image = .init("fiori.tools.opportunity", bundle: Bundle.accessor)
        ///
        public static let tree: Image = .init("fiori.tree", bundle: Bundle.accessor)
        ///
        public static let tripReport: Image = .init("fiori.trip.report", bundle: Bundle.accessor)
        ///
        public static let upstackedChart: Image = .init("fiori.upstacked.chart", bundle: Bundle.accessor)
        ///
        public static let verticalBarChart2: Image = .init("fiori.vertical.bar.chart.2", bundle: Bundle.accessor)
        ///
        public static let verticalBarChart: Image = .init("fiori.vertical.bar.chart", bundle: Bundle.accessor)
        ///
        public static let verticalBulletChart: Image = .init("fiori.vertical.bullet.chart", bundle: Bundle.accessor)
        ///
        public static let verticalStackedChart: Image = .init("fiori.vertical.stacked.chart", bundle: Bundle.accessor)
        ///
        public static let verticalWaterfallChart: Image = .init("fiori.vertical.waterfall.chart", bundle: Bundle.accessor)
    }

    public enum clipboards {
        ///
        public static let activity2: Image = .init("fiori.activity.2", bundle: Bundle.accessor)
        ///
        public static let activityAssignedToGoal: Image = .init("fiori.activity.assigned.to.goal", bundle: Bundle.accessor)
        ///
        public static let activityIndividual: Image = .init("fiori.activity.individual", bundle: Bundle.accessor)
        ///
        public static let activityItems: Image = .init("fiori.activity.items", bundle: Bundle.accessor)
        ///
        public static let addActivity2: Image = .init("fiori.add.activity.2", bundle: Bundle.accessor)
        ///
        public static let clinicalTaskTracker: Image = .init("fiori.clinical.task.tracker", bundle: Bundle.accessor)
        ///
        public static let crmServiceManager: Image = .init("fiori.crm.service.manager", bundle: Bundle.accessor)
        ///
        public static let paste: Image = .init("fiori.paste", bundle: Bundle.accessor)
        ///
        public static let taskFill: Image = .init("fiori.task.fill", bundle: Bundle.accessor)
        ///
        public static let task: Image = .init("fiori.task", bundle: Bundle.accessor)
        ///
        public static let workflowTasks: Image = .init("fiori.workflow.tasks", bundle: Bundle.accessor)
    }

    public enum devices {
        ///
        public static let desktopMobile: Image = .init("fiori.desktop.mobile", bundle: Bundle.accessor)
        ///
        public static let dishwasher: Image = .init("fiori.dishwasher", bundle: Bundle.accessor)
        ///
        public static let faxMachine: Image = .init("fiori.fax.machine", bundle: Bundle.accessor)
        ///
        public static let fobWatch: Image = .init("fiori.fob.watch", bundle: Bundle.accessor)
        ///
        public static let fridge: Image = .init("fiori.fridge", bundle: Bundle.accessor)
        ///
        public static let ipad2: Image = .init("fiori.ipad.2", bundle: Bundle.accessor)
        ///
        public static let ipad: Image = .init("fiori.ipad", bundle: Bundle.accessor)
        ///
        public static let iphone2: Image = .init("fiori.iphone.2", bundle: Bundle.accessor)
        ///
        public static let iphone: Image = .init("fiori.iphone", bundle: Bundle.accessor)
        ///
        public static let itHost: Image = .init("fiori.it.host", bundle: Bundle.accessor)
        ///
        public static let itInstance: Image = .init("fiori.it.instance", bundle: Bundle.accessor)
        ///
        public static let itSystem: Image = .init("fiori.it.system", bundle: Bundle.accessor)
        ///
        public static let laptop: Image = .init("fiori.laptop", bundle: Bundle.accessor)
        ///
        public static let machine: Image = .init("fiori.machine", bundle: Bundle.accessor)
        ///
        public static let marketingCampaign: Image = .init("fiori.marketing.campaign", bundle: Bundle.accessor)
        ///
        public static let microphone: Image = .init("fiori.microphone", bundle: Bundle.accessor)
        ///
        public static let phone: Image = .init("fiori.phone", bundle: Bundle.accessor)
        ///
        public static let popupWindow: Image = .init("fiori.popup.window", bundle: Bundle.accessor)
        ///
        public static let print: Image = .init("fiori.print", bundle: Bundle.accessor)
        ///
        public static let projector: Image = .init("fiori.projector", bundle: Bundle.accessor)
        ///
        public static let responsive: Image = .init("fiori.responsive", bundle: Bundle.accessor)
        ///
        public static let simulate: Image = .init("fiori.simulate", bundle: Bundle.accessor)
        ///
        public static let sysMonitor: Image = .init("fiori.sys.monitor", bundle: Bundle.accessor)
        ///
        public static let video: Image = .init("fiori.video", bundle: Bundle.accessor)
        ///
        public static let washingMachine: Image = .init("fiori.washing.machine", bundle: Bundle.accessor)
        ///
        public static let webCam: Image = .init("fiori.web.cam", bundle: Bundle.accessor)
    }

    public enum documents {
        ///
        public static let accountingDocumentVerification: Image = .init("fiori.accounting.document.verification", bundle: Bundle.accessor)
        ///
        public static let addDocument: Image = .init("fiori.add.document", bundle: Bundle.accessor)
        ///
        public static let attachmentAudio: Image = .init("fiori.attachment.audio", bundle: Bundle.accessor)
        ///
        public static let attachmentEPub: Image = .init("fiori.attachment.e.pub", bundle: Bundle.accessor)
        ///
        public static let attachmentHtml: Image = .init("fiori.attachment.html", bundle: Bundle.accessor)
        ///
        public static let attachmentPhoto: Image = .init("fiori.attachment.photo", bundle: Bundle.accessor)
        ///
        public static let attachmentTextFile: Image = .init("fiori.attachment.text.file", bundle: Bundle.accessor)
        ///
        public static let attachmentVideo: Image = .init("fiori.attachment.video", bundle: Bundle.accessor)
        ///
        public static let attachmentZipFile: Image = .init("fiori.attachment.zip.file", bundle: Bundle.accessor)
        ///
        public static let barCode: Image = .init("fiori.bar.code", bundle: Bundle.accessor)
        ///
        public static let clinicalOrder: Image = .init("fiori.clinical.order", bundle: Bundle.accessor)
        ///
        public static let courseProgram: Image = .init("fiori.course.program", bundle: Bundle.accessor)
        ///
        public static let createEntryTime: Image = .init("fiori.create.entry.time", bundle: Bundle.accessor)
        ///
        public static let create: Image = .init("fiori.create", bundle: Bundle.accessor)
        ///
        public static let customerFinancialFactSheet: Image = .init("fiori.customer.financial.fact.sheet", bundle: Bundle.accessor)
        ///
        public static let docAttachment2: Image = .init("fiori.doc.attachment.2", bundle: Bundle.accessor)
        ///
        public static let docAttachment: Image = .init("fiori.doc.attachment", bundle: Bundle.accessor)
        ///
        public static let document: Image = .init("fiori.document", bundle: Bundle.accessor)
        ///
        public static let documentText: Image = .init("fiori.document.text", bundle: Bundle.accessor)
        ///
        public static let documents: Image = .init("fiori.documents", bundle: Bundle.accessor)
        ///
        public static let excelAttachment: Image = .init("fiori.excel.attachment", bundle: Bundle.accessor)
        ///
        public static let expenseReport: Image = .init("fiori.expense.report", bundle: Bundle.accessor)
        ///
        public static let inspection: Image = .init("fiori.inspection", bundle: Bundle.accessor)
        ///
        public static let insuranceCar: Image = .init("fiori.insurance.car", bundle: Bundle.accessor)
        ///
        public static let insuranceHouse: Image = .init("fiori.insurance.house", bundle: Bundle.accessor)
        ///
        public static let insuranceLife: Image = .init("fiori.insurance.life", bundle: Bundle.accessor)
        ///
        public static let measurementDocument: Image = .init("fiori.measurement.document", bundle: Bundle.accessor)
        ///
        public static let mySalesOrder: Image = .init("fiori.my.sales.order", bundle: Bundle.accessor)
        ///
        public static let newspaper: Image = .init("fiori.newspaper", bundle: Bundle.accessor)
        ///
        public static let orderStatus: Image = .init("fiori.order.status", bundle: Bundle.accessor)
        ///
        public static let pdfAttachment: Image = .init("fiori.pdf.attachment", bundle: Bundle.accessor)
        ///
        public static let pdfReader: Image = .init("fiori.pdf.reader", bundle: Bundle.accessor)
        ///
        public static let permission: Image = .init("fiori.permission", bundle: Bundle.accessor)
        ///
        public static let pptAttachment: Image = .init("fiori.ppt.attachment", bundle: Bundle.accessor)
        ///
        public static let pushpinOn: Image = .init("fiori.pushpin.on", bundle: Bundle.accessor)
        ///
        public static let request: Image = .init("fiori.request", bundle: Bundle.accessor)
        ///
        public static let salesDocument: Image = .init("fiori.sales.document", bundle: Bundle.accessor)
        ///
        public static let salesOrderItem: Image = .init("fiori.sales.order.item", bundle: Bundle.accessor)
        ///
        public static let salesOrder: Image = .init("fiori.sales.order", bundle: Bundle.accessor)
        ///
        public static let salesQuote: Image = .init("fiori.sales.quote", bundle: Bundle.accessor)
        ///
        public static let sysFirstPage: Image = .init("fiori.sys.first.page", bundle: Bundle.accessor)
        ///
        public static let sysLastPage: Image = .init("fiori.sys.last.page", bundle: Bundle.accessor)
        ///
        public static let sysNextPage: Image = .init("fiori.sys.next.page", bundle: Bundle.accessor)
        ///
        public static let sysPrevPage: Image = .init("fiori.sys.prev.page", bundle: Bundle.accessor)
        ///
        public static let timesheet: Image = .init("fiori.timesheet", bundle: Bundle.accessor)
        ///
        public static let vdsFile: Image = .init("fiori.vds.file", bundle: Bundle.accessor)
        ///
        public static let writeNewDocument: Image = .init("fiori.write.new.document", bundle: Bundle.accessor)
    }

    public enum folder {
        ///
        public static let batchPayments: Image = .init("fiori.batch.payments", bundle: Bundle.accessor)
        ///
        public static let curriculum: Image = .init("fiori.curriculum", bundle: Bundle.accessor)
        ///
        public static let fallback: Image = .init("fiori.fallback", bundle: Bundle.accessor)
        ///
        public static let folder2: Image = .init("fiori.folder.2", bundle: Bundle.accessor)
        ///
        public static let folderBlank: Image = .init("fiori.folder.blank", bundle: Bundle.accessor)
        ///
        public static let folderFill: Image = .init("fiori.folder.fill", bundle: Bundle.accessor)
        ///
        public static let folderFull: Image = .init("fiori.folder.full", bundle: Bundle.accessor)
        ///
        public static let folder: Image = .init("fiori.folder", bundle: Bundle.accessor)
        ///
        public static let openFolder: Image = .init("fiori.open.folder", bundle: Bundle.accessor)
        ///
        public static let workHistory: Image = .init("fiori.work.history", bundle: Bundle.accessor)
    }

    public enum form {
        ///
        public static let approvals: Image = .init("fiori.approvals", bundle: Bundle.accessor)
        ///
        public static let createForm: Image = .init("fiori.create.form", bundle: Bundle.accessor)
        ///
        public static let customerOrderEntry: Image = .init("fiori.customer.order.entry", bundle: Bundle.accessor)
        ///
        public static let detailView: Image = .init("fiori.detail.view", bundle: Bundle.accessor)
        ///
        public static let form: Image = .init("fiori.form", bundle: Bundle.accessor)
        ///
        public static let receipt: Image = .init("fiori.receipt", bundle: Bundle.accessor)
        ///
        public static let survey: Image = .init("fiori.survey", bundle: Bundle.accessor)
    }

    public enum medical {
        ///
        public static let accidentalLeave: Image = .init("fiori.accidental.leave", bundle: Bundle.accessor)
        ///
        public static let bed: Image = .init("fiori.bed", bundle: Bundle.accessor)
        ///
        public static let clinicalOrder: Image = .init("fiori.clinical.order", bundle: Bundle.accessor)
        ///
        public static let clinicalTaskTracker: Image = .init("fiori.clinical.task.tracker", bundle: Bundle.accessor)
        ///
        public static let doctor: Image = .init("fiori.doctor", bundle: Bundle.accessor)
        ///
        public static let electrocardiogram: Image = .init("fiori.electrocardiogram", bundle: Bundle.accessor)
        ///
        public static let electronicMedicalRecord: Image = .init("fiori.electronic.medical.record", bundle: Bundle.accessor)
        ///
        public static let endoscopy: Image = .init("fiori.endoscopy", bundle: Bundle.accessor)
        ///
        public static let mriScan: Image = .init("fiori.mri.scan", bundle: Bundle.accessor)
        ///
        public static let nurse: Image = .init("fiori.nurse", bundle: Bundle.accessor)
        ///
        public static let nutritionActivity: Image = .init("fiori.nutrition.activity", bundle: Bundle.accessor)
        ///
        public static let pharmacy: Image = .init("fiori.pharmacy", bundle: Bundle.accessor)
        ///
        public static let physicalActivity: Image = .init("fiori.physical.activity", bundle: Bundle.accessor)
        ///
        public static let sonography: Image = .init("fiori.sonography", bundle: Bundle.accessor)
        ///
        public static let stethoscope: Image = .init("fiori.stethoscope", bundle: Bundle.accessor)
        ///
        public static let syringe: Image = .init("fiori.syringe", bundle: Bundle.accessor)
        ///
        public static let temperature: Image = .init("fiori.temperature", bundle: Bundle.accessor)
        ///
        public static let woundsDoc: Image = .init("fiori.wounds.doc", bundle: Bundle.accessor)
        ///
        public static let xRay: Image = .init("fiori.x.ray", bundle: Bundle.accessor)
    }

    public enum money {
        ///
        public static let batchPayments: Image = .init("fiori.batch.payments", bundle: Bundle.accessor)
        ///
        public static let capitalProjects: Image = .init("fiori.capital.projects", bundle: Bundle.accessor)
        ///
        public static let collectionsInsight: Image = .init("fiori.collections.insight", bundle: Bundle.accessor)
        ///
        public static let collectionsManagement: Image = .init("fiori.collections.management", bundle: Bundle.accessor)
        ///
        public static let commissionCheck: Image = .init("fiori.commission.check", bundle: Bundle.accessor)
        ///
        public static let currency: Image = .init("fiori.currency", bundle: Bundle.accessor)
        ///
        public static let customerFinancialFactSheet: Image = .init("fiori.customer.financial.fact.sheet", bundle: Bundle.accessor)
        ///
        public static let expenseReport: Image = .init("fiori.expense.report", bundle: Bundle.accessor)
        ///
        public static let leadOutdated: Image = .init("fiori.lead.outdated", bundle: Bundle.accessor)
        ///
        public static let lead: Image = .init("fiori.lead", bundle: Bundle.accessor)
        ///
        public static let loan: Image = .init("fiori.loan", bundle: Bundle.accessor)
        ///
        public static let moneyBills: Image = .init("fiori.money.bills", bundle: Bundle.accessor)
        ///
        public static let monitorPayments: Image = .init("fiori.monitor.payments", bundle: Bundle.accessor)
        ///
        public static let paidLeave: Image = .init("fiori.paid.leave", bundle: Bundle.accessor)
        ///
        public static let paymentApproval: Image = .init("fiori.payment.approval", bundle: Bundle.accessor)
        ///
        public static let perDiem: Image = .init("fiori.per.diem", bundle: Bundle.accessor)
        ///
        public static let receipt: Image = .init("fiori.receipt", bundle: Bundle.accessor)
        ///
        public static let salesDocument: Image = .init("fiori.sales.document", bundle: Bundle.accessor)
        ///
        public static let salesNotification: Image = .init("fiori.sales.notification", bundle: Bundle.accessor)
        ///
        public static let salesOrderItem: Image = .init("fiori.sales.order.item", bundle: Bundle.accessor)
        ///
        public static let salesOrder: Image = .init("fiori.sales.order", bundle: Bundle.accessor)
        ///
        public static let salesQuote: Image = .init("fiori.sales.quote", bundle: Bundle.accessor)
        ///
        public static let simplePayment: Image = .init("fiori.simple.payment", bundle: Bundle.accessor)
        ///
        public static let timeOvertime: Image = .init("fiori.time.overtime", bundle: Bundle.accessor)
        ///
        public static let travelExpenseReportFill: Image = .init("fiori.travel.expense.report.fill", bundle: Bundle.accessor)
        ///
        public static let travelExpenseReport: Image = .init("fiori.travel.expense.report", bundle: Bundle.accessor)
        ///
        public static let travelExpense: Image = .init("fiori.travel.expense", bundle: Bundle.accessor)
        ///
        public static let unpaidLeave: Image = .init("fiori.unpaid.leave", bundle: Bundle.accessor)
        ///
        public static let waiver: Image = .init("fiori.waiver", bundle: Bundle.accessor)
        ///
        public static let wallet: Image = .init("fiori.wallet", bundle: Bundle.accessor)
    }

    public enum objects {
        ///
        public static let addCoursebook: Image = .init("fiori.add.coursebook", bundle: Bundle.accessor)
        ///
        public static let addPhoto: Image = .init("fiori.add.photo", bundle: Bundle.accessor)
        ///
        public static let addProcess: Image = .init("fiori.add.process", bundle: Bundle.accessor)
        ///
        public static let addProduct: Image = .init("fiori.add.product", bundle: Bundle.accessor)
        ///
        public static let addressBook: Image = .init("fiori.address.book", bundle: Bundle.accessor)
        ///
        public static let addresses: Image = .init("fiori.addresses", bundle: Bundle.accessor)
        ///
        public static let arobase: Image = .init("fiori.arobase", bundle: Bundle.accessor)
        ///
        public static let background: Image = .init("fiori.background", bundle: Bundle.accessor)
        ///
        public static let badge: Image = .init("fiori.badge", bundle: Bundle.accessor)
        ///
        public static let barCode: Image = .init("fiori.bar.code", bundle: Bundle.accessor)
        ///
        public static let bbydActiveSales: Image = .init("fiori.bbyd.active.sales", bundle: Bundle.accessor)
        ///
        public static let bbydDashboard: Image = .init("fiori.bbyd.dashboard", bundle: Bundle.accessor)
        ///
        public static let bed: Image = .init("fiori.bed", bundle: Bundle.accessor)
        ///
        public static let bell2: Image = .init("fiori.bell.2", bundle: Bundle.accessor)
        ///
        public static let bell: Image = .init("fiori.bell", bundle: Bundle.accessor)
        ///
        public static let blankTag2: Image = .init("fiori.blank.tag.2", bundle: Bundle.accessor)
        ///
        public static let blankTag: Image = .init("fiori.blank.tag", bundle: Bundle.accessor)
        ///
        public static let boStrategyManagement: Image = .init("fiori.bo.strategy.management", bundle: Bundle.accessor)
        ///
        public static let border: Image = .init("fiori.border", bundle: Bundle.accessor)
        ///
        public static let brokenLink: Image = .init("fiori.broken.link", bundle: Bundle.accessor)
        ///
        public static let building: Image = .init("fiori.building", bundle: Bundle.accessor)
        ///
        public static let burglary: Image = .init("fiori.burglary", bundle: Bundle.accessor)
        ///
        public static let businessByDesign: Image = .init("fiori.business.by.design", bundle: Bundle.accessor)
        ///
        public static let businessCardFill: Image = .init("fiori.business.card.fill", bundle: Bundle.accessor)
        ///
        public static let businessCard: Image = .init("fiori.business.card", bundle: Bundle.accessor)
        ///
        public static let businessObjectsExplorer: Image = .init("fiori.business.objects.explorer", bundle: Bundle.accessor)
        ///
        public static let businessObjectsMobileFill: Image = .init("fiori.business.objects.mobile.fill", bundle: Bundle.accessor)
        ///
        public static let businessObjectsMobile: Image = .init("fiori.business.objects.mobile", bundle: Bundle.accessor)
        ///
        public static let businessOne: Image = .init("fiori.business.one", bundle: Bundle.accessor)
        ///
        public static let camera: Image = .init("fiori.camera", bundle: Bundle.accessor)
        ///
        public static let capitalProjects: Image = .init("fiori.capital.projects", bundle: Bundle.accessor)
        ///
        public static let card: Image = .init("fiori.card", bundle: Bundle.accessor)
        ///
        public static let chalkboard: Image = .init("fiori.chalkboard", bundle: Bundle.accessor)
        ///
        public static let checklist2: Image = .init("fiori.checklist.2", bundle: Bundle.accessor)
        ///
        public static let checklistItem2: Image = .init("fiori.checklist.item.2", bundle: Bundle.accessor)
        ///
        public static let checklistItem: Image = .init("fiori.checklist.item", bundle: Bundle.accessor)
        ///
        public static let checklist: Image = .init("fiori.checklist", bundle: Bundle.accessor)
        ///
        public static let chevronPhase2: Image = .init("fiori.chevron.phase.2", bundle: Bundle.accessor)
        ///
        public static let chevronPhase: Image = .init("fiori.chevron.phase", bundle: Bundle.accessor)
        ///
        public static let circleTask2: Image = .init("fiori.circle.task.2", bundle: Bundle.accessor)
        ///
        public static let circleTaskFill: Image = .init("fiori.circle.task.fill", bundle: Bundle.accessor)
        ///
        public static let circleTask: Image = .init("fiori.circle.task", bundle: Bundle.accessor)
        ///
        public static let cloudCheck: Image = .init("fiori.cloud.check", bundle: Bundle.accessor)
        ///
        public static let cloud: Image = .init("fiori.cloud", bundle: Bundle.accessor)
        ///
        public static let co: Image = .init("fiori.co", bundle: Bundle.accessor)
        ///
        public static let collectionsManagement: Image = .init("fiori.collections.management", bundle: Bundle.accessor)
        ///
        public static let collision: Image = .init("fiori.collision", bundle: Bundle.accessor)
        ///
        public static let colorFill: Image = .init("fiori.color.fill", bundle: Bundle.accessor)
        ///
        public static let compare2: Image = .init("fiori.compare.2", bundle: Bundle.accessor)
        ///
        public static let compare: Image = .init("fiori.compare", bundle: Bundle.accessor)
        ///
        public static let competitorFill: Image = .init("fiori.competitor.fill", bundle: Bundle.accessor)
        ///
        public static let competitor: Image = .init("fiori.competitor", bundle: Bundle.accessor)
        ///
        public static let contacts: Image = .init("fiori.contacts", bundle: Bundle.accessor)
        ///
        public static let courseBook: Image = .init("fiori.course.book", bundle: Bundle.accessor)
        ///
        public static let creditCard: Image = .init("fiori.credit.card", bundle: Bundle.accessor)
        ///
        public static let crmSales: Image = .init("fiori.crm.sales", bundle: Bundle.accessor)
        ///
        public static let cursorArrow: Image = .init("fiori.cursor.arrow", bundle: Bundle.accessor)
        ///
        public static let customerView: Image = .init("fiori.customer.view", bundle: Bundle.accessor)
        ///
        public static let database: Image = .init("fiori.database", bundle: Bundle.accessor)
        ///
        public static let dimension: Image = .init("fiori.dimension", bundle: Bundle.accessor)
        ///
        public static let dishwasher: Image = .init("fiori.dishwasher", bundle: Bundle.accessor)
        ///
        public static let drawRectangle: Image = .init("fiori.draw.rectangle", bundle: Bundle.accessor)
        ///
        public static let eCare: Image = .init("fiori.e.care", bundle: Bundle.accessor)
        ///
        public static let eLearning: Image = .init("fiori.e.learning", bundle: Bundle.accessor)
        ///
        public static let eamWorkOrder: Image = .init("fiori.eam.work.order", bundle: Bundle.accessor)
        ///
        public static let educationFill: Image = .init("fiori.education.fill", bundle: Bundle.accessor)
        ///
        public static let education: Image = .init("fiori.education", bundle: Bundle.accessor)
        ///
        public static let electronicMedicalRecord: Image = .init("fiori.electronic.medical.record", bundle: Bundle.accessor)
        ///
        public static let email: Image = .init("fiori.email", bundle: Bundle.accessor)
        ///
        public static let enablement: Image = .init("fiori.enablement", bundle: Bundle.accessor)
        ///
        public static let endUserExperienceMonitoring: Image = .init("fiori.end.user.experience.monitoring", bundle: Bundle.accessor)
        ///
        public static let endoscopy: Image = .init("fiori.endoscopy", bundle: Bundle.accessor)
        ///
        public static let energySavingLightbulb: Image = .init("fiori.energy.saving.lightbulb", bundle: Bundle.accessor)
        ///
        public static let example: Image = .init("fiori.example", bundle: Bundle.accessor)
        ///
        public static let explorer: Image = .init("fiori.explorer", bundle: Bundle.accessor)
        ///
        public static let factory: Image = .init("fiori.factory", bundle: Bundle.accessor)
        ///
        public static let filterAnalytics: Image = .init("fiori.filter.analytics", bundle: Bundle.accessor)
        ///
        public static let filterFacets: Image = .init("fiori.filter.facets", bundle: Bundle.accessor)
        ///
        public static let filterFields: Image = .init("fiori.filter.fields", bundle: Bundle.accessor)
        ///
        public static let fobWatchFill: Image = .init("fiori.fob.watch.fill", bundle: Bundle.accessor)
        ///
        public static let fobWatch: Image = .init("fiori.fob.watch", bundle: Bundle.accessor)
        ///
        public static let fridge: Image = .init("fiori.fridge", bundle: Bundle.accessor)
        ///
        public static let functionalLocation: Image = .init("fiori.functional.location", bundle: Bundle.accessor)
        ///
        public static let ganttBars: Image = .init("fiori.gantt.bars", bundle: Bundle.accessor)
        ///
        public static let globe: Image = .init("fiori.globe", bundle: Bundle.accessor)
        ///
        public static let goal: Image = .init("fiori.goal", bundle: Bundle.accessor)
        ///
        public static let goalseek: Image = .init("fiori.goalseek", bundle: Bundle.accessor)
        ///
        public static let grid: Image = .init("fiori.grid", bundle: Bundle.accessor)
        ///
        public static let header: Image = .init("fiori.header", bundle: Bundle.accessor)
        ///
        public static let headset: Image = .init("fiori.headset", bundle: Bundle.accessor)
        ///
        public static let heatingCooling: Image = .init("fiori.heating.cooling", bundle: Bundle.accessor)
        ///
        public static let helloWorld: Image = .init("fiori.hello.world", bundle: Bundle.accessor)
        ///
        public static let horizontalGrip: Image = .init("fiori.horizontal.grip", bundle: Bundle.accessor)
        ///
        public static let imageViewer: Image = .init("fiori.image.viewer", bundle: Bundle.accessor)
        ///
        public static let initiative: Image = .init("fiori.initiative", bundle: Bundle.accessor)
        ///
        public static let internetBrowser: Image = .init("fiori.internet.browser", bundle: Bundle.accessor)
        ///
        public static let ipad2: Image = .init("fiori.ipad.2", bundle: Bundle.accessor)
        ///
        public static let ipad: Image = .init("fiori.ipad", bundle: Bundle.accessor)
        ///
        public static let iphone2: Image = .init("fiori.iphone.2", bundle: Bundle.accessor)
        ///
        public static let iphone: Image = .init("fiori.iphone", bundle: Bundle.accessor)
        ///
        public static let itHost: Image = .init("fiori.it.host", bundle: Bundle.accessor)
        ///
        public static let itInstance: Image = .init("fiori.it.instance", bundle: Bundle.accessor)
        ///
        public static let itSystem: Image = .init("fiori.it.system", bundle: Bundle.accessor)
        ///
        public static let jam: Image = .init("fiori.jam", bundle: Bundle.accessor)
        ///
        public static let key: Image = .init("fiori.key", bundle: Bundle.accessor)
        ///
        public static let keyboardAndMouse: Image = .init("fiori.keyboard.and.mouse", bundle: Bundle.accessor)
        ///
        public static let kpiCorporatePerformance: Image = .init("fiori.kpi.corporate.performance", bundle: Bundle.accessor)
        ///
        public static let lab: Image = .init("fiori.lab", bundle: Bundle.accessor)
        ///
        public static let laptop: Image = .init("fiori.laptop", bundle: Bundle.accessor)
        ///
        public static let lateness: Image = .init("fiori.lateness", bundle: Bundle.accessor)
        ///
        public static let legend: Image = .init("fiori.legend", bundle: Bundle.accessor)
        ///
        public static let letter: Image = .init("fiori.letter", bundle: Bundle.accessor)
        ///
        public static let lightbulb: Image = .init("fiori.lightbulb", bundle: Bundle.accessor)
        ///
        public static let loan: Image = .init("fiori.loan", bundle: Bundle.accessor)
        ///
        public static let locked: Image = .init("fiori.locked", bundle: Bundle.accessor)
        ///
        public static let machine: Image = .init("fiori.machine", bundle: Bundle.accessor)
        ///
        public static let managerInsight: Image = .init("fiori.manager.insight", bundle: Bundle.accessor)
        ///
        public static let map2: Image = .init("fiori.map.2", bundle: Bundle.accessor)
        ///
        public static let map3Fill: Image = .init("fiori.map.3.fill", bundle: Bundle.accessor)
        ///
        public static let map3: Image = .init("fiori.map.3", bundle: Bundle.accessor)
        ///
        public static let mapFill: Image = .init("fiori.map.fill", bundle: Bundle.accessor)
        ///
        public static let map: Image = .init("fiori.map", bundle: Bundle.accessor)
        ///
        public static let marketingCampaign: Image = .init("fiori.marketing.campaign", bundle: Bundle.accessor)
        ///
        public static let masterTaskTriangle2: Image = .init("fiori.master.task.triangle.2", bundle: Bundle.accessor)
        ///
        public static let masterTaskTriangle: Image = .init("fiori.master.task.triangle", bundle: Bundle.accessor)
        ///
        public static let meal: Image = .init("fiori.meal", bundle: Bundle.accessor)
        ///
        public static let measure: Image = .init("fiori.measure", bundle: Bundle.accessor)
        ///
        public static let measurementDocument: Image = .init("fiori.measurement.document", bundle: Bundle.accessor)
        ///
        public static let measuringPoint: Image = .init("fiori.measuring.point", bundle: Bundle.accessor)
        ///
        public static let microphone: Image = .init("fiori.microphone", bundle: Bundle.accessor)
        ///
        public static let mileage: Image = .init("fiori.mileage", bundle: Bundle.accessor)
        ///
        public static let minimize: Image = .init("fiori.minimize", bundle: Bundle.accessor)
        ///
        public static let mirroredTaskCircle2: Image = .init("fiori.mirrored.task.circle.2", bundle: Bundle.accessor)
        ///
        public static let mirroredTaskCircle: Image = .init("fiori.mirrored.task.circle", bundle: Bundle.accessor)
        ///
        public static let myView: Image = .init("fiori.my.view", bundle: Bundle.accessor)
        ///
        public static let netweaverBusinessClient: Image = .init("fiori.netweaver.business.client", bundle: Bundle.accessor)
        ///
        public static let newspaper: Image = .init("fiori.newspaper", bundle: Bundle.accessor)
        ///
        public static let numberSign: Image = .init("fiori.number.sign", bundle: Bundle.accessor)
        ///
        public static let nutritionActivity: Image = .init("fiori.nutrition.activity", bundle: Bundle.accessor)
        ///
        public static let officialService: Image = .init("fiori.official.service", bundle: Bundle.accessor)
        ///
        public static let offsiteWork: Image = .init("fiori.offsite.work", bundle: Bundle.accessor)
        ///
        public static let opportunity: Image = .init("fiori.opportunity", bundle: Bundle.accessor)
        ///
        public static let overlay: Image = .init("fiori.overlay", bundle: Bundle.accessor)
        ///
        public static let palette: Image = .init("fiori.palette", bundle: Bundle.accessor)
        ///
        public static let paperPlane: Image = .init("fiori.paper.plane", bundle: Bundle.accessor)
        ///
        public static let performance: Image = .init("fiori.performance", bundle: Bundle.accessor)
        ///
        public static let phone: Image = .init("fiori.phone", bundle: Bundle.accessor)
        ///
        public static let photoVoltaic: Image = .init("fiori.photo.voltaic", bundle: Bundle.accessor)
        ///
        public static let picture: Image = .init("fiori.picture", bundle: Bundle.accessor)
        ///
        public static let pipelineAnalysis: Image = .init("fiori.pipeline.analysis", bundle: Bundle.accessor)
        ///
        public static let pool: Image = .init("fiori.pool", bundle: Bundle.accessor)
        ///
        public static let primaryKey: Image = .init("fiori.primary.key", bundle: Bundle.accessor)
        ///
        public static let print: Image = .init("fiori.print", bundle: Bundle.accessor)
        ///
        public static let productFill: Image = .init("fiori.product.fill", bundle: Bundle.accessor)
        ///
        public static let product: Image = .init("fiori.product", bundle: Bundle.accessor)
        ///
        public static let programTriangles2: Image = .init("fiori.program.triangles.2", bundle: Bundle.accessor)
        ///
        public static let programTrianglesFill: Image = .init("fiori.program.triangles.fill", bundle: Bundle.accessor)
        ///
        public static let programTriangles: Image = .init("fiori.program.triangles", bundle: Bundle.accessor)
        ///
        public static let projectDefinitionTriangle2: Image = .init("fiori.project.definition.triangle.2", bundle: Bundle.accessor)
        ///
        public static let projectDefinitionTriangle: Image = .init("fiori.project.definition.triangle", bundle: Bundle.accessor)
        ///
        public static let projector: Image = .init("fiori.projector", bundle: Bundle.accessor)
        ///
        public static let pushpinOff: Image = .init("fiori.pushpin.off", bundle: Bundle.accessor)
        ///
        public static let puzzle: Image = .init("fiori.puzzle", bundle: Bundle.accessor)
        ///
        public static let qrCode: Image = .init("fiori.qr.code", bundle: Bundle.accessor)
        ///
        public static let rhombusMilestone2: Image = .init("fiori.rhombus.milestone.2", bundle: Bundle.accessor)
        ///
        public static let rhombusMilestone: Image = .init("fiori.rhombus.milestone", bundle: Bundle.accessor)
        ///
        public static let s4hana: Image = .init("fiori.s4hana", bundle: Bundle.accessor)
        ///
        public static let sapBox: Image = .init("fiori.sap.box", bundle: Bundle.accessor)
        ///
        public static let sapLogoShape: Image = .init("fiori.sap.logo.shape", bundle: Bundle.accessor)
        ///
        public static let sapUi5: Image = .init("fiori.sap.ui5", bundle: Bundle.accessor)
        ///
        public static let save: Image = .init("fiori.save", bundle: Bundle.accessor)
        ///
        public static let scissors: Image = .init("fiori.scissors", bundle: Bundle.accessor)
        ///
        public static let screenSplitOne: Image = .init("fiori.screen.split.one", bundle: Bundle.accessor)
        ///
        public static let screenSplitThree: Image = .init("fiori.screen.split.three", bundle: Bundle.accessor)
        ///
        public static let screenSplitTwo: Image = .init("fiori.screen.split.two", bundle: Bundle.accessor)
        ///
        public static let shelf: Image = .init("fiori.shelf", bundle: Bundle.accessor)
        ///
        public static let shield: Image = .init("fiori.shield", bundle: Bundle.accessor)
        ///
        public static let simulate: Image = .init("fiori.simulate", bundle: Bundle.accessor)
        ///
        public static let soccer: Image = .init("fiori.soccer", bundle: Bundle.accessor)
        ///
        public static let soundLoud: Image = .init("fiori.sound.loud", bundle: Bundle.accessor)
        ///
        public static let soundOff: Image = .init("fiori.sound.off", bundle: Bundle.accessor)
        ///
        public static let sound: Image = .init("fiori.sound", bundle: Bundle.accessor)
        ///
        public static let studyLeaveFill: Image = .init("fiori.study.leave.fill", bundle: Bundle.accessor)
        ///
        public static let studyLeave: Image = .init("fiori.study.leave", bundle: Bundle.accessor)
        ///
        public static let suitcaseFill: Image = .init("fiori.suitcase.fill", bundle: Bundle.accessor)
        ///
        public static let suitcase: Image = .init("fiori.suitcase", bundle: Bundle.accessor)
        ///
        public static let sysMonitor: Image = .init("fiori.sys.monitor", bundle: Bundle.accessor)
        ///
        public static let tableChart: Image = .init("fiori.table.chart", bundle: Bundle.accessor)
        ///
        public static let tableColumn: Image = .init("fiori.table.column", bundle: Bundle.accessor)
        ///
        public static let tableRow: Image = .init("fiori.table.row", bundle: Bundle.accessor)
        ///
        public static let tableView: Image = .init("fiori.table.view", bundle: Bundle.accessor)
        ///
        public static let tag: Image = .init("fiori.tag", bundle: Bundle.accessor)
        ///
        public static let tags: Image = .init("fiori.tags", bundle: Bundle.accessor)
        ///
        public static let targetGroupFill: Image = .init("fiori.target.group.fill", bundle: Bundle.accessor)
        ///
        public static let targetGroup: Image = .init("fiori.target.group", bundle: Bundle.accessor)
        ///
        public static let technicalObject: Image = .init("fiori.technical.object", bundle: Bundle.accessor)
        ///
        public static let temperature: Image = .init("fiori.temperature", bundle: Bundle.accessor)
        ///
        public static let theater: Image = .init("fiori.theater", bundle: Bundle.accessor)
        ///
        public static let toasterDown: Image = .init("fiori.toaster.down", bundle: Bundle.accessor)
        ///
        public static let toasterTop: Image = .init("fiori.toaster.top", bundle: Bundle.accessor)
        ///
        public static let toasterUp: Image = .init("fiori.toaster.up", bundle: Bundle.accessor)
        ///
        public static let toolsOpportunityFill: Image = .init("fiori.tools.opportunity.fill", bundle: Bundle.accessor)
        ///
        public static let toolsOpportunity: Image = .init("fiori.tools.opportunity", bundle: Bundle.accessor)
        ///
        public static let touch: Image = .init("fiori.touch", bundle: Bundle.accessor)
        ///
        public static let tree: Image = .init("fiori.tree", bundle: Bundle.accessor)
        ///
        public static let twoKeys: Image = .init("fiori.two.keys", bundle: Bundle.accessor)
        ///
        public static let umbrella: Image = .init("fiori.umbrella", bundle: Bundle.accessor)
        ///
        public static let unlocked: Image = .init("fiori.unlocked", bundle: Bundle.accessor)
        ///
        public static let unwired: Image = .init("fiori.unwired", bundle: Bundle.accessor)
        ///
        public static let verticalGrip: Image = .init("fiori.vertical.grip", bundle: Bundle.accessor)
        ///
        public static let video: Image = .init("fiori.video", bundle: Bundle.accessor)
        ///
        public static let wallet: Image = .init("fiori.wallet", bundle: Bundle.accessor)
        ///
        public static let washingMachine: Image = .init("fiori.washing.machine", bundle: Bundle.accessor)
        ///
        public static let weatherProofing: Image = .init("fiori.weather.proofing", bundle: Bundle.accessor)
        ///
        public static let webCam: Image = .init("fiori.web.cam", bundle: Bundle.accessor)
        ///
        public static let widgets: Image = .init("fiori.widgets", bundle: Bundle.accessor)
        ///
        public static let windowsDoors: Image = .init("fiori.windows.doors", bundle: Bundle.accessor)
        ///
        public static let world: Image = .init("fiori.world", bundle: Bundle.accessor)
    }

    public enum people {
        ///
        public static let accessibility: Image = .init("fiori.accessibility", bundle: Bundle.accessor)
        ///
        public static let account: Image = .init("fiori.account", bundle: Bundle.accessor)
        ///
        public static let activityIndividual: Image = .init("fiori.activity.individual", bundle: Bundle.accessor)
        ///
        public static let addContact: Image = .init("fiori.add.contact", bundle: Bundle.accessor)
        ///
        public static let addEmployee: Image = .init("fiori.add.employee", bundle: Bundle.accessor)
        ///
        public static let biometricFace: Image = .init("fiori.biometric.face", bundle: Bundle.accessor)
        ///
        public static let biometricThumb: Image = .init("fiori.biometric.thumb", bundle: Bundle.accessor)
        ///
        public static let businessCardFill: Image = .init("fiori.business.card.fill", bundle: Bundle.accessor)
        ///
        public static let businessCard: Image = .init("fiori.business.card", bundle: Bundle.accessor)
        ///
        public static let citizenConnect: Image = .init("fiori.citizen.connect", bundle: Bundle.accessor)
        ///
        public static let collaborateFill: Image = .init("fiori.collaborate.fill", bundle: Bundle.accessor)
        ///
        public static let collaborate: Image = .init("fiori.collaborate", bundle: Bundle.accessor)
        ///
        public static let companyViewFill: Image = .init("fiori.company.view.fill", bundle: Bundle.accessor)
        ///
        public static let companyView: Image = .init("fiori.company.view", bundle: Bundle.accessor)
        ///
        public static let customerAndContacts: Image = .init("fiori.customer.and.contacts", bundle: Bundle.accessor)
        ///
        public static let customerAndSupplier: Image = .init("fiori.customer.and.supplier", bundle: Bundle.accessor)
        ///
        public static let customerBriefing: Image = .init("fiori.customer.briefing", bundle: Bundle.accessor)
        ///
        public static let customerFill: Image = .init("fiori.customer.fill", bundle: Bundle.accessor)
        ///
        public static let customerHistory: Image = .init("fiori.customer.history", bundle: Bundle.accessor)
        ///
        public static let customer: Image = .init("fiori.customer", bundle: Bundle.accessor)
        ///
        public static let decision: Image = .init("fiori.decision", bundle: Bundle.accessor)
        ///
        public static let doctor: Image = .init("fiori.doctor", bundle: Bundle.accessor)
        ///
        public static let employeeApprovals: Image = .init("fiori.employee.approvals", bundle: Bundle.accessor)
        ///
        public static let employeeLookup: Image = .init("fiori.employee.lookup", bundle: Bundle.accessor)
        ///
        public static let employeePane: Image = .init("fiori.employee.pane", bundle: Bundle.accessor)
        ///
        public static let employeeRejections: Image = .init("fiori.employee.rejections", bundle: Bundle.accessor)
        ///
        public static let employee: Image = .init("fiori.employee", bundle: Bundle.accessor)
        ///
        public static let familyCare: Image = .init("fiori.family.care", bundle: Bundle.accessor)
        ///
        public static let familyProtection: Image = .init("fiori.family.protection", bundle: Bundle.accessor)
        ///
        public static let female: Image = .init("fiori.female", bundle: Bundle.accessor)
        ///
        public static let genderMaleAndFemale: Image = .init("fiori.gender.male.and.female", bundle: Bundle.accessor)
        ///
        public static let group: Image = .init("fiori.group", bundle: Bundle.accessor)
        ///
        public static let hrApproval: Image = .init("fiori.hr.approval", bundle: Bundle.accessor)
        ///
        public static let ideaWall: Image = .init("fiori.idea.wall", bundle: Bundle.accessor)
        ///
        public static let kpiManagingMyArea: Image = .init("fiori.kpi.managing.my.area", bundle: Bundle.accessor)
        ///
        public static let leads: Image = .init("fiori.leads", bundle: Bundle.accessor)
        ///
        public static let learningAssistant: Image = .init("fiori.learning.assistant", bundle: Bundle.accessor)
        ///
        public static let male: Image = .init("fiori.male", bundle: Bundle.accessor)
        ///
        public static let manager: Image = .init("fiori.manager", bundle: Bundle.accessor)
        ///
        public static let meetingRoom: Image = .init("fiori.meeting.room", bundle: Bundle.accessor)
        ///
        public static let monitorPayments: Image = .init("fiori.monitor.payments", bundle: Bundle.accessor)
        ///
        public static let mySalesOrder: Image = .init("fiori.my.sales.order", bundle: Bundle.accessor)
        ///
        public static let myView: Image = .init("fiori.my.view", bundle: Bundle.accessor)
        ///
        public static let nonBinary: Image = .init("fiori.non.binary", bundle: Bundle.accessor)
        ///
        public static let nurse: Image = .init("fiori.nurse", bundle: Bundle.accessor)
        ///
        public static let opportunities: Image = .init("fiori.opportunities", bundle: Bundle.accessor)
        ///
        public static let peopleConnected: Image = .init("fiori.people.connected", bundle: Bundle.accessor)
        ///
        public static let personPlaceholderFill: Image = .init("fiori.person.placeholder.fill", bundle: Bundle.accessor)
        ///
        public static let personPlaceholder: Image = .init("fiori.person.placeholder", bundle: Bundle.accessor)
        ///
        public static let personnelView: Image = .init("fiori.personnel.view", bundle: Bundle.accessor)
        ///
        public static let physicalActivity: Image = .init("fiori.physical.activity", bundle: Bundle.accessor)
        ///
        public static let privateIcon: Image = .init("fiori.private", bundle: Bundle.accessor)
        ///
        public static let role: Image = .init("fiori.role", bundle: Bundle.accessor)
        ///
        public static let supplier: Image = .init("fiori.supplier", bundle: Bundle.accessor)
        ///
        public static let switchClasses: Image = .init("fiori.switch.classes", bundle: Bundle.accessor)
        ///
        public static let userEdit: Image = .init("fiori.user.edit", bundle: Bundle.accessor)
        ///
        public static let userSettings: Image = .init("fiori.user.settings", bundle: Bundle.accessor)
        ///
        public static let visits: Image = .init("fiori.visits", bundle: Bundle.accessor)
        ///
        public static let woundsDoc: Image = .init("fiori.wounds.doc", bundle: Bundle.accessor)
    }

    public enum places {
        ///
        public static let building: Image = .init("fiori.building", bundle: Bundle.accessor)
        ///
        public static let capitalProjects: Image = .init("fiori.capital.projects", bundle: Bundle.accessor)
        ///
        public static let cloud: Image = .init("fiori.cloud", bundle: Bundle.accessor)
        ///
        public static let createLeaveRequest: Image = .init("fiori.create.leave.request", bundle: Bundle.accessor)
        ///
        public static let doctor: Image = .init("fiori.doctor", bundle: Bundle.accessor)
        ///
        public static let factory: Image = .init("fiori.factory", bundle: Bundle.accessor)
        ///
        public static let generalLeaveRequest: Image = .init("fiori.general.leave.request", bundle: Bundle.accessor)
        ///
        public static let globe: Image = .init("fiori.globe", bundle: Bundle.accessor)
        ///
        public static let homeFill: Image = .init("fiori.home.fill", bundle: Bundle.accessor)
        ///
        public static let homeShare: Image = .init("fiori.home.share", bundle: Bundle.accessor)
        ///
        public static let home: Image = .init("fiori.home", bundle: Bundle.accessor)
        ///
        public static let jam: Image = .init("fiori.jam", bundle: Bundle.accessor)
        ///
        public static let locateMe: Image = .init("fiori.locate.me", bundle: Bundle.accessor)
        ///
        public static let map2: Image = .init("fiori.map.2", bundle: Bundle.accessor)
        ///
        public static let map3Fill: Image = .init("fiori.map.3.fill", bundle: Bundle.accessor)
        ///
        public static let map3: Image = .init("fiori.map.3", bundle: Bundle.accessor)
        ///
        public static let mapFill: Image = .init("fiori.map.fill", bundle: Bundle.accessor)
        ///
        public static let map: Image = .init("fiori.map", bundle: Bundle.accessor)
        ///
        public static let meal: Image = .init("fiori.meal", bundle: Bundle.accessor)
        ///
        public static let mileage: Image = .init("fiori.mileage", bundle: Bundle.accessor)
        ///
        public static let officialService: Image = .init("fiori.official.service", bundle: Bundle.accessor)
        ///
        public static let offsiteWork: Image = .init("fiori.offsite.work", bundle: Bundle.accessor)
        ///
        public static let pool: Image = .init("fiori.pool", bundle: Bundle.accessor)
        ///
        public static let retailStore: Image = .init("fiori.retail.store", bundle: Bundle.accessor)
        ///
        public static let theater: Image = .init("fiori.theater", bundle: Bundle.accessor)
        ///
        public static let world: Image = .init("fiori.world", bundle: Bundle.accessor)
    }

    public enum shopping {
        ///
        public static let basketFill: Image = .init("fiori.basket.fill", bundle: Bundle.accessor)
        ///
        public static let basket: Image = .init("fiori.basket", bundle: Bundle.accessor)
        ///
        public static let cart2: Image = .init("fiori.cart.2", bundle: Bundle.accessor)
        ///
        public static let cart3: Image = .init("fiori.cart.3", bundle: Bundle.accessor)
        ///
        public static let cart4: Image = .init("fiori.cart.4", bundle: Bundle.accessor)
        ///
        public static let cart5: Image = .init("fiori.cart.5", bundle: Bundle.accessor)
        ///
        public static let cartApproval: Image = .init("fiori.cart.approval", bundle: Bundle.accessor)
        ///
        public static let cartFull: Image = .init("fiori.cart.full", bundle: Bundle.accessor)
        ///
        public static let cart: Image = .init("fiori.cart", bundle: Bundle.accessor)
        ///
        public static let retailStoreManager: Image = .init("fiori.retail.store.manager", bundle: Bundle.accessor)
        ///
        public static let retailStore: Image = .init("fiori.retail.store", bundle: Bundle.accessor)
    }

    public enum status {
        ///
        public static let accidentalLeave: Image = .init("fiori.accidental.leave", bundle: Bundle.accessor)
        ///
        public static let alert: Image = .init("fiori.alert", bundle: Bundle.accessor)
        ///
        public static let appearOffline: Image = .init("fiori.appear.offline", bundle: Bundle.accessor)
        ///
        public static let away: Image = .init("fiori.away", bundle: Bundle.accessor)
        ///
        public static let badge: Image = .init("fiori.badge", bundle: Bundle.accessor)
        ///
        public static let bookmark: Image = .init("fiori.bookmark", bundle: Bundle.accessor)
        ///
        public static let brokenLink: Image = .init("fiori.broken.link", bundle: Bundle.accessor)
        ///
        public static let busy: Image = .init("fiori.busy", bundle: Bundle.accessor)
        ///
        public static let cancelMaintenance: Image = .init("fiori.cancel.maintenance", bundle: Bundle.accessor)
        ///
        public static let cancelShare: Image = .init("fiori.cancel.share", bundle: Bundle.accessor)
        ///
        public static let cancel: Image = .init("fiori.cancel", bundle: Bundle.accessor)
        ///
        public static let connected: Image = .init("fiori.connected", bundle: Bundle.accessor)
        ///
        public static let decision: Image = .init("fiori.decision", bundle: Bundle.accessor)
        ///
        public static let disconnected: Image = .init("fiori.disconnected", bundle: Bundle.accessor)
        ///
        public static let employeeApprovals: Image = .init("fiori.employee.approvals", bundle: Bundle.accessor)
        ///
        public static let employeeRejections: Image = .init("fiori.employee.rejections", bundle: Bundle.accessor)
        ///
        public static let error: Image = .init("fiori.error", bundle: Bundle.accessor)
        ///
        public static let flag: Image = .init("fiori.flag", bundle: Bundle.accessor)
        ///
        public static let goal: Image = .init("fiori.goal", bundle: Bundle.accessor)
        ///
        public static let goalseek: Image = .init("fiori.goalseek", bundle: Bundle.accessor)
        ///
        public static let highPriority: Image = .init("fiori.high.priority", bundle: Bundle.accessor)
        ///
        public static let history: Image = .init("fiori.history", bundle: Bundle.accessor)
        ///
        public static let hrApproval: Image = .init("fiori.hr.approval", bundle: Bundle.accessor)
        ///
        public static let inProgress: Image = .init("fiori.in.progress", bundle: Bundle.accessor)
        ///
        public static let incident: Image = .init("fiori.incident", bundle: Bundle.accessor)
        ///
        public static let information: Image = .init("fiori.information", bundle: Bundle.accessor)
        ///
        public static let lab: Image = .init("fiori.lab", bundle: Bundle.accessor)
        ///
        public static let lateness: Image = .init("fiori.lateness", bundle: Bundle.accessor)
        ///
        public static let leadOutdated: Image = .init("fiori.lead.outdated", bundle: Bundle.accessor)
        ///
        public static let lead: Image = .init("fiori.lead", bundle: Bundle.accessor)
        ///
        public static let locked: Image = .init("fiori.locked", bundle: Bundle.accessor)
        ///
        public static let messageError: Image = .init("fiori.message.error", bundle: Bundle.accessor)
        ///
        public static let messageInformation: Image = .init("fiori.message.information", bundle: Bundle.accessor)
        ///
        public static let messagePopup: Image = .init("fiori.message.popup", bundle: Bundle.accessor)
        ///
        public static let messageSuccess: Image = .init("fiori.message.success", bundle: Bundle.accessor)
        ///
        public static let messageWarning: Image = .init("fiori.message.warning", bundle: Bundle.accessor)
        ///
        public static let notificationFill: Image = .init("fiori.notification.fill", bundle: Bundle.accessor)
        ///
        public static let notification: Image = .init("fiori.notification", bundle: Bundle.accessor)
        ///
        public static let permission: Image = .init("fiori.permission", bundle: Bundle.accessor)
        ///
        public static let privateIcon: Image = .init("fiori.private", bundle: Bundle.accessor)
        ///
        public static let qualityIssue: Image = .init("fiori.quality.issue", bundle: Bundle.accessor)
        ///
        public static let questionMark: Image = .init("fiori.question.mark", bundle: Bundle.accessor)
        ///
        public static let role: Image = .init("fiori.role", bundle: Bundle.accessor)
        ///
        public static let statusCompleted: Image = .init("fiori.status.completed", bundle: Bundle.accessor)
        ///
        public static let statusCritical: Image = .init("fiori.status.critical", bundle: Bundle.accessor)
        ///
        public static let statusError: Image = .init("fiori.status.error", bundle: Bundle.accessor)
        ///
        public static let statusInProcess: Image = .init("fiori.status.in.process", bundle: Bundle.accessor)
        ///
        public static let statusInactive: Image = .init("fiori.status.inactive", bundle: Bundle.accessor)
        ///
        public static let statusNegative: Image = .init("fiori.status.negative", bundle: Bundle.accessor)
        ///
        public static let statusPositive: Image = .init("fiori.status.positive", bundle: Bundle.accessor)
        ///
        public static let sysCancel: Image = .init("fiori.sys.cancel", bundle: Bundle.accessor)
        ///
        public static let sysEnter2: Image = .init("fiori.sys.enter.2", bundle: Bundle.accessor)
        ///
        public static let sysEnterFill: Image = .init("fiori.sys.enter.fill", bundle: Bundle.accessor)
        ///
        public static let sysEnter: Image = .init("fiori.sys.enter", bundle: Bundle.accessor)
        ///
        public static let sysHelp2: Image = .init("fiori.sys.help.2", bundle: Bundle.accessor)
        ///
        public static let sysHelpFill: Image = .init("fiori.sys.help.fill", bundle: Bundle.accessor)
        ///
        public static let sysHelp: Image = .init("fiori.sys.help", bundle: Bundle.accessor)
        ///
        public static let targetGroupFill: Image = .init("fiori.target.group.fill", bundle: Bundle.accessor)
        ///
        public static let targetGroup: Image = .init("fiori.target.group", bundle: Bundle.accessor)
        ///
        public static let temperature: Image = .init("fiori.temperature", bundle: Bundle.accessor)
        ///
        public static let toBeReviewed: Image = .init("fiori.to.be.reviewed", bundle: Bundle.accessor)
        ///
        public static let travelRequest: Image = .init("fiori.travel.request", bundle: Bundle.accessor)
        ///
        public static let tripReport: Image = .init("fiori.trip.report", bundle: Bundle.accessor)
        ///
        public static let unlocked: Image = .init("fiori.unlocked", bundle: Bundle.accessor)
        ///
        public static let validate: Image = .init("fiori.validate", bundle: Bundle.accessor)
        ///
        public static let warning: Image = .init("fiori.warning", bundle: Bundle.accessor)
        ///
        public static let warning2: Image = .init("fiori.warning2", bundle: Bundle.accessor)
    }

    public enum tables {
        ///
        public static let chartTableView: Image = .init("fiori.chart.table.view", bundle: Bundle.accessor)
        ///
        public static let checklist2: Image = .init("fiori.checklist.2", bundle: Bundle.accessor)
        ///
        public static let checklistItem2: Image = .init("fiori.checklist.item.2", bundle: Bundle.accessor)
        ///
        public static let checklistItem: Image = .init("fiori.checklist.item", bundle: Bundle.accessor)
        ///
        public static let checklist: Image = .init("fiori.checklist", bundle: Bundle.accessor)
        ///
        public static let chevronPhase2: Image = .init("fiori.chevron.phase.2", bundle: Bundle.accessor)
        ///
        public static let chevronPhase: Image = .init("fiori.chevron.phase", bundle: Bundle.accessor)
        ///
        public static let circleTask2: Image = .init("fiori.circle.task.2", bundle: Bundle.accessor)
        ///
        public static let circleTaskFill: Image = .init("fiori.circle.task.fill", bundle: Bundle.accessor)
        ///
        public static let circleTask: Image = .init("fiori.circle.task", bundle: Bundle.accessor)
        ///
        public static let clearAll: Image = .init("fiori.clear.all", bundle: Bundle.accessor)
        ///
        public static let detailLess: Image = .init("fiori.detail.less", bundle: Bundle.accessor)
        ///
        public static let detailMore: Image = .init("fiori.detail.more", bundle: Bundle.accessor)
        ///
        public static let masterTaskTriangle2: Image = .init("fiori.master.task.triangle.2", bundle: Bundle.accessor)
        ///
        public static let masterTaskTriangle: Image = .init("fiori.master.task.triangle", bundle: Bundle.accessor)
        ///
        public static let mirroredTaskCircle2: Image = .init("fiori.mirrored.task.circle.2", bundle: Bundle.accessor)
        ///
        public static let mirroredTaskCircle: Image = .init("fiori.mirrored.task.circle", bundle: Bundle.accessor)
        ///
        public static let programTriangles2: Image = .init("fiori.program.triangles.2", bundle: Bundle.accessor)
        ///
        public static let programTrianglesFill: Image = .init("fiori.program.triangles.fill", bundle: Bundle.accessor)
        ///
        public static let programTriangles: Image = .init("fiori.program.triangles", bundle: Bundle.accessor)
        ///
        public static let projectDefinitionTriangle2: Image = .init("fiori.project.definition.triangle.2", bundle: Bundle.accessor)
        ///
        public static let projectDefinitionTriangle: Image = .init("fiori.project.definition.triangle", bundle: Bundle.accessor)
        ///
        public static let provision: Image = .init("fiori.provision", bundle: Bundle.accessor)
        ///
        public static let rhombusMilestone2: Image = .init("fiori.rhombus.milestone.2", bundle: Bundle.accessor)
        ///
        public static let rhombusMilestone: Image = .init("fiori.rhombus.milestone", bundle: Bundle.accessor)
        ///
        public static let sum: Image = .init("fiori.sum", bundle: Bundle.accessor)
        ///
        public static let tableChart: Image = .init("fiori.table.chart", bundle: Bundle.accessor)
        ///
        public static let tableColumn: Image = .init("fiori.table.column", bundle: Bundle.accessor)
        ///
        public static let tableRow: Image = .init("fiori.table.row", bundle: Bundle.accessor)
        ///
        public static let tableView: Image = .init("fiori.table.view", bundle: Bundle.accessor)
        ///
        public static let triState: Image = .init("fiori.tri.state", bundle: Bundle.accessor)
    }

    public enum text {
        ///
        public static let boldText: Image = .init("fiori.bold.text", bundle: Bundle.accessor)
        ///
        public static let bulletTextFill: Image = .init("fiori.bullet.text.fill", bundle: Bundle.accessor)
        ///
        public static let bulletText: Image = .init("fiori.bullet.text", bundle: Bundle.accessor)
        ///
        public static let cursorArrow: Image = .init("fiori.cursor.arrow", bundle: Bundle.accessor)
        ///
        public static let decreaseLineHeight: Image = .init("fiori.decrease.line.height", bundle: Bundle.accessor)
        ///
        public static let detailLess: Image = .init("fiori.detail.less", bundle: Bundle.accessor)
        ///
        public static let detailMore: Image = .init("fiori.detail.more", bundle: Bundle.accessor)
        ///
        public static let fx: Image = .init("fiori.fx", bundle: Bundle.accessor)
        ///
        public static let heading1: Image = .init("fiori.heading1", bundle: Bundle.accessor)
        ///
        public static let heading2: Image = .init("fiori.heading2", bundle: Bundle.accessor)
        ///
        public static let heading3: Image = .init("fiori.heading3", bundle: Bundle.accessor)
        ///
        public static let hint: Image = .init("fiori.hint", bundle: Bundle.accessor)
        ///
        public static let increaseLineHeight: Image = .init("fiori.increase.line.height", bundle: Bundle.accessor)
        ///
        public static let indent: Image = .init("fiori.indent", bundle: Bundle.accessor)
        ///
        public static let italicText: Image = .init("fiori.italic.text", bundle: Bundle.accessor)
        ///
        public static let numberedText: Image = .init("fiori.numbered.text", bundle: Bundle.accessor)
        ///
        public static let outdent: Image = .init("fiori.outdent", bundle: Bundle.accessor)
        ///
        public static let strikethrough: Image = .init("fiori.strikethrough", bundle: Bundle.accessor)
        ///
        public static let syntax: Image = .init("fiori.syntax", bundle: Bundle.accessor)
        ///
        public static let textAlignCenter: Image = .init("fiori.text.align.center", bundle: Bundle.accessor)
        ///
        public static let textAlignJustified: Image = .init("fiori.text.align.justified", bundle: Bundle.accessor)
        ///
        public static let textAlignLeft: Image = .init("fiori.text.align.left", bundle: Bundle.accessor)
        ///
        public static let textAlignRight: Image = .init("fiori.text.align.right", bundle: Bundle.accessor)
        ///
        public static let textColor: Image = .init("fiori.text.color", bundle: Bundle.accessor)
        ///
        public static let textFormatting: Image = .init("fiori.text.formatting", bundle: Bundle.accessor)
        ///
        public static let text: Image = .init("fiori.text", bundle: Bundle.accessor)
        ///
        public static let translate: Image = .init("fiori.translate", bundle: Bundle.accessor)
        ///
        public static let underlineText: Image = .init("fiori.underline.text", bundle: Bundle.accessor)
    }

    public enum things {
        ///
        public static let basketFill: Image = .init("fiori.basket.fill", bundle: Bundle.accessor)
        ///
        public static let basket: Image = .init("fiori.basket", bundle: Bundle.accessor)
        ///
        public static let bed: Image = .init("fiori.bed", bundle: Bundle.accessor)
        ///
        public static let calendarFill: Image = .init("fiori.calendar.fill", bundle: Bundle.accessor)
        ///
        public static let calendar: Image = .init("fiori.calendar", bundle: Bundle.accessor)
        ///
        public static let camera: Image = .init("fiori.camera", bundle: Bundle.accessor)
        ///
        public static let cart: Image = .init("fiori.cart", bundle: Bundle.accessor)
        ///
        public static let cloud: Image = .init("fiori.cloud", bundle: Bundle.accessor)
        ///
        public static let compare2: Image = .init("fiori.compare.2", bundle: Bundle.accessor)
        ///
        public static let competitorFill: Image = .init("fiori.competitor.fill", bundle: Bundle.accessor)
        ///
        public static let competitor: Image = .init("fiori.competitor", bundle: Bundle.accessor)
        ///
        public static let courseBook: Image = .init("fiori.course.book", bundle: Bundle.accessor)
        ///
        public static let database: Image = .init("fiori.database", bundle: Bundle.accessor)
        ///
        public static let dishwasher: Image = .init("fiori.dishwasher", bundle: Bundle.accessor)
        ///
        public static let display: Image = .init("fiori.display", bundle: Bundle.accessor)
        ///
        public static let eCare: Image = .init("fiori.e.care", bundle: Bundle.accessor)
        ///
        public static let educationFill: Image = .init("fiori.education.fill", bundle: Bundle.accessor)
        ///
        public static let education: Image = .init("fiori.education", bundle: Bundle.accessor)
        ///
        public static let energySavingLightbulb: Image = .init("fiori.energy.saving.lightbulb", bundle: Bundle.accessor)
        ///
        public static let eraser: Image = .init("fiori.eraser", bundle: Bundle.accessor)
        ///
        public static let explorer: Image = .init("fiori.explorer", bundle: Bundle.accessor)
        ///
        public static let fridge: Image = .init("fiori.fridge", bundle: Bundle.accessor)
        ///
        public static let ipad2: Image = .init("fiori.ipad.2", bundle: Bundle.accessor)
        ///
        public static let ipad: Image = .init("fiori.ipad", bundle: Bundle.accessor)
        ///
        public static let iphone2: Image = .init("fiori.iphone.2", bundle: Bundle.accessor)
        ///
        public static let iphone: Image = .init("fiori.iphone", bundle: Bundle.accessor)
        ///
        public static let jam: Image = .init("fiori.jam", bundle: Bundle.accessor)
        ///
        public static let key: Image = .init("fiori.key", bundle: Bundle.accessor)
        ///
        public static let lab: Image = .init("fiori.lab", bundle: Bundle.accessor)
        ///
        public static let laptop: Image = .init("fiori.laptop", bundle: Bundle.accessor)
        ///
        public static let machine: Image = .init("fiori.machine", bundle: Bundle.accessor)
        ///
        public static let marketingCampaign: Image = .init("fiori.marketing.campaign", bundle: Bundle.accessor)
        ///
        public static let meal: Image = .init("fiori.meal", bundle: Bundle.accessor)
        ///
        public static let microphone: Image = .init("fiori.microphone", bundle: Bundle.accessor)
        ///
        public static let mileage: Image = .init("fiori.mileage", bundle: Bundle.accessor)
        ///
        public static let nutritionActivity: Image = .init("fiori.nutrition.activity", bundle: Bundle.accessor)
        ///
        public static let palette: Image = .init("fiori.palette", bundle: Bundle.accessor)
        ///
        public static let paperPlane: Image = .init("fiori.paper.plane", bundle: Bundle.accessor)
        ///
        public static let pharmacy: Image = .init("fiori.pharmacy", bundle: Bundle.accessor)
        ///
        public static let phone: Image = .init("fiori.phone", bundle: Bundle.accessor)
        ///
        public static let picture: Image = .init("fiori.picture", bundle: Bundle.accessor)
        ///
        public static let post: Image = .init("fiori.post", bundle: Bundle.accessor)
        ///
        public static let projector: Image = .init("fiori.projector", bundle: Bundle.accessor)
        ///
        public static let puzzle: Image = .init("fiori.puzzle", bundle: Bundle.accessor)
        ///
        public static let sapUi5: Image = .init("fiori.sap.ui5", bundle: Bundle.accessor)
        ///
        public static let simulate: Image = .init("fiori.simulate", bundle: Bundle.accessor)
        ///
        public static let soccer: Image = .init("fiori.soccer", bundle: Bundle.accessor)
        ///
        public static let stethoscope: Image = .init("fiori.stethoscope", bundle: Bundle.accessor)
        ///
        public static let studyLeaveFill: Image = .init("fiori.study.leave.fill", bundle: Bundle.accessor)
        ///
        public static let studyLeave: Image = .init("fiori.study.leave", bundle: Bundle.accessor)
        ///
        public static let suitcaseFill: Image = .init("fiori.suitcase.fill", bundle: Bundle.accessor)
        ///
        public static let suitcase: Image = .init("fiori.suitcase", bundle: Bundle.accessor)
        ///
        public static let sysFind: Image = .init("fiori.sys.find", bundle: Bundle.accessor)
        ///
        public static let sysMonitor: Image = .init("fiori.sys.monitor", bundle: Bundle.accessor)
        ///
        public static let tags: Image = .init("fiori.tags", bundle: Bundle.accessor)
        ///
        public static let temperature: Image = .init("fiori.temperature", bundle: Bundle.accessor)
        ///
        public static let umbrella: Image = .init("fiori.umbrella", bundle: Bundle.accessor)
        ///
        public static let video: Image = .init("fiori.video", bundle: Bundle.accessor)
        ///
        public static let wallet: Image = .init("fiori.wallet", bundle: Bundle.accessor)
        ///
        public static let washingMachine: Image = .init("fiori.washing.machine", bundle: Bundle.accessor)
        ///
        public static let webCam: Image = .init("fiori.web.cam", bundle: Bundle.accessor)
        ///
        public static let wrench: Image = .init("fiori.wrench", bundle: Bundle.accessor)
    }

    public enum time {
        ///
        public static let createEntryTime: Image = .init("fiori.create.entry.time", bundle: Bundle.accessor)
        ///
        public static let customerHistory: Image = .init("fiori.customer.history", bundle: Bundle.accessor)
        ///
        public static let fobWatchFill: Image = .init("fiori.fob.watch.fill", bundle: Bundle.accessor)
        ///
        public static let fobWatch: Image = .init("fiori.fob.watch", bundle: Bundle.accessor)
        ///
        public static let future: Image = .init("fiori.future", bundle: Bundle.accessor)
        ///
        public static let history: Image = .init("fiori.history", bundle: Bundle.accessor)
        ///
        public static let instance: Image = .init("fiori.instance", bundle: Bundle.accessor)
        ///
        public static let lateness: Image = .init("fiori.lateness", bundle: Bundle.accessor)
        ///
        public static let lineChartTimeAxis: Image = .init("fiori.line.chart.time.axis", bundle: Bundle.accessor)
        ///
        public static let past: Image = .init("fiori.past", bundle: Bundle.accessor)
        ///
        public static let pending: Image = .init("fiori.pending", bundle: Bundle.accessor)
        ///
        public static let present: Image = .init("fiori.present", bundle: Bundle.accessor)
        ///
        public static let timeAccount: Image = .init("fiori.time.account", bundle: Bundle.accessor)
        ///
        public static let timeEntryRequest: Image = .init("fiori.time.entry.request", bundle: Bundle.accessor)
        ///
        public static let timeOvertime: Image = .init("fiori.time.overtime", bundle: Bundle.accessor)
        ///
        public static let timesheet: Image = .init("fiori.timesheet", bundle: Bundle.accessor)
    }

    public enum transport {
        ///
        public static let busPublicTransport: Image = .init("fiori.bus.public.transport", bundle: Bundle.accessor)
        ///
        public static let carRentalFill: Image = .init("fiori.car.rental.fill", bundle: Bundle.accessor)
        ///
        public static let carRental: Image = .init("fiori.car.rental", bundle: Bundle.accessor)
        ///
        public static let cargoTrain: Image = .init("fiori.cargo.train", bundle: Bundle.accessor)
        ///
        public static let collision: Image = .init("fiori.collision", bundle: Bundle.accessor)
        ///
        public static let flight: Image = .init("fiori.flight", bundle: Bundle.accessor)
        ///
        public static let inventory: Image = .init("fiori.inventory", bundle: Bundle.accessor)
        ///
        public static let passengerTrain: Image = .init("fiori.passenger.train", bundle: Bundle.accessor)
        ///
        public static let shippingStatus: Image = .init("fiori.shipping.status", bundle: Bundle.accessor)
        ///
        public static let subwayTrain: Image = .init("fiori.subway.train", bundle: Bundle.accessor)
        ///
        public static let taxi: Image = .init("fiori.taxi", bundle: Bundle.accessor)
        ///
        public static let travelExpenseReportFill: Image = .init("fiori.travel.expense.report.fill", bundle: Bundle.accessor)
        ///
        public static let travelExpenseReport: Image = .init("fiori.travel.expense.report", bundle: Bundle.accessor)
        ///
        public static let travelExpense: Image = .init("fiori.travel.expense", bundle: Bundle.accessor)
        ///
        public static let travelItinerary: Image = .init("fiori.travel.itinerary", bundle: Bundle.accessor)
        ///
        public static let travelRequest: Image = .init("fiori.travel.request", bundle: Bundle.accessor)
        ///
        public static let tripReport: Image = .init("fiori.trip.report", bundle: Bundle.accessor)
        ///
        public static let vehicleRepair: Image = .init("fiori.vehicle.repair", bundle: Bundle.accessor)
    }

    public enum travel {
        ///
        public static let bed: Image = .init("fiori.bed", bundle: Bundle.accessor)
        ///
        public static let busPublicTransport: Image = .init("fiori.bus.public.transport", bundle: Bundle.accessor)
        ///
        public static let carRentalFill: Image = .init("fiori.car.rental.fill", bundle: Bundle.accessor)
        ///
        public static let carRental: Image = .init("fiori.car.rental", bundle: Bundle.accessor)
        ///
        public static let cargoTrain: Image = .init("fiori.cargo.train", bundle: Bundle.accessor)
        ///
        public static let doctor: Image = .init("fiori.doctor", bundle: Bundle.accessor)
        ///
        public static let flight: Image = .init("fiori.flight", bundle: Bundle.accessor)
        ///
        public static let homeFill: Image = .init("fiori.home.fill", bundle: Bundle.accessor)
        ///
        public static let home: Image = .init("fiori.home", bundle: Bundle.accessor)
        ///
        public static let meal: Image = .init("fiori.meal", bundle: Bundle.accessor)
        ///
        public static let passengerTrain: Image = .init("fiori.passenger.train", bundle: Bundle.accessor)
        ///
        public static let physicalActivity: Image = .init("fiori.physical.activity", bundle: Bundle.accessor)
        ///
        public static let shippingStatus: Image = .init("fiori.shipping.status", bundle: Bundle.accessor)
        ///
        public static let subwayTrain: Image = .init("fiori.subway.train", bundle: Bundle.accessor)
        ///
        public static let suitcaseFill: Image = .init("fiori.suitcase.fill", bundle: Bundle.accessor)
        ///
        public static let suitcase: Image = .init("fiori.suitcase", bundle: Bundle.accessor)
        ///
        public static let taxi: Image = .init("fiori.taxi", bundle: Bundle.accessor)
        ///
        public static let travelExpense: Image = .init("fiori.travel.expense", bundle: Bundle.accessor)
        ///
        public static let travelItinerary: Image = .init("fiori.travel.itinerary", bundle: Bundle.accessor)
        ///
        public static let world: Image = .init("fiori.world", bundle: Bundle.accessor)
    }
}

/// Initializer in Image extension to allow developers to access by fiori icon name
public extension Image {
    init?(fioriName: String) {
        self.init(fioriName, bundle: Bundle.accessor)
    }
}
