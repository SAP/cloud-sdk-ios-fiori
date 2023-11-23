import Foundation
import SwiftUI
import UIKit

/// Public list of icons available for reference by the Developer.
public enum FioriIcon {
    public enum actions {
        ///
        public static let accept = Image(fioriName: "fiori.accept")
        ///
        public static let actionSettingsFill = Image(fioriName: "fiori.action.settings.fill")
        ///
        public static let actionSettings = Image(fioriName: "fiori.action.settings")
        ///
        public static let action = Image(fioriName: "fiori.action")
        ///
        public static let activate = Image(fioriName: "fiori.activate")
        ///
        public static let activities = Image(fioriName: "fiori.activities")
        ///
        public static let addActivity = Image(fioriName: "fiori.add.activity")
        ///
        public static let addCoursebook = Image(fioriName: "fiori.add.coursebook")
        ///
        public static let addDocument = Image(fioriName: "fiori.add.document")
        ///
        public static let addEmployee = Image(fioriName: "fiori.add.employee")
        ///
        public static let addEquipment = Image(fioriName: "fiori.add.equipment")
        ///
        public static let addFavorite = Image(fioriName: "fiori.add.favorite")
        ///
        public static let addFilter = Image(fioriName: "fiori.add.filter")
        ///
        public static let addFolder = Image(fioriName: "fiori.add.folder")
        ///
        public static let addPhoto = Image(fioriName: "fiori.add.photo")
        ///
        public static let addProcess = Image(fioriName: "fiori.add.process")
        ///
        public static let addProduct = Image(fioriName: "fiori.add.product")
        ///
        public static let add = Image(fioriName: "fiori.add")
        ///
        public static let alphabeticalOrder = Image(fioriName: "fiori.alphabetical.order")
        ///
        public static let attachment = Image(fioriName: "fiori.attachment")
        ///
        public static let backToTop = Image(fioriName: "fiori.back.to.top")
        ///
        public static let begin = Image(fioriName: "fiori.begin")
        ///
        public static let blur = Image(fioriName: "fiori.blur")
        ///
        public static let boldText = Image(fioriName: "fiori.bold.text")
        ///
        public static let bookmark = Image(fioriName: "fiori.bookmark")
        ///
        public static let bulletTextFill = Image(fioriName: "fiori.bullet.text.fill")
        ///
        public static let bulletText = Image(fioriName: "fiori.bullet.text")
        ///
        public static let call = Image(fioriName: "fiori.call")
        ///
        public static let camera = Image(fioriName: "fiori.camera")
        ///
        public static let cancelMaintenance = Image(fioriName: "fiori.cancel.maintenance")
        ///
        public static let cancelShare = Image(fioriName: "fiori.cancel.share")
        ///
        public static let cancel = Image(fioriName: "fiori.cancel")
        ///
        public static let cause = Image(fioriName: "fiori.cause")
        ///
        public static let chainLink = Image(fioriName: "fiori.chain.link")
        ///
        public static let clearFilter = Image(fioriName: "fiori.clear.filter")
        ///
        public static let collapseGroup = Image(fioriName: "fiori.collapse.group")
        ///
        public static let collapse = Image(fioriName: "fiori.collapse")
        ///
        public static let comment = Image(fioriName: "fiori.comment")
        ///
        public static let compare2 = Image(fioriName: "fiori.compare.2")
        ///
        public static let complete = Image(fioriName: "fiori.complete")
        ///
        public static let copy = Image(fioriName: "fiori.copy")
        ///
        public static let createEntryTime = Image(fioriName: "fiori.create.entry.time")
        ///
        public static let createForm = Image(fioriName: "fiori.create.form")
        ///
        public static let createLeaveRequest = Image(fioriName: "fiori.create.leave.request")
        ///
        public static let createSession = Image(fioriName: "fiori.create.session")
        ///
        public static let create = Image(fioriName: "fiori.create")
        ///
        public static let crop = Image(fioriName: "fiori.crop")
        ///
        public static let cursorArrow = Image(fioriName: "fiori.cursor.arrow")
        ///
        public static let customize = Image(fioriName: "fiori.customize")
        ///
        public static let decline = Image(fioriName: "fiori.decline")
        ///
        public static let decreaseLineHeight = Image(fioriName: "fiori.decrease.line.height")
        ///
        public static let deleteFill = Image(fioriName: "fiori.delete.fill")
        ///
        public static let delete = Image(fioriName: "fiori.delete")
        ///
        public static let detailView = Image(fioriName: "fiori.detail.view")
        ///
        public static let developerSettings = Image(fioriName: "fiori.developer.settings")
        ///
        public static let disconnected = Image(fioriName: "fiori.disconnected")
        ///
        public static let displayMore = Image(fioriName: "fiori.display.more")
        ///
        public static let display = Image(fioriName: "fiori.display")
        ///
        public static let down = Image(fioriName: "fiori.down")
        ///
        public static let downloadFromCloud = Image(fioriName: "fiori.download.from.cloud")
        ///
        public static let download = Image(fioriName: "fiori.download")
        ///
        public static let drawRectangle = Image(fioriName: "fiori.draw.rectangle")
        ///
        public static let drillDown = Image(fioriName: "fiori.drill.down")
        ///
        public static let drillUp = Image(fioriName: "fiori.drill.up")
        ///
        public static let dropDownList = Image(fioriName: "fiori.drop.down.list")
        ///
        public static let dropdown = Image(fioriName: "fiori.dropdown")
        ///
        public static let duplicate = Image(fioriName: "fiori.duplicate")
        ///
        public static let editOutside = Image(fioriName: "fiori.edit.outside")
        ///
        public static let edit = Image(fioriName: "fiori.edit")
        ///
        public static let emailRead = Image(fioriName: "fiori.email.read")
        ///
        public static let email = Image(fioriName: "fiori.email")
        ///
        public static let enterMore = Image(fioriName: "fiori.enter.more")
        ///
        public static let eraser = Image(fioriName: "fiori.eraser")
        ///
        public static let exitFullScreen = Image(fioriName: "fiori.exit.full.screen")
        ///
        public static let expandGroup = Image(fioriName: "fiori.expand.group")
        ///
        public static let expand = Image(fioriName: "fiori.expand")
        ///
        public static let favoriteList = Image(fioriName: "fiori.favorite.list")
        ///
        public static let favorite = Image(fioriName: "fiori.favorite")
        ///
        public static let faxMachine = Image(fioriName: "fiori.fax.machine")
        ///
        public static let feed = Image(fioriName: "fiori.feed")
        ///
        public static let filterFill = Image(fioriName: "fiori.filter.fill")
        ///
        public static let filter = Image(fioriName: "fiori.filter")
        ///
        public static let flag = Image(fioriName: "fiori.flag")
        ///
        public static let fullScreen = Image(fioriName: "fiori.full.screen")
        ///
        public static let fx = Image(fioriName: "fiori.fx")
        ///
        public static let generalLeaveRequest = Image(fioriName: "fiori.general.leave.request")
        ///
        public static let generateShortcut = Image(fioriName: "fiori.generate.shortcut")
        ///
        public static let group2 = Image(fioriName: "fiori.group.2")
        ///
        public static let heading1 = Image(fioriName: "fiori.heading1")
        ///
        public static let heading2 = Image(fioriName: "fiori.heading2")
        ///
        public static let heading3 = Image(fioriName: "fiori.heading3")
        ///
        public static let hide = Image(fioriName: "fiori.hide")
        ///
        public static let hint = Image(fioriName: "fiori.hint")
        ///
        public static let homeFill = Image(fioriName: "fiori.home.fill")
        ///
        public static let homeShare = Image(fioriName: "fiori.home.share")
        ///
        public static let home = Image(fioriName: "fiori.home")
        ///
        public static let horizontalGrip = Image(fioriName: "fiori.horizontal.grip")
        ///
        public static let imageViewer = Image(fioriName: "fiori.image.viewer")
        ///
        public static let inboxFill = Image(fioriName: "fiori.inbox.fill")
        ///
        public static let inbox = Image(fioriName: "fiori.inbox")
        ///
        public static let incomingCall = Image(fioriName: "fiori.incoming.call")
        ///
        public static let increaseLineHeight = Image(fioriName: "fiori.increase.line.height")
        ///
        public static let indent = Image(fioriName: "fiori.indent")
        ///
        public static let inspectDown = Image(fioriName: "fiori.inspect.down")
        ///
        public static let inspect = Image(fioriName: "fiori.inspect")
        ///
        public static let inspection = Image(fioriName: "fiori.inspection")
        ///
        public static let italicText = Image(fioriName: "fiori.italic.text")
        ///
        public static let journeyArrive = Image(fioriName: "fiori.journey.arrive")
        ///
        public static let journeyChange = Image(fioriName: "fiori.journey.change")
        ///
        public static let journeyDepart = Image(fioriName: "fiori.journey.depart")
        ///
        public static let keyUserSettings = Image(fioriName: "fiori.key.user.settings")
        ///
        public static let keyboardAndMouse = Image(fioriName: "fiori.keyboard.and.mouse")
        ///
        public static let legend = Image(fioriName: "fiori.legend")
        ///
        public static let less = Image(fioriName: "fiori.less")
        ///
        public static let list = Image(fioriName: "fiori.list")
        ///
        public static let locateMe = Image(fioriName: "fiori.locate.me")
        ///
        public static let locked = Image(fioriName: "fiori.locked")
        ///
        public static let log = Image(fioriName: "fiori.log")
        ///
        public static let mediaForward = Image(fioriName: "fiori.media.forward")
        ///
        public static let mediaPause = Image(fioriName: "fiori.media.pause")
        ///
        public static let mediaPlay = Image(fioriName: "fiori.media.play")
        ///
        public static let mediaReverse = Image(fioriName: "fiori.media.reverse")
        ///
        public static let mediaRewind = Image(fioriName: "fiori.media.rewind")
        ///
        public static let menuFill = Image(fioriName: "fiori.menu.fill")
        ///
        public static let menu = Image(fioriName: "fiori.menu")
        ///
        public static let menu2 = Image(fioriName: "fiori.menu2")
        ///
        public static let microphone = Image(fioriName: "fiori.microphone")
        ///
        public static let minimize = Image(fioriName: "fiori.minimize")
        ///
        public static let move = Image(fioriName: "fiori.move")
        ///
        public static let multiSelect = Image(fioriName: "fiori.multi.select")
        ///
        public static let multiselectAll = Image(fioriName: "fiori.multiselect.all")
        ///
        public static let multiselectNone = Image(fioriName: "fiori.multiselect.none")
        ///
        public static let myView = Image(fioriName: "fiori.my.view")
        ///
        public static let navBack = Image(fioriName: "fiori.nav.back")
        ///
        public static let navigationDownArrow = Image(fioriName: "fiori.navigation.down.arrow")
        ///
        public static let navigationLeftArrow = Image(fioriName: "fiori.navigation.left.arrow")
        ///
        public static let navigationRightArrow = Image(fioriName: "fiori.navigation.right.arrow")
        ///
        public static let navigationUpArrow = Image(fioriName: "fiori.navigation.up.arrow")
        ///
        public static let negative = Image(fioriName: "fiori.negative")
        ///
        public static let notes = Image(fioriName: "fiori.notes")
        ///
        public static let notification2 = Image(fioriName: "fiori.notification.2")
        ///
        public static let numberedText = Image(fioriName: "fiori.numbered.text")
        ///
        public static let openCommandField = Image(fioriName: "fiori.open.command.field")
        ///
        public static let outbox = Image(fioriName: "fiori.outbox")
        ///
        public static let outdent = Image(fioriName: "fiori.outdent")
        ///
        public static let outgoingCall = Image(fioriName: "fiori.outgoing.call")
        ///
        public static let overflow = Image(fioriName: "fiori.overflow")
        ///
        public static let paging = Image(fioriName: "fiori.paging")
        ///
        public static let paperPlane = Image(fioriName: "fiori.paper.plane")
        ///
        public static let paste = Image(fioriName: "fiori.paste")
        ///
        public static let pause = Image(fioriName: "fiori.pause")
        ///
        public static let paymentApproval = Image(fioriName: "fiori.payment.approval")
        ///
        public static let pdfReader = Image(fioriName: "fiori.pdf.reader")
        ///
        public static let phone = Image(fioriName: "fiori.phone")
        ///
        public static let pixelate = Image(fioriName: "fiori.pixelate")
        ///
        public static let play = Image(fioriName: "fiori.play")
        ///
        public static let popupWindow = Image(fioriName: "fiori.popup.window")
        ///
        public static let positive = Image(fioriName: "fiori.positive")
        ///
        public static let post = Image(fioriName: "fiori.post")
        ///
        public static let print = Image(fioriName: "fiori.print")
        ///
        public static let process = Image(fioriName: "fiori.process")
        ///
        public static let projector = Image(fioriName: "fiori.projector")
        ///
        public static let pullDown = Image(fioriName: "fiori.pull.down")
        ///
        public static let pushpinOff = Image(fioriName: "fiori.pushpin.off")
        ///
        public static let pushpinOn = Image(fioriName: "fiori.pushpin.on")
        ///
        public static let receipt = Image(fioriName: "fiori.receipt")
        ///
        public static let record = Image(fioriName: "fiori.record")
        ///
        public static let redo = Image(fioriName: "fiori.redo")
        ///
        public static let refresh = Image(fioriName: "fiori.refresh")
        ///
        public static let repost = Image(fioriName: "fiori.repost")
        ///
        public static let request = Image(fioriName: "fiori.request")
        ///
        public static let reset = Image(fioriName: "fiori.reset")
        ///
        public static let resizeCorner = Image(fioriName: "fiori.resize.corner")
        ///
        public static let resizeHorizontal = Image(fioriName: "fiori.resize.horizontal")
        ///
        public static let resize = Image(fioriName: "fiori.resize")
        ///
        public static let resizeVertical = Image(fioriName: "fiori.resize.vertical")
        ///
        public static let response = Image(fioriName: "fiori.response")
        ///
        public static let restart = Image(fioriName: "fiori.restart")
        ///
        public static let save = Image(fioriName: "fiori.save")
        ///
        public static let scissors = Image(fioriName: "fiori.scissors")
        ///
        public static let search = Image(fioriName: "fiori.search")
        ///
        public static let settings = Image(fioriName: "fiori.settings")
        ///
        public static let share2 = Image(fioriName: "fiori.share.2")
        ///
        public static let share = Image(fioriName: "fiori.share")
        ///
        public static let shield = Image(fioriName: "fiori.shield")
        ///
        public static let shortcut = Image(fioriName: "fiori.shortcut")
        ///
        public static let show = Image(fioriName: "fiori.show")
        ///
        public static let signature = Image(fioriName: "fiori.signature")
        ///
        public static let simulate = Image(fioriName: "fiori.simulate")
        ///
        public static let slimArrowDown = Image(fioriName: "fiori.slim.arrow.down")
        ///
        public static let slimArrowLeft = Image(fioriName: "fiori.slim.arrow.left")
        ///
        public static let slimArrowRight = Image(fioriName: "fiori.slim.arrow.right")
        ///
        public static let slimArrowUp = Image(fioriName: "fiori.slim.arrow.up")
        ///
        public static let sortAscending = Image(fioriName: "fiori.sort.ascending")
        ///
        public static let sortDescending = Image(fioriName: "fiori.sort.descending")
        ///
        public static let sort = Image(fioriName: "fiori.sort")
        ///
        public static let sortingRanking = Image(fioriName: "fiori.sorting.ranking")
        ///
        public static let soundLoud = Image(fioriName: "fiori.sound.loud")
        ///
        public static let soundOff = Image(fioriName: "fiori.sound.off")
        ///
        public static let sound = Image(fioriName: "fiori.sound")
        ///
        public static let step = Image(fioriName: "fiori.step")
        ///
        public static let stop = Image(fioriName: "fiori.stop")
        ///
        public static let switchClasses = Image(fioriName: "fiori.switch.classes")
        ///
        public static let switchViews = Image(fioriName: "fiori.switch.views")
        ///
        public static let synchronize = Image(fioriName: "fiori.synchronize")
        ///
        public static let syntax = Image(fioriName: "fiori.syntax")
        ///
        public static let syringe = Image(fioriName: "fiori.syringe")
        ///
        public static let sysAdd = Image(fioriName: "fiori.sys.add")
        ///
        public static let sysBack2 = Image(fioriName: "fiori.sys.back.2")
        ///
        public static let sysBack = Image(fioriName: "fiori.sys.back")
        ///
        public static let sysCancel2 = Image(fioriName: "fiori.sys.cancel.2")
        ///
        public static let sysCancel = Image(fioriName: "fiori.sys.cancel")
        ///
        public static let sysEnter2 = Image(fioriName: "fiori.sys.enter.2")
        ///
        public static let sysEnterFill = Image(fioriName: "fiori.sys.enter.fill")
        ///
        public static let sysEnter = Image(fioriName: "fiori.sys.enter")
        ///
        public static let sysFindNext = Image(fioriName: "fiori.sys.find.next")
        ///
        public static let sysFind = Image(fioriName: "fiori.sys.find")
        ///
        public static let sysFirstPage = Image(fioriName: "fiori.sys.first.page")
        ///
        public static let sysHelp2 = Image(fioriName: "fiori.sys.help.2")
        ///
        public static let sysHelpFill = Image(fioriName: "fiori.sys.help.fill")
        ///
        public static let sysHelp = Image(fioriName: "fiori.sys.help")
        ///
        public static let sysLastPage = Image(fioriName: "fiori.sys.last.page")
        ///
        public static let sysMinus = Image(fioriName: "fiori.sys.minus")
        ///
        public static let sysNextPage = Image(fioriName: "fiori.sys.next.page")
        ///
        public static let sysPrevPage = Image(fioriName: "fiori.sys.prev.page")
        ///
        public static let systemExit2 = Image(fioriName: "fiori.system.exit.2")
        ///
        public static let systemExit = Image(fioriName: "fiori.system.exit")
        ///
        public static let tag = Image(fioriName: "fiori.tag")
        ///
        public static let tags = Image(fioriName: "fiori.tags")
        ///
        public static let textAlignCenter = Image(fioriName: "fiori.text.align.center")
        ///
        public static let textAlignJustified = Image(fioriName: "fiori.text.align.justified")
        ///
        public static let textAlignLeft = Image(fioriName: "fiori.text.align.left")
        ///
        public static let textAlignRight = Image(fioriName: "fiori.text.align.right")
        ///
        public static let textFormatting = Image(fioriName: "fiori.text.formatting")
        ///
        public static let thumbDown = Image(fioriName: "fiori.thumb.down")
        ///
        public static let thumbUp = Image(fioriName: "fiori.thumb.up")
        ///
        public static let toasterDown = Image(fioriName: "fiori.toaster.down")
        ///
        public static let toasterUp = Image(fioriName: "fiori.toaster.up")
        ///
        public static let touch = Image(fioriName: "fiori.touch")
        ///
        public static let trendDown = Image(fioriName: "fiori.trend.down")
        ///
        public static let trendUp = Image(fioriName: "fiori.trend.up")
        ///
        public static let uiNotifications = Image(fioriName: "fiori.ui.notifications")
        ///
        public static let underlineText = Image(fioriName: "fiori.underline.text")
        ///
        public static let undo = Image(fioriName: "fiori.undo")
        ///
        public static let unfavorite = Image(fioriName: "fiori.unfavorite")
        ///
        public static let unlocked = Image(fioriName: "fiori.unlocked")
        ///
        public static let up = Image(fioriName: "fiori.up")
        ///
        public static let upload = Image(fioriName: "fiori.upload")
        ///
        public static let uploadToCloud = Image(fioriName: "fiori.upload.to.cloud")
        ///
        public static let userEdit = Image(fioriName: "fiori.user.edit")
        ///
        public static let userSettings = Image(fioriName: "fiori.user.settings")
        ///
        public static let validate = Image(fioriName: "fiori.validate")
        ///
        public static let valueHelp = Image(fioriName: "fiori.value.help")
        ///
        public static let verticalGrip = Image(fioriName: "fiori.vertical.grip")
        ///
        public static let video = Image(fioriName: "fiori.video")
        ///
        public static let visits = Image(fioriName: "fiori.visits")
        ///
        public static let webCam = Image(fioriName: "fiori.web.cam")
        ///
        public static let workflowTasks = Image(fioriName: "fiori.workflow.tasks")
        ///
        public static let wrench = Image(fioriName: "fiori.wrench")
        ///
        public static let writeNewDocument = Image(fioriName: "fiori.write.new.document")
        ///
        public static let writeNew = Image(fioriName: "fiori.write.new")
        ///
        public static let zoomIn = Image(fioriName: "fiori.zoom.in")
        ///
        public static let zoomOut = Image(fioriName: "fiori.zoom.out")
    }

    public enum arrows {
        ///
        public static let arrowBottom = Image(fioriName: "fiori.arrow.bottom")
        ///
        public static let arrowDown = Image(fioriName: "fiori.arrow.down")
        ///
        public static let arrowLeft = Image(fioriName: "fiori.arrow.left")
        ///
        public static let arrowRight = Image(fioriName: "fiori.arrow.right")
        ///
        public static let arrowTop = Image(fioriName: "fiori.arrow.top")
        ///
        public static let backToTop = Image(fioriName: "fiori.back.to.top")
        ///
        public static let begin = Image(fioriName: "fiori.begin")
        ///
        public static let cause = Image(fioriName: "fiori.cause")
        ///
        public static let chartAxis = Image(fioriName: "fiori.chart.axis")
        ///
        public static let closeCommandField = Image(fioriName: "fiori.close.command.field")
        ///
        public static let collapseAll = Image(fioriName: "fiori.collapse.all")
        ///
        public static let collapseGroup = Image(fioriName: "fiori.collapse.group")
        ///
        public static let combine = Image(fioriName: "fiori.combine")
        ///
        public static let down = Image(fioriName: "fiori.down")
        ///
        public static let downloadFromCloud = Image(fioriName: "fiori.download.from.cloud")
        ///
        public static let download = Image(fioriName: "fiori.download")
        ///
        public static let drillDown = Image(fioriName: "fiori.drill.down")
        ///
        public static let drillUp = Image(fioriName: "fiori.drill.up")
        ///
        public static let dropDownList = Image(fioriName: "fiori.drop.down.list")
        ///
        public static let dropdown = Image(fioriName: "fiori.dropdown")
        ///
        public static let duplicate = Image(fioriName: "fiori.duplicate")
        ///
        public static let editOutside = Image(fioriName: "fiori.edit.outside")
        ///
        public static let enterMore = Image(fioriName: "fiori.enter.more")
        ///
        public static let expandAll = Image(fioriName: "fiori.expand.all")
        ///
        public static let expandGroup = Image(fioriName: "fiori.expand.group")
        ///
        public static let feederArrow = Image(fioriName: "fiori.feeder.arrow")
        ///
        public static let forward = Image(fioriName: "fiori.forward")
        ///
        public static let fullScreen = Image(fioriName: "fiori.full.screen")
        ///
        public static let inboxFill = Image(fioriName: "fiori.inbox.fill")
        ///
        public static let inbox = Image(fioriName: "fiori.inbox")
        ///
        public static let initiative = Image(fioriName: "fiori.initiative")
        ///
        public static let inspect = Image(fioriName: "fiori.inspect")
        ///
        public static let journeyArrive = Image(fioriName: "fiori.journey.arrive")
        ///
        public static let journeyChange = Image(fioriName: "fiori.journey.change")
        ///
        public static let journeyDepart = Image(fioriName: "fiori.journey.depart")
        ///
        public static let locateMe = Image(fioriName: "fiori.locate.me")
        ///
        public static let mediaForward = Image(fioriName: "fiori.media.forward")
        ///
        public static let mediaPause = Image(fioriName: "fiori.media.pause")
        ///
        public static let mediaPlay = Image(fioriName: "fiori.media.play")
        ///
        public static let mediaReverse = Image(fioriName: "fiori.media.reverse")
        ///
        public static let mediaRewind = Image(fioriName: "fiori.media.rewind")
        ///
        public static let move = Image(fioriName: "fiori.move")
        ///
        public static let navBack = Image(fioriName: "fiori.nav.back")
        ///
        public static let navigationDownArrow = Image(fioriName: "fiori.navigation.down.arrow")
        ///
        public static let navigationLeftArrow = Image(fioriName: "fiori.navigation.left.arrow")
        ///
        public static let navigationRightArrow = Image(fioriName: "fiori.navigation.right.arrow")
        ///
        public static let navigationUpArrow = Image(fioriName: "fiori.navigation.up.arrow")
        ///
        public static let openCommandField = Image(fioriName: "fiori.open.command.field")
        ///
        public static let play = Image(fioriName: "fiori.play")
        ///
        public static let process = Image(fioriName: "fiori.process")
        ///
        public static let pullDown = Image(fioriName: "fiori.pull.down")
        ///
        public static let redo = Image(fioriName: "fiori.redo")
        ///
        public static let refresh = Image(fioriName: "fiori.refresh")
        ///
        public static let repost = Image(fioriName: "fiori.repost")
        ///
        public static let reset = Image(fioriName: "fiori.reset")
        ///
        public static let resizeHorizontal = Image(fioriName: "fiori.resize.horizontal")
        ///
        public static let resize = Image(fioriName: "fiori.resize")
        ///
        public static let resizeVertical = Image(fioriName: "fiori.resize.vertical")
        ///
        public static let response = Image(fioriName: "fiori.response")
        ///
        public static let restart = Image(fioriName: "fiori.restart")
        ///
        public static let share = Image(fioriName: "fiori.share")
        ///
        public static let shortcut = Image(fioriName: "fiori.shortcut")
        ///
        public static let slimArrowDown = Image(fioriName: "fiori.slim.arrow.down")
        ///
        public static let slimArrowLeft = Image(fioriName: "fiori.slim.arrow.left")
        ///
        public static let slimArrowRight = Image(fioriName: "fiori.slim.arrow.right")
        ///
        public static let slimArrowUp = Image(fioriName: "fiori.slim.arrow.up")
        ///
        public static let sortAscending = Image(fioriName: "fiori.sort.ascending")
        ///
        public static let sortDescending = Image(fioriName: "fiori.sort.descending")
        ///
        public static let sort = Image(fioriName: "fiori.sort")
        ///
        public static let sortingRanking = Image(fioriName: "fiori.sorting.ranking")
        ///
        public static let sourceCode = Image(fioriName: "fiori.source.code")
        ///
        public static let split = Image(fioriName: "fiori.split")
        ///
        public static let step = Image(fioriName: "fiori.step")
        ///
        public static let synchronize = Image(fioriName: "fiori.synchronize")
        ///
        public static let sysBack2 = Image(fioriName: "fiori.sys.back.2")
        ///
        public static let sysBack = Image(fioriName: "fiori.sys.back")
        ///
        public static let systemExit2 = Image(fioriName: "fiori.system.exit.2")
        ///
        public static let systemExit = Image(fioriName: "fiori.system.exit")
        ///
        public static let trendDown = Image(fioriName: "fiori.trend.down")
        ///
        public static let trendUp = Image(fioriName: "fiori.trend.up")
        ///
        public static let undo = Image(fioriName: "fiori.undo")
        ///
        public static let up = Image(fioriName: "fiori.up")
        ///
        public static let upload = Image(fioriName: "fiori.upload")
        ///
        public static let uploadToCloud = Image(fioriName: "fiori.upload.to.cloud")
        ///
        public static let visits = Image(fioriName: "fiori.visits")
    }

    public enum calendars {
        ///
        public static let accelerated = Image(fioriName: "fiori.accelerated")
        ///
        public static let addCalendar = Image(fioriName: "fiori.add.calendar")
        ///
        public static let appointment2 = Image(fioriName: "fiori.appointment.2")
        ///
        public static let appointment = Image(fioriName: "fiori.appointment")
        ///
        public static let calendarFill = Image(fioriName: "fiori.calendar.fill")
        ///
        public static let calendar = Image(fioriName: "fiori.calendar")
        ///
        public static let checkAvailability = Image(fioriName: "fiori.check.availability")
        ///
        public static let dateTime = Image(fioriName: "fiori.date.time")
        ///
        public static let ganttBars = Image(fioriName: "fiori.gantt.bars")
        ///
        public static let measurementDocument = Image(fioriName: "fiori.measurement.document")
        ///
        public static let notes = Image(fioriName: "fiori.notes")
        ///
        public static let perDiem = Image(fioriName: "fiori.per.diem")
        ///
        public static let selectAppointments = Image(fioriName: "fiori.select.appointments")
        ///
        public static let timeOff = Image(fioriName: "fiori.time.off")
        ///
        public static let workflowTasks = Image(fioriName: "fiori.workflow.tasks")
    }

    public enum callout {
        ///
        public static let comment = Image(fioriName: "fiori.comment")
        ///
        public static let discussion2 = Image(fioriName: "fiori.discussion.2")
        ///
        public static let discussion = Image(fioriName: "fiori.discussion")
        ///
        public static let feedback = Image(fioriName: "fiori.feedback")
        ///
        public static let helloWorld = Image(fioriName: "fiori.hello.world")
        ///
        public static let messagePopup = Image(fioriName: "fiori.message.popup")
        ///
        public static let notification2 = Image(fioriName: "fiori.notification.2")
        ///
        public static let post = Image(fioriName: "fiori.post")
        ///
        public static let salesNotification = Image(fioriName: "fiori.sales.notification")
        ///
        public static let tagCloudChart = Image(fioriName: "fiori.tag.cloud.chart")
        ///
        public static let thingType = Image(fioriName: "fiori.thing.type")
        ///
        public static let travelRequest = Image(fioriName: "fiori.travel.request")
        ///
        public static let uiNotifications = Image(fioriName: "fiori.ui.notifications")
    }

    public enum charts {
        ///
        public static let alongStackedChart = Image(fioriName: "fiori.along.stacked.chart")
        ///
        public static let areaChart = Image(fioriName: "fiori.area.chart")
        ///
        public static let barChart = Image(fioriName: "fiori.bar.chart")
        ///
        public static let bubbleChart = Image(fioriName: "fiori.bubble.chart")
        ///
        public static let businessObjectsExperienceFill = Image(fioriName: "fiori.business.objects.experience.fill")
        ///
        public static let businessObjectsExperience = Image(fioriName: "fiori.business.objects.experience")
        ///
        public static let chartAxis = Image(fioriName: "fiori.chart.axis")
        ///
        public static let chartTableView = Image(fioriName: "fiori.chart.table.view")
        ///
        public static let chartTreeMap = Image(fioriName: "fiori.chart.tree.map")
        ///
        public static let checklist2 = Image(fioriName: "fiori.checklist.2")
        ///
        public static let checklistItem2 = Image(fioriName: "fiori.checklist.item.2")
        ///
        public static let checklistItem = Image(fioriName: "fiori.checklist.item")
        ///
        public static let checklist = Image(fioriName: "fiori.checklist")
        ///
        public static let chevronPhase2 = Image(fioriName: "fiori.chevron.phase.2")
        ///
        public static let chevronPhase = Image(fioriName: "fiori.chevron.phase")
        ///
        public static let choroplethChart = Image(fioriName: "fiori.choropleth.chart")
        ///
        public static let circleTask2 = Image(fioriName: "fiori.circle.task.2")
        ///
        public static let circleTaskFill = Image(fioriName: "fiori.circle.task.fill")
        ///
        public static let circleTask = Image(fioriName: "fiori.circle.task")
        ///
        public static let columnChartDualAxis = Image(fioriName: "fiori.column.chart.dual.axis")
        ///
        public static let crossedLineChart = Image(fioriName: "fiori.crossed.line.chart")
        ///
        public static let donutChart = Image(fioriName: "fiori.donut.chart")
        ///
        public static let filterAnalytics = Image(fioriName: "fiori.filter.analytics")
        ///
        public static let fullStackedChart = Image(fioriName: "fiori.full.stacked.chart")
        ///
        public static let fullStackedColumnChart = Image(fioriName: "fiori.full.stacked.column.chart")
        ///
        public static let ganttBars = Image(fioriName: "fiori.gantt.bars")
        ///
        public static let geographicBubbleChart = Image(fioriName: "fiori.geographic.bubble.chart")
        ///
        public static let heatmapChart = Image(fioriName: "fiori.heatmap.chart")
        ///
        public static let horizontalBarChart2 = Image(fioriName: "fiori.horizontal.bar.chart.2")
        ///
        public static let horizontalBarChart = Image(fioriName: "fiori.horizontal.bar.chart")
        ///
        public static let horizontalBulletChart = Image(fioriName: "fiori.horizontal.bullet.chart")
        ///
        public static let horizontalCombinationChart = Image(fioriName: "fiori.horizontal.combination.chart")
        ///
        public static let horizontalStackedChart = Image(fioriName: "fiori.horizontal.stacked.chart")
        ///
        public static let horizontalWaterfallChart = Image(fioriName: "fiori.horizontal.waterfall.chart")
        ///
        public static let legend = Image(fioriName: "fiori.legend")
        ///
        public static let lineChartDualAxis = Image(fioriName: "fiori.line.chart.dual.axis")
        ///
        public static let lineChart = Image(fioriName: "fiori.line.chart")
        ///
        public static let lineChartTimeAxis = Image(fioriName: "fiori.line.chart.time.axis")
        ///
        public static let lineCharts = Image(fioriName: "fiori.line.charts")
        ///
        public static let masterTaskTriangle2 = Image(fioriName: "fiori.master.task.triangle.2")
        ///
        public static let masterTaskTriangle = Image(fioriName: "fiori.master.task.triangle")
        ///
        public static let mirroredTaskCircle2 = Image(fioriName: "fiori.mirrored.task.circle.2")
        ///
        public static let mirroredTaskCircle = Image(fioriName: "fiori.mirrored.task.circle")
        ///
        public static let multipleBarChart = Image(fioriName: "fiori.multiple.bar.chart")
        ///
        public static let multipleLineChart = Image(fioriName: "fiori.multiple.line.chart")
        ///
        public static let multiplePieChart = Image(fioriName: "fiori.multiple.pie.chart")
        ///
        public static let multipleRadarChart = Image(fioriName: "fiori.multiple.radar.chart")
        ///
        public static let orgChartFill = Image(fioriName: "fiori.org.chart.fill")
        ///
        public static let orgChart = Image(fioriName: "fiori.org.chart")
        ///
        public static let overviewChart = Image(fioriName: "fiori.overview.chart")
        ///
        public static let pieChart = Image(fioriName: "fiori.pie.chart")
        ///
        public static let pipelineAnalysis = Image(fioriName: "fiori.pipeline.analysis")
        ///
        public static let programTriangles2 = Image(fioriName: "fiori.program.triangles.2")
        ///
        public static let programTrianglesFill = Image(fioriName: "fiori.program.triangles.fill")
        ///
        public static let programTriangles = Image(fioriName: "fiori.program.triangles")
        ///
        public static let projectDefinitionTriangle2 = Image(fioriName: "fiori.project.definition.triangle.2")
        ///
        public static let projectDefinitionTriangle = Image(fioriName: "fiori.project.definition.triangle")
        ///
        public static let provision = Image(fioriName: "fiori.provision")
        ///
        public static let radarChart = Image(fioriName: "fiori.radar.chart")
        ///
        public static let rhombusMilestone2 = Image(fioriName: "fiori.rhombus.milestone.2")
        ///
        public static let rhombusMilestone = Image(fioriName: "fiori.rhombus.milestone")
        ///
        public static let scatterChart = Image(fioriName: "fiori.scatter.chart")
        ///
        public static let tableChart = Image(fioriName: "fiori.table.chart")
        ///
        public static let tableView = Image(fioriName: "fiori.table.view")
        ///
        public static let tagCloudChart = Image(fioriName: "fiori.tag.cloud.chart")
        ///
        public static let temperature = Image(fioriName: "fiori.temperature")
        ///
        public static let toolsOpportunityFill = Image(fioriName: "fiori.tools.opportunity.fill")
        ///
        public static let toolsOpportunity = Image(fioriName: "fiori.tools.opportunity")
        ///
        public static let tree = Image(fioriName: "fiori.tree")
        ///
        public static let tripReport = Image(fioriName: "fiori.trip.report")
        ///
        public static let upstackedChart = Image(fioriName: "fiori.upstacked.chart")
        ///
        public static let verticalBarChart2 = Image(fioriName: "fiori.vertical.bar.chart.2")
        ///
        public static let verticalBarChart = Image(fioriName: "fiori.vertical.bar.chart")
        ///
        public static let verticalBulletChart = Image(fioriName: "fiori.vertical.bullet.chart")
        ///
        public static let verticalStackedChart = Image(fioriName: "fiori.vertical.stacked.chart")
        ///
        public static let verticalWaterfallChart = Image(fioriName: "fiori.vertical.waterfall.chart")
    }

    public enum clipboards {
        ///
        public static let activity2 = Image(fioriName: "fiori.activity.2")
        ///
        public static let activityAssignedToGoal = Image(fioriName: "fiori.activity.assigned.to.goal")
        ///
        public static let activityIndividual = Image(fioriName: "fiori.activity.individual")
        ///
        public static let activityItems = Image(fioriName: "fiori.activity.items")
        ///
        public static let addActivity2 = Image(fioriName: "fiori.add.activity.2")
        ///
        public static let clinicalTaskTracker = Image(fioriName: "fiori.clinical.task.tracker")
        ///
        public static let crmServiceManager = Image(fioriName: "fiori.crm.service.manager")
        ///
        public static let paste = Image(fioriName: "fiori.paste")
        ///
        public static let taskFill = Image(fioriName: "fiori.task.fill")
        ///
        public static let task = Image(fioriName: "fiori.task")
        ///
        public static let workflowTasks = Image(fioriName: "fiori.workflow.tasks")
    }

    public enum devices {
        ///
        public static let desktopMobile = Image(fioriName: "fiori.desktop.mobile")
        ///
        public static let dishwasher = Image(fioriName: "fiori.dishwasher")
        ///
        public static let faxMachine = Image(fioriName: "fiori.fax.machine")
        ///
        public static let fobWatch = Image(fioriName: "fiori.fob.watch")
        ///
        public static let fridge = Image(fioriName: "fiori.fridge")
        ///
        public static let ipad2 = Image(fioriName: "fiori.ipad.2")
        ///
        public static let ipad = Image(fioriName: "fiori.ipad")
        ///
        public static let iphone2 = Image(fioriName: "fiori.iphone.2")
        ///
        public static let iphone = Image(fioriName: "fiori.iphone")
        ///
        public static let itHost = Image(fioriName: "fiori.it.host")
        ///
        public static let itInstance = Image(fioriName: "fiori.it.instance")
        ///
        public static let itSystem = Image(fioriName: "fiori.it.system")
        ///
        public static let laptop = Image(fioriName: "fiori.laptop")
        ///
        public static let machine = Image(fioriName: "fiori.machine")
        ///
        public static let marketingCampaign = Image(fioriName: "fiori.marketing.campaign")
        ///
        public static let microphone = Image(fioriName: "fiori.microphone")
        ///
        public static let phone = Image(fioriName: "fiori.phone")
        ///
        public static let popupWindow = Image(fioriName: "fiori.popup.window")
        ///
        public static let print = Image(fioriName: "fiori.print")
        ///
        public static let projector = Image(fioriName: "fiori.projector")
        ///
        public static let responsive = Image(fioriName: "fiori.responsive")
        ///
        public static let simulate = Image(fioriName: "fiori.simulate")
        ///
        public static let sysMonitor = Image(fioriName: "fiori.sys.monitor")
        ///
        public static let video = Image(fioriName: "fiori.video")
        ///
        public static let washingMachine = Image(fioriName: "fiori.washing.machine")
        ///
        public static let webCam = Image(fioriName: "fiori.web.cam")
    }

    public enum documents {
        ///
        public static let accountingDocumentVerification = Image(fioriName: "fiori.accounting.document.verification")
        ///
        public static let addDocument = Image(fioriName: "fiori.add.document")
        ///
        public static let attachmentAudio = Image(fioriName: "fiori.attachment.audio")
        ///
        public static let attachmentEPub = Image(fioriName: "fiori.attachment.e.pub")
        ///
        public static let attachmentHtml = Image(fioriName: "fiori.attachment.html")
        ///
        public static let attachmentPhoto = Image(fioriName: "fiori.attachment.photo")
        ///
        public static let attachmentTextFile = Image(fioriName: "fiori.attachment.text.file")
        ///
        public static let attachmentVideo = Image(fioriName: "fiori.attachment.video")
        ///
        public static let attachmentZipFile = Image(fioriName: "fiori.attachment.zip.file")
        ///
        public static let barCode = Image(fioriName: "fiori.bar.code")
        ///
        public static let clinicalOrder = Image(fioriName: "fiori.clinical.order")
        ///
        public static let courseProgram = Image(fioriName: "fiori.course.program")
        ///
        public static let createEntryTime = Image(fioriName: "fiori.create.entry.time")
        ///
        public static let create = Image(fioriName: "fiori.create")
        ///
        public static let customerFinancialFactSheet = Image(fioriName: "fiori.customer.financial.fact.sheet")
        ///
        public static let docAttachment2 = Image(fioriName: "fiori.doc.attachment.2")
        ///
        public static let docAttachment = Image(fioriName: "fiori.doc.attachment")
        ///
        public static let document = Image(fioriName: "fiori.document")
        ///
        public static let documentText = Image(fioriName: "fiori.document.text")
        ///
        public static let documents = Image(fioriName: "fiori.documents")
        ///
        public static let excelAttachment = Image(fioriName: "fiori.excel.attachment")
        ///
        public static let expenseReport = Image(fioriName: "fiori.expense.report")
        ///
        public static let inspection = Image(fioriName: "fiori.inspection")
        ///
        public static let insuranceCar = Image(fioriName: "fiori.insurance.car")
        ///
        public static let insuranceHouse = Image(fioriName: "fiori.insurance.house")
        ///
        public static let insuranceLife = Image(fioriName: "fiori.insurance.life")
        ///
        public static let measurementDocument = Image(fioriName: "fiori.measurement.document")
        ///
        public static let mySalesOrder = Image(fioriName: "fiori.my.sales.order")
        ///
        public static let newspaper = Image(fioriName: "fiori.newspaper")
        ///
        public static let orderStatus = Image(fioriName: "fiori.order.status")
        ///
        public static let pdfAttachment = Image(fioriName: "fiori.pdf.attachment")
        ///
        public static let pdfReader = Image(fioriName: "fiori.pdf.reader")
        ///
        public static let permission = Image(fioriName: "fiori.permission")
        ///
        public static let pptAttachment = Image(fioriName: "fiori.ppt.attachment")
        ///
        public static let pushpinOn = Image(fioriName: "fiori.pushpin.on")
        ///
        public static let request = Image(fioriName: "fiori.request")
        ///
        public static let salesDocument = Image(fioriName: "fiori.sales.document")
        ///
        public static let salesOrderItem = Image(fioriName: "fiori.sales.order.item")
        ///
        public static let salesOrder = Image(fioriName: "fiori.sales.order")
        ///
        public static let salesQuote = Image(fioriName: "fiori.sales.quote")
        ///
        public static let sysFirstPage = Image(fioriName: "fiori.sys.first.page")
        ///
        public static let sysLastPage = Image(fioriName: "fiori.sys.last.page")
        ///
        public static let sysNextPage = Image(fioriName: "fiori.sys.next.page")
        ///
        public static let sysPrevPage = Image(fioriName: "fiori.sys.prev.page")
        ///
        public static let timesheet = Image(fioriName: "fiori.timesheet")
        ///
        public static let vdsFile = Image(fioriName: "fiori.vds.file")
        ///
        public static let writeNewDocument = Image(fioriName: "fiori.write.new.document")
    }

    public enum folder {
        ///
        public static let batchPayments = Image(fioriName: "fiori.batch.payments")
        ///
        public static let curriculum = Image(fioriName: "fiori.curriculum")
        ///
        public static let fallback = Image(fioriName: "fiori.fallback")
        ///
        public static let folder2 = Image(fioriName: "fiori.folder.2")
        ///
        public static let folderBlank = Image(fioriName: "fiori.folder.blank")
        ///
        public static let folderFill = Image(fioriName: "fiori.folder.fill")
        ///
        public static let folderFull = Image(fioriName: "fiori.folder.full")
        ///
        public static let folder = Image(fioriName: "fiori.folder")
        ///
        public static let openFolder = Image(fioriName: "fiori.open.folder")
        ///
        public static let workHistory = Image(fioriName: "fiori.work.history")
    }

    public enum form {
        ///
        public static let approvals = Image(fioriName: "fiori.approvals")
        ///
        public static let createForm = Image(fioriName: "fiori.create.form")
        ///
        public static let customerOrderEntry = Image(fioriName: "fiori.customer.order.entry")
        ///
        public static let detailView = Image(fioriName: "fiori.detail.view")
        ///
        public static let form = Image(fioriName: "fiori.form")
        ///
        public static let receipt = Image(fioriName: "fiori.receipt")
        ///
        public static let survey = Image(fioriName: "fiori.survey")
    }

    public enum medical {
        ///
        public static let accidentalLeave = Image(fioriName: "fiori.accidental.leave")
        ///
        public static let bed = Image(fioriName: "fiori.bed")
        ///
        public static let clinicalOrder = Image(fioriName: "fiori.clinical.order")
        ///
        public static let clinicalTaskTracker = Image(fioriName: "fiori.clinical.task.tracker")
        ///
        public static let doctor = Image(fioriName: "fiori.doctor")
        ///
        public static let electrocardiogram = Image(fioriName: "fiori.electrocardiogram")
        ///
        public static let electronicMedicalRecord = Image(fioriName: "fiori.electronic.medical.record")
        ///
        public static let endoscopy = Image(fioriName: "fiori.endoscopy")
        ///
        public static let mriScan = Image(fioriName: "fiori.mri.scan")
        ///
        public static let nurse = Image(fioriName: "fiori.nurse")
        ///
        public static let nutritionActivity = Image(fioriName: "fiori.nutrition.activity")
        ///
        public static let pharmacy = Image(fioriName: "fiori.pharmacy")
        ///
        public static let physicalActivity = Image(fioriName: "fiori.physical.activity")
        ///
        public static let sonography = Image(fioriName: "fiori.sonography")
        ///
        public static let stethoscope = Image(fioriName: "fiori.stethoscope")
        ///
        public static let syringe = Image(fioriName: "fiori.syringe")
        ///
        public static let temperature = Image(fioriName: "fiori.temperature")
        ///
        public static let woundsDoc = Image(fioriName: "fiori.wounds.doc")
        ///
        public static let xRay = Image(fioriName: "fiori.x.ray")
    }

    public enum money {
        ///
        public static let batchPayments = Image(fioriName: "fiori.batch.payments")
        ///
        public static let capitalProjects = Image(fioriName: "fiori.capital.projects")
        ///
        public static let collectionsInsight = Image(fioriName: "fiori.collections.insight")
        ///
        public static let collectionsManagement = Image(fioriName: "fiori.collections.management")
        ///
        public static let commissionCheck = Image(fioriName: "fiori.commission.check")
        ///
        public static let currency = Image(fioriName: "fiori.currency")
        ///
        public static let customerFinancialFactSheet = Image(fioriName: "fiori.customer.financial.fact.sheet")
        ///
        public static let expenseReport = Image(fioriName: "fiori.expense.report")
        ///
        public static let leadOutdated = Image(fioriName: "fiori.lead.outdated")
        ///
        public static let lead = Image(fioriName: "fiori.lead")
        ///
        public static let loan = Image(fioriName: "fiori.loan")
        ///
        public static let moneyBills = Image(fioriName: "fiori.money.bills")
        ///
        public static let monitorPayments = Image(fioriName: "fiori.monitor.payments")
        ///
        public static let paidLeave = Image(fioriName: "fiori.paid.leave")
        ///
        public static let paymentApproval = Image(fioriName: "fiori.payment.approval")
        ///
        public static let perDiem = Image(fioriName: "fiori.per.diem")
        ///
        public static let receipt = Image(fioriName: "fiori.receipt")
        ///
        public static let salesDocument = Image(fioriName: "fiori.sales.document")
        ///
        public static let salesNotification = Image(fioriName: "fiori.sales.notification")
        ///
        public static let salesOrderItem = Image(fioriName: "fiori.sales.order.item")
        ///
        public static let salesOrder = Image(fioriName: "fiori.sales.order")
        ///
        public static let salesQuote = Image(fioriName: "fiori.sales.quote")
        ///
        public static let simplePayment = Image(fioriName: "fiori.simple.payment")
        ///
        public static let timeOvertime = Image(fioriName: "fiori.time.overtime")
        ///
        public static let travelExpenseReportFill = Image(fioriName: "fiori.travel.expense.report.fill")
        ///
        public static let travelExpenseReport = Image(fioriName: "fiori.travel.expense.report")
        ///
        public static let travelExpense = Image(fioriName: "fiori.travel.expense")
        ///
        public static let unpaidLeave = Image(fioriName: "fiori.unpaid.leave")
        ///
        public static let waiver = Image(fioriName: "fiori.waiver")
        ///
        public static let wallet = Image(fioriName: "fiori.wallet")
    }

    public enum objects {
        ///
        public static let addCoursebook = Image(fioriName: "fiori.add.coursebook")
        ///
        public static let addPhoto = Image(fioriName: "fiori.add.photo")
        ///
        public static let addProcess = Image(fioriName: "fiori.add.process")
        ///
        public static let addProduct = Image(fioriName: "fiori.add.product")
        ///
        public static let addressBook = Image(fioriName: "fiori.address.book")
        ///
        public static let addresses = Image(fioriName: "fiori.addresses")
        ///
        public static let arobase = Image(fioriName: "fiori.arobase")
        ///
        public static let background = Image(fioriName: "fiori.background")
        ///
        public static let badge = Image(fioriName: "fiori.badge")
        ///
        public static let barCode = Image(fioriName: "fiori.bar.code")
        ///
        public static let bbydActiveSales = Image(fioriName: "fiori.bbyd.active.sales")
        ///
        public static let bbydDashboard = Image(fioriName: "fiori.bbyd.dashboard")
        ///
        public static let bed = Image(fioriName: "fiori.bed")
        ///
        public static let bell2 = Image(fioriName: "fiori.bell.2")
        ///
        public static let bell = Image(fioriName: "fiori.bell")
        ///
        public static let blankTag2 = Image(fioriName: "fiori.blank.tag.2")
        ///
        public static let blankTag = Image(fioriName: "fiori.blank.tag")
        ///
        public static let boStrategyManagement = Image(fioriName: "fiori.bo.strategy.management")
        ///
        public static let border = Image(fioriName: "fiori.border")
        ///
        public static let brokenLink = Image(fioriName: "fiori.broken.link")
        ///
        public static let building = Image(fioriName: "fiori.building")
        ///
        public static let burglary = Image(fioriName: "fiori.burglary")
        ///
        public static let businessByDesign = Image(fioriName: "fiori.business.by.design")
        ///
        public static let businessCardFill = Image(fioriName: "fiori.business.card.fill")
        ///
        public static let businessCard = Image(fioriName: "fiori.business.card")
        ///
        public static let businessObjectsExplorer = Image(fioriName: "fiori.business.objects.explorer")
        ///
        public static let businessObjectsMobileFill = Image(fioriName: "fiori.business.objects.mobile.fill")
        ///
        public static let businessObjectsMobile = Image(fioriName: "fiori.business.objects.mobile")
        ///
        public static let businessOne = Image(fioriName: "fiori.business.one")
        ///
        public static let camera = Image(fioriName: "fiori.camera")
        ///
        public static let capitalProjects = Image(fioriName: "fiori.capital.projects")
        ///
        public static let card = Image(fioriName: "fiori.card")
        ///
        public static let chalkboard = Image(fioriName: "fiori.chalkboard")
        ///
        public static let checklist2 = Image(fioriName: "fiori.checklist.2")
        ///
        public static let checklistItem2 = Image(fioriName: "fiori.checklist.item.2")
        ///
        public static let checklistItem = Image(fioriName: "fiori.checklist.item")
        ///
        public static let checklist = Image(fioriName: "fiori.checklist")
        ///
        public static let chevronPhase2 = Image(fioriName: "fiori.chevron.phase.2")
        ///
        public static let chevronPhase = Image(fioriName: "fiori.chevron.phase")
        ///
        public static let circleTask2 = Image(fioriName: "fiori.circle.task.2")
        ///
        public static let circleTaskFill = Image(fioriName: "fiori.circle.task.fill")
        ///
        public static let circleTask = Image(fioriName: "fiori.circle.task")
        ///
        public static let cloudCheck = Image(fioriName: "fiori.cloud.check")
        ///
        public static let cloud = Image(fioriName: "fiori.cloud")
        ///
        public static let co = Image(fioriName: "fiori.co")
        ///
        public static let collectionsManagement = Image(fioriName: "fiori.collections.management")
        ///
        public static let collision = Image(fioriName: "fiori.collision")
        ///
        public static let colorFill = Image(fioriName: "fiori.color.fill")
        ///
        public static let compare2 = Image(fioriName: "fiori.compare.2")
        ///
        public static let compare = Image(fioriName: "fiori.compare")
        ///
        public static let competitorFill = Image(fioriName: "fiori.competitor.fill")
        ///
        public static let competitor = Image(fioriName: "fiori.competitor")
        ///
        public static let contacts = Image(fioriName: "fiori.contacts")
        ///
        public static let courseBook = Image(fioriName: "fiori.course.book")
        ///
        public static let creditCard = Image(fioriName: "fiori.credit.card")
        ///
        public static let crmSales = Image(fioriName: "fiori.crm.sales")
        ///
        public static let cursorArrow = Image(fioriName: "fiori.cursor.arrow")
        ///
        public static let customerView = Image(fioriName: "fiori.customer.view")
        ///
        public static let database = Image(fioriName: "fiori.database")
        ///
        public static let dimension = Image(fioriName: "fiori.dimension")
        ///
        public static let dishwasher = Image(fioriName: "fiori.dishwasher")
        ///
        public static let drawRectangle = Image(fioriName: "fiori.draw.rectangle")
        ///
        public static let eCare = Image(fioriName: "fiori.e.care")
        ///
        public static let eLearning = Image(fioriName: "fiori.e.learning")
        ///
        public static let eamWorkOrder = Image(fioriName: "fiori.eam.work.order")
        ///
        public static let educationFill = Image(fioriName: "fiori.education.fill")
        ///
        public static let education = Image(fioriName: "fiori.education")
        ///
        public static let electronicMedicalRecord = Image(fioriName: "fiori.electronic.medical.record")
        ///
        public static let email = Image(fioriName: "fiori.email")
        ///
        public static let enablement = Image(fioriName: "fiori.enablement")
        ///
        public static let endUserExperienceMonitoring = Image(fioriName: "fiori.end.user.experience.monitoring")
        ///
        public static let endoscopy = Image(fioriName: "fiori.endoscopy")
        ///
        public static let energySavingLightbulb = Image(fioriName: "fiori.energy.saving.lightbulb")
        ///
        public static let example = Image(fioriName: "fiori.example")
        ///
        public static let explorer = Image(fioriName: "fiori.explorer")
        ///
        public static let factory = Image(fioriName: "fiori.factory")
        ///
        public static let filterAnalytics = Image(fioriName: "fiori.filter.analytics")
        ///
        public static let filterFacets = Image(fioriName: "fiori.filter.facets")
        ///
        public static let filterFields = Image(fioriName: "fiori.filter.fields")
        ///
        public static let fobWatchFill = Image(fioriName: "fiori.fob.watch.fill")
        ///
        public static let fobWatch = Image(fioriName: "fiori.fob.watch")
        ///
        public static let fridge = Image(fioriName: "fiori.fridge")
        ///
        public static let functionalLocation = Image(fioriName: "fiori.functional.location")
        ///
        public static let ganttBars = Image(fioriName: "fiori.gantt.bars")
        ///
        public static let globe = Image(fioriName: "fiori.globe")
        ///
        public static let goal = Image(fioriName: "fiori.goal")
        ///
        public static let goalseek = Image(fioriName: "fiori.goalseek")
        ///
        public static let grid = Image(fioriName: "fiori.grid")
        ///
        public static let header = Image(fioriName: "fiori.header")
        ///
        public static let headset = Image(fioriName: "fiori.headset")
        ///
        public static let heatingCooling = Image(fioriName: "fiori.heating.cooling")
        ///
        public static let helloWorld = Image(fioriName: "fiori.hello.world")
        ///
        public static let horizontalGrip = Image(fioriName: "fiori.horizontal.grip")
        ///
        public static let imageViewer = Image(fioriName: "fiori.image.viewer")
        ///
        public static let initiative = Image(fioriName: "fiori.initiative")
        ///
        public static let internetBrowser = Image(fioriName: "fiori.internet.browser")
        ///
        public static let ipad2 = Image(fioriName: "fiori.ipad.2")
        ///
        public static let ipad = Image(fioriName: "fiori.ipad")
        ///
        public static let iphone2 = Image(fioriName: "fiori.iphone.2")
        ///
        public static let iphone = Image(fioriName: "fiori.iphone")
        ///
        public static let itHost = Image(fioriName: "fiori.it.host")
        ///
        public static let itInstance = Image(fioriName: "fiori.it.instance")
        ///
        public static let itSystem = Image(fioriName: "fiori.it.system")
        ///
        public static let jam = Image(fioriName: "fiori.jam")
        ///
        public static let key = Image(fioriName: "fiori.key")
        ///
        public static let keyboardAndMouse = Image(fioriName: "fiori.keyboard.and.mouse")
        ///
        public static let kpiCorporatePerformance = Image(fioriName: "fiori.kpi.corporate.performance")
        ///
        public static let lab = Image(fioriName: "fiori.lab")
        ///
        public static let laptop = Image(fioriName: "fiori.laptop")
        ///
        public static let lateness = Image(fioriName: "fiori.lateness")
        ///
        public static let legend = Image(fioriName: "fiori.legend")
        ///
        public static let letter = Image(fioriName: "fiori.letter")
        ///
        public static let lightbulb = Image(fioriName: "fiori.lightbulb")
        ///
        public static let loan = Image(fioriName: "fiori.loan")
        ///
        public static let locked = Image(fioriName: "fiori.locked")
        ///
        public static let machine = Image(fioriName: "fiori.machine")
        ///
        public static let managerInsight = Image(fioriName: "fiori.manager.insight")
        ///
        public static let map2 = Image(fioriName: "fiori.map.2")
        ///
        public static let map3Fill = Image(fioriName: "fiori.map.3.fill")
        ///
        public static let map3 = Image(fioriName: "fiori.map.3")
        ///
        public static let mapFill = Image(fioriName: "fiori.map.fill")
        ///
        public static let map = Image(fioriName: "fiori.map")
        ///
        public static let marketingCampaign = Image(fioriName: "fiori.marketing.campaign")
        ///
        public static let masterTaskTriangle2 = Image(fioriName: "fiori.master.task.triangle.2")
        ///
        public static let masterTaskTriangle = Image(fioriName: "fiori.master.task.triangle")
        ///
        public static let meal = Image(fioriName: "fiori.meal")
        ///
        public static let measure = Image(fioriName: "fiori.measure")
        ///
        public static let measurementDocument = Image(fioriName: "fiori.measurement.document")
        ///
        public static let measuringPoint = Image(fioriName: "fiori.measuring.point")
        ///
        public static let microphone = Image(fioriName: "fiori.microphone")
        ///
        public static let mileage = Image(fioriName: "fiori.mileage")
        ///
        public static let minimize = Image(fioriName: "fiori.minimize")
        ///
        public static let mirroredTaskCircle2 = Image(fioriName: "fiori.mirrored.task.circle.2")
        ///
        public static let mirroredTaskCircle = Image(fioriName: "fiori.mirrored.task.circle")
        ///
        public static let myView = Image(fioriName: "fiori.my.view")
        ///
        public static let netweaverBusinessClient = Image(fioriName: "fiori.netweaver.business.client")
        ///
        public static let newspaper = Image(fioriName: "fiori.newspaper")
        ///
        public static let numberSign = Image(fioriName: "fiori.number.sign")
        ///
        public static let nutritionActivity = Image(fioriName: "fiori.nutrition.activity")
        ///
        public static let officialService = Image(fioriName: "fiori.official.service")
        ///
        public static let offsiteWork = Image(fioriName: "fiori.offsite.work")
        ///
        public static let opportunity = Image(fioriName: "fiori.opportunity")
        ///
        public static let overlay = Image(fioriName: "fiori.overlay")
        ///
        public static let palette = Image(fioriName: "fiori.palette")
        ///
        public static let paperPlane = Image(fioriName: "fiori.paper.plane")
        ///
        public static let performance = Image(fioriName: "fiori.performance")
        ///
        public static let phone = Image(fioriName: "fiori.phone")
        ///
        public static let photoVoltaic = Image(fioriName: "fiori.photo.voltaic")
        ///
        public static let picture = Image(fioriName: "fiori.picture")
        ///
        public static let pipelineAnalysis = Image(fioriName: "fiori.pipeline.analysis")
        ///
        public static let pool = Image(fioriName: "fiori.pool")
        ///
        public static let primaryKey = Image(fioriName: "fiori.primary.key")
        ///
        public static let print = Image(fioriName: "fiori.print")
        ///
        public static let productFill = Image(fioriName: "fiori.product.fill")
        ///
        public static let product = Image(fioriName: "fiori.product")
        ///
        public static let programTriangles2 = Image(fioriName: "fiori.program.triangles.2")
        ///
        public static let programTrianglesFill = Image(fioriName: "fiori.program.triangles.fill")
        ///
        public static let programTriangles = Image(fioriName: "fiori.program.triangles")
        ///
        public static let projectDefinitionTriangle2 = Image(fioriName: "fiori.project.definition.triangle.2")
        ///
        public static let projectDefinitionTriangle = Image(fioriName: "fiori.project.definition.triangle")
        ///
        public static let projector = Image(fioriName: "fiori.projector")
        ///
        public static let pushpinOff = Image(fioriName: "fiori.pushpin.off")
        ///
        public static let puzzle = Image(fioriName: "fiori.puzzle")
        ///
        public static let qrCode = Image(fioriName: "fiori.qr.code")
        ///
        public static let rhombusMilestone2 = Image(fioriName: "fiori.rhombus.milestone.2")
        ///
        public static let rhombusMilestone = Image(fioriName: "fiori.rhombus.milestone")
        ///
        public static let s4hana = Image(fioriName: "fiori.s4hana")
        ///
        public static let sapBox = Image(fioriName: "fiori.sap.box")
        ///
        public static let sapLogoShape = Image(fioriName: "fiori.sap.logo.shape")
        ///
        public static let sapUi5 = Image(fioriName: "fiori.sap.ui5")
        ///
        public static let save = Image(fioriName: "fiori.save")
        ///
        public static let scissors = Image(fioriName: "fiori.scissors")
        ///
        public static let screenSplitOne = Image(fioriName: "fiori.screen.split.one")
        ///
        public static let screenSplitThree = Image(fioriName: "fiori.screen.split.three")
        ///
        public static let screenSplitTwo = Image(fioriName: "fiori.screen.split.two")
        ///
        public static let shelf = Image(fioriName: "fiori.shelf")
        ///
        public static let shield = Image(fioriName: "fiori.shield")
        ///
        public static let simulate = Image(fioriName: "fiori.simulate")
        ///
        public static let soccer = Image(fioriName: "fiori.soccer")
        ///
        public static let soundLoud = Image(fioriName: "fiori.sound.loud")
        ///
        public static let soundOff = Image(fioriName: "fiori.sound.off")
        ///
        public static let sound = Image(fioriName: "fiori.sound")
        ///
        public static let studyLeaveFill = Image(fioriName: "fiori.study.leave.fill")
        ///
        public static let studyLeave = Image(fioriName: "fiori.study.leave")
        ///
        public static let suitcaseFill = Image(fioriName: "fiori.suitcase.fill")
        ///
        public static let suitcase = Image(fioriName: "fiori.suitcase")
        ///
        public static let sysMonitor = Image(fioriName: "fiori.sys.monitor")
        ///
        public static let tableChart = Image(fioriName: "fiori.table.chart")
        ///
        public static let tableColumn = Image(fioriName: "fiori.table.column")
        ///
        public static let tableRow = Image(fioriName: "fiori.table.row")
        ///
        public static let tableView = Image(fioriName: "fiori.table.view")
        ///
        public static let tag = Image(fioriName: "fiori.tag")
        ///
        public static let tags = Image(fioriName: "fiori.tags")
        ///
        public static let targetGroupFill = Image(fioriName: "fiori.target.group.fill")
        ///
        public static let targetGroup = Image(fioriName: "fiori.target.group")
        ///
        public static let technicalObject = Image(fioriName: "fiori.technical.object")
        ///
        public static let temperature = Image(fioriName: "fiori.temperature")
        ///
        public static let theater = Image(fioriName: "fiori.theater")
        ///
        public static let toasterDown = Image(fioriName: "fiori.toaster.down")
        ///
        public static let toasterTop = Image(fioriName: "fiori.toaster.top")
        ///
        public static let toasterUp = Image(fioriName: "fiori.toaster.up")
        ///
        public static let toolsOpportunityFill = Image(fioriName: "fiori.tools.opportunity.fill")
        ///
        public static let toolsOpportunity = Image(fioriName: "fiori.tools.opportunity")
        ///
        public static let touch = Image(fioriName: "fiori.touch")
        ///
        public static let tree = Image(fioriName: "fiori.tree")
        ///
        public static let twoKeys = Image(fioriName: "fiori.two.keys")
        ///
        public static let umbrella = Image(fioriName: "fiori.umbrella")
        ///
        public static let unlocked = Image(fioriName: "fiori.unlocked")
        ///
        public static let unwired = Image(fioriName: "fiori.unwired")
        ///
        public static let verticalGrip = Image(fioriName: "fiori.vertical.grip")
        ///
        public static let video = Image(fioriName: "fiori.video")
        ///
        public static let wallet = Image(fioriName: "fiori.wallet")
        ///
        public static let washingMachine = Image(fioriName: "fiori.washing.machine")
        ///
        public static let weatherProofing = Image(fioriName: "fiori.weather.proofing")
        ///
        public static let webCam = Image(fioriName: "fiori.web.cam")
        ///
        public static let widgets = Image(fioriName: "fiori.widgets")
        ///
        public static let windowsDoors = Image(fioriName: "fiori.windows.doors")
        ///
        public static let world = Image(fioriName: "fiori.world")
    }

    public enum people {
        ///
        public static let accessibility = Image(fioriName: "fiori.accessibility")
        ///
        public static let account = Image(fioriName: "fiori.account")
        ///
        public static let activityIndividual = Image(fioriName: "fiori.activity.individual")
        ///
        public static let addContact = Image(fioriName: "fiori.add.contact")
        ///
        public static let addEmployee = Image(fioriName: "fiori.add.employee")
        ///
        public static let biometricFace = Image(fioriName: "fiori.biometric.face")
        ///
        public static let biometricThumb = Image(fioriName: "fiori.biometric.thumb")
        ///
        public static let businessCardFill = Image(fioriName: "fiori.business.card.fill")
        ///
        public static let businessCard = Image(fioriName: "fiori.business.card")
        ///
        public static let citizenConnect = Image(fioriName: "fiori.citizen.connect")
        ///
        public static let collaborateFill = Image(fioriName: "fiori.collaborate.fill")
        ///
        public static let collaborate = Image(fioriName: "fiori.collaborate")
        ///
        public static let companyViewFill = Image(fioriName: "fiori.company.view.fill")
        ///
        public static let companyView = Image(fioriName: "fiori.company.view")
        ///
        public static let customerAndContacts = Image(fioriName: "fiori.customer.and.contacts")
        ///
        public static let customerAndSupplier = Image(fioriName: "fiori.customer.and.supplier")
        ///
        public static let customerBriefing = Image(fioriName: "fiori.customer.briefing")
        ///
        public static let customerFill = Image(fioriName: "fiori.customer.fill")
        ///
        public static let customerHistory = Image(fioriName: "fiori.customer.history")
        ///
        public static let customer = Image(fioriName: "fiori.customer")
        ///
        public static let decision = Image(fioriName: "fiori.decision")
        ///
        public static let doctor = Image(fioriName: "fiori.doctor")
        ///
        public static let employeeApprovals = Image(fioriName: "fiori.employee.approvals")
        ///
        public static let employeeLookup = Image(fioriName: "fiori.employee.lookup")
        ///
        public static let employeePane = Image(fioriName: "fiori.employee.pane")
        ///
        public static let employeeRejections = Image(fioriName: "fiori.employee.rejections")
        ///
        public static let employee = Image(fioriName: "fiori.employee")
        ///
        public static let familyCare = Image(fioriName: "fiori.family.care")
        ///
        public static let familyProtection = Image(fioriName: "fiori.family.protection")
        ///
        public static let female = Image(fioriName: "fiori.female")
        ///
        public static let genderMaleAndFemale = Image(fioriName: "fiori.gender.male.and.female")
        ///
        public static let group = Image(fioriName: "fiori.group")
        ///
        public static let hrApproval = Image(fioriName: "fiori.hr.approval")
        ///
        public static let ideaWall = Image(fioriName: "fiori.idea.wall")
        ///
        public static let kpiManagingMyArea = Image(fioriName: "fiori.kpi.managing.my.area")
        ///
        public static let leads = Image(fioriName: "fiori.leads")
        ///
        public static let learningAssistant = Image(fioriName: "fiori.learning.assistant")
        ///
        public static let male = Image(fioriName: "fiori.male")
        ///
        public static let manager = Image(fioriName: "fiori.manager")
        ///
        public static let meetingRoom = Image(fioriName: "fiori.meeting.room")
        ///
        public static let monitorPayments = Image(fioriName: "fiori.monitor.payments")
        ///
        public static let mySalesOrder = Image(fioriName: "fiori.my.sales.order")
        ///
        public static let myView = Image(fioriName: "fiori.my.view")
        ///
        public static let nonBinary = Image(fioriName: "fiori.non.binary")
        ///
        public static let nurse = Image(fioriName: "fiori.nurse")
        ///
        public static let opportunities = Image(fioriName: "fiori.opportunities")
        ///
        public static let peopleConnected = Image(fioriName: "fiori.people.connected")
        ///
        public static let personPlaceholderFill = Image(fioriName: "fiori.person.placeholder.fill")
        ///
        public static let personPlaceholder = Image(fioriName: "fiori.person.placeholder")
        ///
        public static let personnelView = Image(fioriName: "fiori.personnel.view")
        ///
        public static let physicalActivity = Image(fioriName: "fiori.physical.activity")
        ///
        public static let `private` = Image(fioriName: "fiori.private")
        ///
        public static let role = Image(fioriName: "fiori.role")
        ///
        public static let supplier = Image(fioriName: "fiori.supplier")
        ///
        public static let switchClasses = Image(fioriName: "fiori.switch.classes")
        ///
        public static let userEdit = Image(fioriName: "fiori.user.edit")
        ///
        public static let userSettings = Image(fioriName: "fiori.user.settings")
        ///
        public static let visits = Image(fioriName: "fiori.visits")
        ///
        public static let woundsDoc = Image(fioriName: "fiori.wounds.doc")
    }

    public enum places {
        ///
        public static let building = Image(fioriName: "fiori.building")
        ///
        public static let capitalProjects = Image(fioriName: "fiori.capital.projects")
        ///
        public static let cloud = Image(fioriName: "fiori.cloud")
        ///
        public static let createLeaveRequest = Image(fioriName: "fiori.create.leave.request")
        ///
        public static let doctor = Image(fioriName: "fiori.doctor")
        ///
        public static let factory = Image(fioriName: "fiori.factory")
        ///
        public static let generalLeaveRequest = Image(fioriName: "fiori.general.leave.request")
        ///
        public static let globe = Image(fioriName: "fiori.globe")
        ///
        public static let homeFill = Image(fioriName: "fiori.home.fill")
        ///
        public static let homeShare = Image(fioriName: "fiori.home.share")
        ///
        public static let home = Image(fioriName: "fiori.home")
        ///
        public static let jam = Image(fioriName: "fiori.jam")
        ///
        public static let locateMe = Image(fioriName: "fiori.locate.me")
        ///
        public static let map2 = Image(fioriName: "fiori.map.2")
        ///
        public static let map3Fill = Image(fioriName: "fiori.map.3.fill")
        ///
        public static let map3 = Image(fioriName: "fiori.map.3")
        ///
        public static let mapFill = Image(fioriName: "fiori.map.fill")
        ///
        public static let map = Image(fioriName: "fiori.map")
        ///
        public static let meal = Image(fioriName: "fiori.meal")
        ///
        public static let mileage = Image(fioriName: "fiori.mileage")
        ///
        public static let officialService = Image(fioriName: "fiori.official.service")
        ///
        public static let offsiteWork = Image(fioriName: "fiori.offsite.work")
        ///
        public static let pool = Image(fioriName: "fiori.pool")
        ///
        public static let retailStore = Image(fioriName: "fiori.retail.store")
        ///
        public static let theater = Image(fioriName: "fiori.theater")
        ///
        public static let world = Image(fioriName: "fiori.world")
    }

    public enum shopping {
        ///
        public static let basketFill = Image(fioriName: "fiori.basket.fill")
        ///
        public static let basket = Image(fioriName: "fiori.basket")
        ///
        public static let cart2 = Image(fioriName: "fiori.cart.2")
        ///
        public static let cart3 = Image(fioriName: "fiori.cart.3")
        ///
        public static let cart4 = Image(fioriName: "fiori.cart.4")
        ///
        public static let cart5 = Image(fioriName: "fiori.cart.5")
        ///
        public static let cartApproval = Image(fioriName: "fiori.cart.approval")
        ///
        public static let cartFull = Image(fioriName: "fiori.cart.full")
        ///
        public static let cart = Image(fioriName: "fiori.cart")
        ///
        public static let retailStoreManager = Image(fioriName: "fiori.retail.store.manager")
        ///
        public static let retailStore = Image(fioriName: "fiori.retail.store")
    }

    public enum status {
        ///
        public static let accidentalLeave = Image(fioriName: "fiori.accidental.leave")
        ///
        public static let alert = Image(fioriName: "fiori.alert")
        ///
        public static let appearOffline = Image(fioriName: "fiori.appear.offline")
        ///
        public static let away = Image(fioriName: "fiori.away")
        ///
        public static let badge = Image(fioriName: "fiori.badge")
        ///
        public static let bookmark = Image(fioriName: "fiori.bookmark")
        ///
        public static let brokenLink = Image(fioriName: "fiori.broken.link")
        ///
        public static let busy = Image(fioriName: "fiori.busy")
        ///
        public static let cancelMaintenance = Image(fioriName: "fiori.cancel.maintenance")
        ///
        public static let cancelShare = Image(fioriName: "fiori.cancel.share")
        ///
        public static let cancel = Image(fioriName: "fiori.cancel")
        ///
        public static let connected = Image(fioriName: "fiori.connected")
        ///
        public static let decision = Image(fioriName: "fiori.decision")
        ///
        public static let disconnected = Image(fioriName: "fiori.disconnected")
        ///
        public static let employeeApprovals = Image(fioriName: "fiori.employee.approvals")
        ///
        public static let employeeRejections = Image(fioriName: "fiori.employee.rejections")
        ///
        public static let error = Image(fioriName: "fiori.error")
        ///
        public static let flag = Image(fioriName: "fiori.flag")
        ///
        public static let goal = Image(fioriName: "fiori.goal")
        ///
        public static let goalseek = Image(fioriName: "fiori.goalseek")
        ///
        public static let highPriority = Image(fioriName: "fiori.high.priority")
        ///
        public static let history = Image(fioriName: "fiori.history")
        ///
        public static let hrApproval = Image(fioriName: "fiori.hr.approval")
        ///
        public static let inProgress = Image(fioriName: "fiori.in.progress")
        ///
        public static let incident = Image(fioriName: "fiori.incident")
        ///
        public static let information = Image(fioriName: "fiori.information")
        ///
        public static let lab = Image(fioriName: "fiori.lab")
        ///
        public static let lateness = Image(fioriName: "fiori.lateness")
        ///
        public static let leadOutdated = Image(fioriName: "fiori.lead.outdated")
        ///
        public static let lead = Image(fioriName: "fiori.lead")
        ///
        public static let locked = Image(fioriName: "fiori.locked")
        ///
        public static let messageError = Image(fioriName: "fiori.message.error")
        ///
        public static let messageInformation = Image(fioriName: "fiori.message.information")
        ///
        public static let messagePopup = Image(fioriName: "fiori.message.popup")
        ///
        public static let messageSuccess = Image(fioriName: "fiori.message.success")
        ///
        public static let messageWarning = Image(fioriName: "fiori.message.warning")
        ///
        public static let notificationFill = Image(fioriName: "fiori.notification.fill")
        ///
        public static let notification = Image(fioriName: "fiori.notification")
        ///
        public static let permission = Image(fioriName: "fiori.permission")
        ///
        public static let `private` = Image(fioriName: "fiori.private")
        ///
        public static let qualityIssue = Image(fioriName: "fiori.quality.issue")
        ///
        public static let questionMark = Image(fioriName: "fiori.question.mark")
        ///
        public static let role = Image(fioriName: "fiori.role")
        ///
        public static let statusCompleted = Image(fioriName: "fiori.status.completed")
        ///
        public static let statusCritical = Image(fioriName: "fiori.status.critical")
        ///
        public static let statusError = Image(fioriName: "fiori.status.error")
        ///
        public static let statusInProcess = Image(fioriName: "fiori.status.in.process")
        ///
        public static let statusInactive = Image(fioriName: "fiori.status.inactive")
        ///
        public static let statusNegative = Image(fioriName: "fiori.status.negative")
        ///
        public static let statusPositive = Image(fioriName: "fiori.status.positive")
        ///
        public static let sysCancel = Image(fioriName: "fiori.sys.cancel")
        ///
        public static let sysEnter2 = Image(fioriName: "fiori.sys.enter.2")
        ///
        public static let sysEnterFill = Image(fioriName: "fiori.sys.enter.fill")
        ///
        public static let sysEnter = Image(fioriName: "fiori.sys.enter")
        ///
        public static let sysHelp2 = Image(fioriName: "fiori.sys.help.2")
        ///
        public static let sysHelpFill = Image(fioriName: "fiori.sys.help.fill")
        ///
        public static let sysHelp = Image(fioriName: "fiori.sys.help")
        ///
        public static let targetGroupFill = Image(fioriName: "fiori.target.group.fill")
        ///
        public static let targetGroup = Image(fioriName: "fiori.target.group")
        ///
        public static let temperature = Image(fioriName: "fiori.temperature")
        ///
        public static let toBeReviewed = Image(fioriName: "fiori.to.be.reviewed")
        ///
        public static let travelRequest = Image(fioriName: "fiori.travel.request")
        ///
        public static let tripReport = Image(fioriName: "fiori.trip.report")
        ///
        public static let unlocked = Image(fioriName: "fiori.unlocked")
        ///
        public static let validate = Image(fioriName: "fiori.validate")
        ///
        public static let warning = Image(fioriName: "fiori.warning")
        ///
        public static let warning2 = Image(fioriName: "fiori.warning2")
    }

    public enum tables {
        ///
        public static let chartTableView = Image(fioriName: "fiori.chart.table.view")
        ///
        public static let checklist2 = Image(fioriName: "fiori.checklist.2")
        ///
        public static let checklistItem2 = Image(fioriName: "fiori.checklist.item.2")
        ///
        public static let checklistItem = Image(fioriName: "fiori.checklist.item")
        ///
        public static let checklist = Image(fioriName: "fiori.checklist")
        ///
        public static let chevronPhase2 = Image(fioriName: "fiori.chevron.phase.2")
        ///
        public static let chevronPhase = Image(fioriName: "fiori.chevron.phase")
        ///
        public static let circleTask2 = Image(fioriName: "fiori.circle.task.2")
        ///
        public static let circleTaskFill = Image(fioriName: "fiori.circle.task.fill")
        ///
        public static let circleTask = Image(fioriName: "fiori.circle.task")
        ///
        public static let clearAll = Image(fioriName: "fiori.clear.all")
        ///
        public static let detailLess = Image(fioriName: "fiori.detail.less")
        ///
        public static let detailMore = Image(fioriName: "fiori.detail.more")
        ///
        public static let masterTaskTriangle2 = Image(fioriName: "fiori.master.task.triangle.2")
        ///
        public static let masterTaskTriangle = Image(fioriName: "fiori.master.task.triangle")
        ///
        public static let mirroredTaskCircle2 = Image(fioriName: "fiori.mirrored.task.circle.2")
        ///
        public static let mirroredTaskCircle = Image(fioriName: "fiori.mirrored.task.circle")
        ///
        public static let programTriangles2 = Image(fioriName: "fiori.program.triangles.2")
        ///
        public static let programTrianglesFill = Image(fioriName: "fiori.program.triangles.fill")
        ///
        public static let programTriangles = Image(fioriName: "fiori.program.triangles")
        ///
        public static let projectDefinitionTriangle2 = Image(fioriName: "fiori.project.definition.triangle.2")
        ///
        public static let projectDefinitionTriangle = Image(fioriName: "fiori.project.definition.triangle")
        ///
        public static let provision = Image(fioriName: "fiori.provision")
        ///
        public static let rhombusMilestone2 = Image(fioriName: "fiori.rhombus.milestone.2")
        ///
        public static let rhombusMilestone = Image(fioriName: "fiori.rhombus.milestone")
        ///
        public static let sum = Image(fioriName: "fiori.sum")
        ///
        public static let tableChart = Image(fioriName: "fiori.table.chart")
        ///
        public static let tableColumn = Image(fioriName: "fiori.table.column")
        ///
        public static let tableRow = Image(fioriName: "fiori.table.row")
        ///
        public static let tableView = Image(fioriName: "fiori.table.view")
        ///
        public static let triState = Image(fioriName: "fiori.tri.state")
    }

    public enum text {
        ///
        public static let boldText = Image(fioriName: "fiori.bold.text")
        ///
        public static let bulletTextFill = Image(fioriName: "fiori.bullet.text.fill")
        ///
        public static let bulletText = Image(fioriName: "fiori.bullet.text")
        ///
        public static let cursorArrow = Image(fioriName: "fiori.cursor.arrow")
        ///
        public static let decreaseLineHeight = Image(fioriName: "fiori.decrease.line.height")
        ///
        public static let detailLess = Image(fioriName: "fiori.detail.less")
        ///
        public static let detailMore = Image(fioriName: "fiori.detail.more")
        ///
        public static let fx = Image(fioriName: "fiori.fx")
        ///
        public static let heading1 = Image(fioriName: "fiori.heading1")
        ///
        public static let heading2 = Image(fioriName: "fiori.heading2")
        ///
        public static let heading3 = Image(fioriName: "fiori.heading3")
        ///
        public static let hint = Image(fioriName: "fiori.hint")
        ///
        public static let increaseLineHeight = Image(fioriName: "fiori.increase.line.height")
        ///
        public static let indent = Image(fioriName: "fiori.indent")
        ///
        public static let italicText = Image(fioriName: "fiori.italic.text")
        ///
        public static let numberedText = Image(fioriName: "fiori.numbered.text")
        ///
        public static let outdent = Image(fioriName: "fiori.outdent")
        ///
        public static let strikethrough = Image(fioriName: "fiori.strikethrough")
        ///
        public static let syntax = Image(fioriName: "fiori.syntax")
        ///
        public static let textAlignCenter = Image(fioriName: "fiori.text.align.center")
        ///
        public static let textAlignJustified = Image(fioriName: "fiori.text.align.justified")
        ///
        public static let textAlignLeft = Image(fioriName: "fiori.text.align.left")
        ///
        public static let textAlignRight = Image(fioriName: "fiori.text.align.right")
        ///
        public static let textColor = Image(fioriName: "fiori.text.colour")
        ///
        public static let textFormatting = Image(fioriName: "fiori.text.formatting")
        ///
        public static let text = Image(fioriName: "fiori.text")
        ///
        public static let translate = Image(fioriName: "fiori.translate")
        ///
        public static let underlineText = Image(fioriName: "fiori.underline.text")
    }

    public enum things {
        ///
        public static let basketFill = Image(fioriName: "fiori.basket.fill")
        ///
        public static let basket = Image(fioriName: "fiori.basket")
        ///
        public static let bed = Image(fioriName: "fiori.bed")
        ///
        public static let calendarFill = Image(fioriName: "fiori.calendar.fill")
        ///
        public static let calendar = Image(fioriName: "fiori.calendar")
        ///
        public static let camera = Image(fioriName: "fiori.camera")
        ///
        public static let cart = Image(fioriName: "fiori.cart")
        ///
        public static let cloud = Image(fioriName: "fiori.cloud")
        ///
        public static let compare2 = Image(fioriName: "fiori.compare.2")
        ///
        public static let competitorFill = Image(fioriName: "fiori.competitor.fill")
        ///
        public static let competitor = Image(fioriName: "fiori.competitor")
        ///
        public static let courseBook = Image(fioriName: "fiori.course.book")
        ///
        public static let database = Image(fioriName: "fiori.database")
        ///
        public static let dishwasher = Image(fioriName: "fiori.dishwasher")
        ///
        public static let display = Image(fioriName: "fiori.display")
        ///
        public static let eCare = Image(fioriName: "fiori.e.care")
        ///
        public static let educationFill = Image(fioriName: "fiori.education.fill")
        ///
        public static let education = Image(fioriName: "fiori.education")
        ///
        public static let energySavingLightbulb = Image(fioriName: "fiori.energy.saving.lightbulb")
        ///
        public static let eraser = Image(fioriName: "fiori.eraser")
        ///
        public static let explorer = Image(fioriName: "fiori.explorer")
        ///
        public static let fridge = Image(fioriName: "fiori.fridge")
        ///
        public static let ipad2 = Image(fioriName: "fiori.ipad.2")
        ///
        public static let ipad = Image(fioriName: "fiori.ipad")
        ///
        public static let iphone2 = Image(fioriName: "fiori.iphone.2")
        ///
        public static let iphone = Image(fioriName: "fiori.iphone")
        ///
        public static let jam = Image(fioriName: "fiori.jam")
        ///
        public static let key = Image(fioriName: "fiori.key")
        ///
        public static let lab = Image(fioriName: "fiori.lab")
        ///
        public static let laptop = Image(fioriName: "fiori.laptop")
        ///
        public static let machine = Image(fioriName: "fiori.machine")
        ///
        public static let marketingCampaign = Image(fioriName: "fiori.marketing.campaign")
        ///
        public static let meal = Image(fioriName: "fiori.meal")
        ///
        public static let microphone = Image(fioriName: "fiori.microphone")
        ///
        public static let mileage = Image(fioriName: "fiori.mileage")
        ///
        public static let nutritionActivity = Image(fioriName: "fiori.nutrition.activity")
        ///
        public static let palette = Image(fioriName: "fiori.palette")
        ///
        public static let paperPlane = Image(fioriName: "fiori.paper.plane")
        ///
        public static let pharmacy = Image(fioriName: "fiori.pharmacy")
        ///
        public static let phone = Image(fioriName: "fiori.phone")
        ///
        public static let picture = Image(fioriName: "fiori.picture")
        ///
        public static let post = Image(fioriName: "fiori.post")
        ///
        public static let projector = Image(fioriName: "fiori.projector")
        ///
        public static let puzzle = Image(fioriName: "fiori.puzzle")
        ///
        public static let sapUi5 = Image(fioriName: "fiori.sap.ui5")
        ///
        public static let simulate = Image(fioriName: "fiori.simulate")
        ///
        public static let soccer = Image(fioriName: "fiori.soccer")
        ///
        public static let stethoscope = Image(fioriName: "fiori.stethoscope")
        ///
        public static let studyLeaveFill = Image(fioriName: "fiori.study.leave.fill")
        ///
        public static let studyLeave = Image(fioriName: "fiori.study.leave")
        ///
        public static let suitcaseFill = Image(fioriName: "fiori.suitcase.fill")
        ///
        public static let suitcase = Image(fioriName: "fiori.suitcase")
        ///
        public static let sysFind = Image(fioriName: "fiori.sys.find")
        ///
        public static let sysMonitor = Image(fioriName: "fiori.sys.monitor")
        ///
        public static let tags = Image(fioriName: "fiori.tags")
        ///
        public static let temperature = Image(fioriName: "fiori.temperature")
        ///
        public static let umbrella = Image(fioriName: "fiori.umbrella")
        ///
        public static let video = Image(fioriName: "fiori.video")
        ///
        public static let wallet = Image(fioriName: "fiori.wallet")
        ///
        public static let washingMachine = Image(fioriName: "fiori.washing.machine")
        ///
        public static let webCam = Image(fioriName: "fiori.web.cam")
        ///
        public static let wrench = Image(fioriName: "fiori.wrench")
    }

    public enum time {
        ///
        public static let createEntryTime = Image(fioriName: "fiori.create.entry.time")
        ///
        public static let customerHistory = Image(fioriName: "fiori.customer.history")
        ///
        public static let fobWatchFill = Image(fioriName: "fiori.fob.watch.fill")
        ///
        public static let fobWatch = Image(fioriName: "fiori.fob.watch")
        ///
        public static let future = Image(fioriName: "fiori.future")
        ///
        public static let history = Image(fioriName: "fiori.history")
        ///
        public static let instance = Image(fioriName: "fiori.instance")
        ///
        public static let lateness = Image(fioriName: "fiori.lateness")
        ///
        public static let lineChartTimeAxis = Image(fioriName: "fiori.line.chart.time.axis")
        ///
        public static let past = Image(fioriName: "fiori.past")
        ///
        public static let pending = Image(fioriName: "fiori.pending")
        ///
        public static let present = Image(fioriName: "fiori.present")
        ///
        public static let timeAccount = Image(fioriName: "fiori.time.account")
        ///
        public static let timeEntryRequest = Image(fioriName: "fiori.time.entry.request")
        ///
        public static let timeOvertime = Image(fioriName: "fiori.time.overtime")
        ///
        public static let timesheet = Image(fioriName: "fiori.timesheet")
    }

    public enum transport {
        ///
        public static let busPublicTransport = Image(fioriName: "fiori.bus.public.transport")
        ///
        public static let carRentalFill = Image(fioriName: "fiori.car.rental.fill")
        ///
        public static let carRental = Image(fioriName: "fiori.car.rental")
        ///
        public static let cargoTrain = Image(fioriName: "fiori.cargo.train")
        ///
        public static let collision = Image(fioriName: "fiori.collision")
        ///
        public static let flight = Image(fioriName: "fiori.flight")
        ///
        public static let inventory = Image(fioriName: "fiori.inventory")
        ///
        public static let passengerTrain = Image(fioriName: "fiori.passenger.train")
        ///
        public static let shippingStatus = Image(fioriName: "fiori.shipping.status")
        ///
        public static let subwayTrain = Image(fioriName: "fiori.subway.train")
        ///
        public static let taxi = Image(fioriName: "fiori.taxi")
        ///
        public static let travelExpenseReportFill = Image(fioriName: "fiori.travel.expense.report.fill")
        ///
        public static let travelExpenseReport = Image(fioriName: "fiori.travel.expense.report")
        ///
        public static let travelExpense = Image(fioriName: "fiori.travel.expense")
        ///
        public static let travelItinerary = Image(fioriName: "fiori.travel.itinerary")
        ///
        public static let travelRequest = Image(fioriName: "fiori.travel.request")
        ///
        public static let tripReport = Image(fioriName: "fiori.trip.report")
        ///
        public static let vehicleRepair = Image(fioriName: "fiori.vehicle.repair")
    }

    public enum travel {
        ///
        public static let bed = Image(fioriName: "fiori.bed")
        ///
        public static let busPublicTransport = Image(fioriName: "fiori.bus.public.transport")
        ///
        public static let carRentalFill = Image(fioriName: "fiori.car.rental.fill")
        ///
        public static let carRental = Image(fioriName: "fiori.car.rental")
        ///
        public static let cargoTrain = Image(fioriName: "fiori.cargo.train")
        ///
        public static let doctor = Image(fioriName: "fiori.doctor")
        ///
        public static let flight = Image(fioriName: "fiori.flight")
        ///
        public static let homeFill = Image(fioriName: "fiori.home.fill")
        ///
        public static let home = Image(fioriName: "fiori.home")
        ///
        public static let meal = Image(fioriName: "fiori.meal")
        ///
        public static let passengerTrain = Image(fioriName: "fiori.passenger.train")
        ///
        public static let physicalActivity = Image(fioriName: "fiori.physical.activity")
        ///
        public static let shippingStatus = Image(fioriName: "fiori.shipping.status")
        ///
        public static let subwayTrain = Image(fioriName: "fiori.subway.train")
        ///
        public static let suitcaseFill = Image(fioriName: "fiori.suitcase.fill")
        ///
        public static let suitcase = Image(fioriName: "fiori.suitcase")
        ///
        public static let taxi = Image(fioriName: "fiori.taxi")
        ///
        public static let travelExpense = Image(fioriName: "fiori.travel.expense")
        ///
        public static let travelItinerary = Image(fioriName: "fiori.travel.itinerary")
        ///
        public static let world = Image(fioriName: "fiori.world")
    }
}

extension Image {
    /// Create a fiori symbol image.
    /// - Parameter fioriName: The name of the fiori symbol image.
    public init(fioriName: String) {
        self.init(fioriName, bundle: Bundle.accessor)
    }
    
    /// The underlying Quartz image data.
    public var cgImage: CGImage? {
        self.uiImage?.cgImage
    }
    
    /// The name of the symbol image.
    var name: String? {
        guard let name = Mirror(reflecting: self).descendant("provider", "base", "name") as? String else {
            return nil
        }
        
        return name
    }
    
    var uiImage: UIImage? {
        guard let name = name else {
            return nil
        }
        
        return UIImage(named: name, in: Bundle.accessor, with: nil)
    }
}
