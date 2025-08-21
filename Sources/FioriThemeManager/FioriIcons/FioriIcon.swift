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
        public static let ai = Image(fioriName: "fiori.ai")
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
        public static let bookmark2 = Image(fioriName: "fiori.bookmark.2")
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
        public static let clearAll = Image(fioriName: "fiori.clear.all")
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
        public static let darkMode = Image(fioriName: "fiori.dark.mode")
        ///
        public static let decline = Image(fioriName: "fiori.decline")
        ///
        public static let decreaseLineHeight = Image(fioriName: "fiori.decrease.line.height")
        ///
        public static let deleteFill = Image(fioriName: "fiori.delete.fill")
        ///
        public static let delete = Image(fioriName: "fiori.delete")
        ///
        public static let detailLess = Image(fioriName: "fiori.detail.less")
        ///
        public static let detailMore = Image(fioriName: "fiori.detail.more")
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
        public static let feedback = Image(fioriName: "fiori.feedback")
        ///
        public static let filterFill = Image(fioriName: "fiori.filter.fill")
        ///
        public static let filter = Image(fioriName: "fiori.filter")
        ///
        public static let flag = Image(fioriName: "fiori.flag")
        ///
        public static let flag2 = Image(fioriName: "fiori.flag.2")
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
        public static let halfStar = Image(fioriName: "fiori.half.star")
        ///
        public static let heading1 = Image(fioriName: "fiori.heading1")
        ///
        public static let heading2 = Image(fioriName: "fiori.heading2")
        ///
        public static let heading3 = Image(fioriName: "fiori.heading3")
        ///
        public static let heart = Image(fioriName: "fiori.heart")
        ///
        public static let heart2 = Image(fioriName: "fiori.heart.2")
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
        public static let lightMode = Image(fioriName: "fiori.light.mode")
        ///
        public static let linkExternal = Image(fioriName: "fiori.link.external")
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
        public static let paintBucket = Image(fioriName: "fiori.paint.bucket")
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
        public static let rotate = Image(fioriName: "fiori.rotate")
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
        public static let shield2 = Image(fioriName: "fiori.shield.2")
        ///
        public static let shortcut = Image(fioriName: "fiori.shortcut")
        ///
        public static let show = Image(fioriName: "fiori.show")
        ///
        public static let showEdit = Image(fioriName: "fiori.show.edit")
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
        public static let sum = Image(fioriName: "fiori.sum")
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
        public static let thumbDownFill = Image(fioriName: "fiori.thumb.down.fill")
        ///
        public static let thumbUp = Image(fioriName: "fiori.thumb.up")
        ///
        public static let thumbUpFill = Image(fioriName: "fiori.thumb.up.fill")
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
        public static let triState = Image(fioriName: "fiori.tri.state")
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
        public static let unsynchronize = Image(fioriName: "fiori.unsynchronize")
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
        public static let verified = Image(fioriName: "fiori.verified")
        ///
        public static let verticalGrip = Image(fioriName: "fiori.vertical.grip")
        ///
        public static let video = Image(fioriName: "fiori.video")
        ///
        public static let visits = Image(fioriName: "fiori.visits")
        ///
        public static let walkMe = Image(fioriName: "fiori.walk.me")
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
        public static let arrowTopLeft = Image(fioriName: "fiori.arrow.top.left")
        ///
        public static let arrowTopRight = Image(fioriName: "fiori.arrow.top.right")
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
        public static let commandLineInterfaces = Image(fioriName: "fiori.command.line.interfaces")
        ///
        public static let directionArrows = Image(fioriName: "fiori.direction.arrows")
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
        public static let megamenu = Image(fioriName: "fiori.megamenu")
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
        public static let unsynchronize = Image(fioriName: "fiori.unsynchronize")
        ///
        public static let up = Image(fioriName: "fiori.up")
        ///
        public static let upload = Image(fioriName: "fiori.upload")
        ///
        public static let uploadToCloud = Image(fioriName: "fiori.upload.to.cloud")
        ///
        public static let visits = Image(fioriName: "fiori.visits")
        ///
        public static let walkMe = Image(fioriName: "fiori.walk.me")
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
        public static let browseFolder = Image(fioriName: "fiori.browse.folder")
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
        public static let showEdit = Image(fioriName: "fiori.show.edit")
        ///
        public static let survey = Image(fioriName: "fiori.survey")
    }
    
    public enum message {
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
        public static let disconnected = Image(fioriName: "fiori.disconnected")
        ///
        public static let employeeRejections = Image(fioriName: "fiori.employee.rejections")
        ///
        public static let error = Image(fioriName: "fiori.error")
        ///
        public static let goal = Image(fioriName: "fiori.goal")
        ///
        public static let highPriority = Image(fioriName: "fiori.high.priority")
        ///
        public static let hrApproval = Image(fioriName: "fiori.hr.approval")
        ///
        public static let incident = Image(fioriName: "fiori.incident")
        ///
        public static let information = Image(fioriName: "fiori.information")
        ///
        public static let leadOutdated = Image(fioriName: "fiori.lead.outdated")
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
        public static let statusCritical = Image(fioriName: "fiori.status.critical")
        ///
        public static let statusInactive = Image(fioriName: "fiori.status.inactive")
        ///
        public static let statusNegative = Image(fioriName: "fiori.status.negative")
        ///
        public static let statusPositive = Image(fioriName: "fiori.status.positive")
        ///
        public static let sysCancel2 = Image(fioriName: "fiori.sys.cancel.2")
        ///
        public static let sysCancel = Image(fioriName: "fiori.sys.cancel")
        ///
        public static let sysEnter2 = Image(fioriName: "fiori.sys.enter.2")
        ///
        public static let sysEnter = Image(fioriName: "fiori.sys.enter")
        ///
        public static let sysHelp2 = Image(fioriName: "fiori.sys.help.2")
        ///
        public static let sysHelp = Image(fioriName: "fiori.sys.help")
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
        public static let verified = Image(fioriName: "fiori.verified")
        ///
        public static let warning2 = Image(fioriName: "fiori.warning2")
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
        public static let daFill = Image(fioriName: "fiori.da.fill")
        ///
        public static let da = Image(fioriName: "fiori.da")
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
        public static let shield2 = Image(fioriName: "fiori.shield.2")
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
        public static let feedback = Image(fioriName: "fiori.feedback")
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
        public static let locateMe2 = Image(fioriName: "fiori.locate.me.2")
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
        public static let spaceNavigation = Image(fioriName: "fiori.space.navigation")
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
        public static let notEditable = Image(fioriName: "fiori.not.editable")
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
        public static let sysCancel2 = Image(fioriName: "fiori.sys.cancel.2")
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
        public static let verified = Image(fioriName: "fiori.verified")
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
        public static let inProgress = Image(fioriName: "fiori.in.progress")
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
    
    public enum illustrations {
        ///
        public static let addColumnDialog = Image(fioriName: "fiori.ill.add.column.dialog")
        ///
        public static let addColumnDot = Image(fioriName: "fiori.ill.add.column.dot")
        ///
        public static let addColumnScene = Image(fioriName: "fiori.ill.add.column.scene")
        ///
        public static let addColumnSpot = Image(fioriName: "fiori.ill.add.column.spot")
        ///
        public static let addDimensionsDialog = Image(fioriName: "fiori.ill.add.dimensions.dialog")
        ///
        public static let addDimensionsDot = Image(fioriName: "fiori.ill.add.dimensions.dot")
        ///
        public static let addDimensionsScene = Image(fioriName: "fiori.ill.add.dimensions.scene")
        ///
        public static let addDimensionsSpot = Image(fioriName: "fiori.ill.add.dimensions.spot")
        ///
        public static let addPeopleDialog = Image(fioriName: "fiori.ill.add.people.dialog")
        ///
        public static let addPeopleDot = Image(fioriName: "fiori.ill.add.people.dot")
        ///
        public static let addPeopleScene = Image(fioriName: "fiori.ill.add.people.scene")
        ///
        public static let addPeopleSpot = Image(fioriName: "fiori.ill.add.people.spot")
        ///
        public static let balloonSkyDialog = Image(fioriName: "fiori.ill.balloon.sky.dialog")
        ///
        public static let balloonSkyDot = Image(fioriName: "fiori.ill.balloon.sky.dot")
        ///
        public static let balloonSkyScene = Image(fioriName: "fiori.ill.balloon.sky.scene")
        ///
        public static let balloonSkySpot = Image(fioriName: "fiori.ill.balloon.sky.spot")
        ///
        public static let beforeSearchDialog = Image(fioriName: "fiori.ill.before.search.dialog")
        ///
        public static let beforeSearchDot = Image(fioriName: "fiori.ill.before.search.dot")
        ///
        public static let beforeSearchScene = Image(fioriName: "fiori.ill.before.search.scene")
        ///
        public static let beforeSearchSpot = Image(fioriName: "fiori.ill.before.search.spot")
        ///
        public static let beforeSearch2Dialog = Image(fioriName: "fiori.ill.before.search.2.dialog")
        ///
        public static let beforeSearch2Dot = Image(fioriName: "fiori.ill.before.search.2.dot")
        ///
        public static let beforeSearch2Scene = Image(fioriName: "fiori.ill.before.search.2.scene")
        ///
        public static let beforeSearch2Spot = Image(fioriName: "fiori.ill.before.search.2.spot")
        ///
        public static let connectionDialog = Image(fioriName: "fiori.ill.connection.dialog")
        ///
        public static let connectionDot = Image(fioriName: "fiori.ill.connection.dot")
        ///
        public static let connectionScene = Image(fioriName: "fiori.ill.connection.scene")
        ///
        public static let connectionSpot = Image(fioriName: "fiori.ill.connection.spot")
        ///
        public static let emptyCalendarDialog = Image(fioriName: "fiori.ill.empty.calendar.dialog")
        ///
        public static let emptyCalendarDot = Image(fioriName: "fiori.ill.empty.calendar.dot")
        ///
        public static let emptyCalendarScene = Image(fioriName: "fiori.ill.empty.calendar.scene")
        ///
        public static let emptyCalendarSpot = Image(fioriName: "fiori.ill.empty.calendar.spot")
        ///
        public static let emptyListDialog = Image(fioriName: "fiori.ill.empty.list.dialog")
        ///
        public static let emptyListDot = Image(fioriName: "fiori.ill.empty.list.dot")
        ///
        public static let emptyListScene = Image(fioriName: "fiori.ill.empty.list.scene")
        ///
        public static let emptyListSpot = Image(fioriName: "fiori.ill.empty.list.spot")
        ///
        public static let emptyPlanningCalendarDialog = Image(fioriName: "fiori.ill.empty.planning.calendar.dialog")
        ///
        public static let emptyPlanningCalendarDot = Image(fioriName: "fiori.ill.empty.planning.calendar.dot")
        ///
        public static let emptyPlanningCalendarScene = Image(fioriName: "fiori.ill.empty.planning.calendar.scene")
        ///
        public static let emptyPlanningCalendarSpot = Image(fioriName: "fiori.ill.empty.planning.calendar.spot")
        ///
        public static let errorScreenDialog = Image(fioriName: "fiori.ill.error.screen.dialog")
        ///
        public static let errorScreenDot = Image(fioriName: "fiori.ill.error.screen.dot")
        ///
        public static let errorScreenScene = Image(fioriName: "fiori.ill.error.screen.scene")
        ///
        public static let errorScreenSpot = Image(fioriName: "fiori.ill.error.screen.spot")
        ///
        public static let filterTableDialog = Image(fioriName: "fiori.ill.filter.table.dialog")
        ///
        public static let filterTableDot = Image(fioriName: "fiori.ill.filter.table.dot")
        ///
        public static let filterTableScene = Image(fioriName: "fiori.ill.filter.table.scene")
        ///
        public static let filterTableSpot = Image(fioriName: "fiori.ill.filter.table.spot")
        ///
        public static let groupTableDialog = Image(fioriName: "fiori.ill.group.table.dialog")
        ///
        public static let groupTableDot = Image(fioriName: "fiori.ill.group.table.dot")
        ///
        public static let groupTableScene = Image(fioriName: "fiori.ill.group.table.scene")
        ///
        public static let groupTableSpot = Image(fioriName: "fiori.ill.group.table.spot")
        ///
        public static let newMailDialog = Image(fioriName: "fiori.ill.new.mail.dialog")
        ///
        public static let newMailDot = Image(fioriName: "fiori.ill.new.mail.dot")
        ///
        public static let newMailScene = Image(fioriName: "fiori.ill.new.mail.scene")
        ///
        public static let newMailSpot = Image(fioriName: "fiori.ill.new.mail.spot")
        ///
        public static let noActivitiesDialog = Image(fioriName: "fiori.ill.no.activities.dialog")
        ///
        public static let noActivitiesDot = Image(fioriName: "fiori.ill.no.activities.dot")
        ///
        public static let noActivitiesScene = Image(fioriName: "fiori.ill.no.activities.scene")
        ///
        public static let noActivitiesSpot = Image(fioriName: "fiori.ill.no.activities.spot")
        ///
        public static let noColumnsSetDialog = Image(fioriName: "fiori.ill.no.columns.set.dialog")
        ///
        public static let noColumnsSetDot = Image(fioriName: "fiori.ill.no.columns.set.dot")
        ///
        public static let noColumnsSetScene = Image(fioriName: "fiori.ill.no.columns.set.scene")
        ///
        public static let noColumnsSetSpot = Image(fioriName: "fiori.ill.no.columns.set.spot")
        ///
        public static let noDataDialog = Image(fioriName: "fiori.ill.no.data.dialog")
        ///
        public static let noDataDot = Image(fioriName: "fiori.ill.no.data.dot")
        ///
        public static let noDataScene = Image(fioriName: "fiori.ill.no.data.scene")
        ///
        public static let noDataSpot = Image(fioriName: "fiori.ill.no.data.spot")
        ///
        public static let noDimensionsSetDialog = Image(fioriName: "fiori.ill.no.dimensions.set.dialog")
        ///
        public static let noDimensionsSetDot = Image(fioriName: "fiori.ill.no.dimensions.set.dot")
        ///
        public static let noDimensionsSetScene = Image(fioriName: "fiori.ill.no.dimensions.set.scene")
        ///
        public static let noDimensionsSetSpot = Image(fioriName: "fiori.ill.no.dimensions.set.spot")
        ///
        public static let noEntriesDialog = Image(fioriName: "fiori.ill.no.entries.dialog")
        ///
        public static let noEntriesDot = Image(fioriName: "fiori.ill.no.entries.dot")
        ///
        public static let noEntriesScene = Image(fioriName: "fiori.ill.no.entries.scene")
        ///
        public static let noEntriesSpot = Image(fioriName: "fiori.ill.no.entries.spot")
        ///
        public static let noFilterResultsDialog = Image(fioriName: "fiori.ill.no.filter.results.dialog")
        ///
        public static let noFilterResultsDot = Image(fioriName: "fiori.ill.no.filter.results.dot")
        ///
        public static let noFilterResultsScene = Image(fioriName: "fiori.ill.no.filter.results.scene")
        ///
        public static let noFilterResultsSpot = Image(fioriName: "fiori.ill.no.filter.results.spot")
        ///
        public static let noMailDialog = Image(fioriName: "fiori.ill.no.mail.dialog")
        ///
        public static let noMailDot = Image(fioriName: "fiori.ill.no.mail.dot")
        ///
        public static let noMailScene = Image(fioriName: "fiori.ill.no.mail.scene")
        ///
        public static let noMailSpot = Image(fioriName: "fiori.ill.no.mail.spot")
        ///
        public static let noMailV1Dialog = Image(fioriName: "fiori.ill.no.mail.v1.dialog")
        ///
        public static let noMailV1Dot = Image(fioriName: "fiori.ill.no.mail.v1.dot")
        ///
        public static let noMailV1Scene = Image(fioriName: "fiori.ill.no.mail.v1.scene")
        ///
        public static let noMailV1Spot = Image(fioriName: "fiori.ill.no.mail.v1.spot")
        ///
        public static let noNotificationsDialog = Image(fioriName: "fiori.ill.no.notifications.dialog")
        ///
        public static let noNotificationsDot = Image(fioriName: "fiori.ill.no.notifications.dot")
        ///
        public static let noNotificationsScene = Image(fioriName: "fiori.ill.no.notifications.scene")
        ///
        public static let noNotificationsSpot = Image(fioriName: "fiori.ill.no.notifications.spot")
        ///
        public static let noSavedItemsDialog = Image(fioriName: "fiori.ill.no.saved.items.dialog")
        ///
        public static let noSavedItemsDot = Image(fioriName: "fiori.ill.no.saved.items.dot")
        ///
        public static let noSavedItemsScene = Image(fioriName: "fiori.ill.no.saved.items.scene")
        ///
        public static let noSavedItemsSpot = Image(fioriName: "fiori.ill.no.saved.items.spot")
        ///
        public static let noSavedItemsV1Dialog = Image(fioriName: "fiori.ill.no.saved.items.v1.dialog")
        ///
        public static let noSavedItemsV1Dot = Image(fioriName: "fiori.ill.no.saved.items.v1.dot")
        ///
        public static let noSavedItemsV1Scene = Image(fioriName: "fiori.ill.no.saved.items.v1.scene")
        ///
        public static let noSavedItemsV1Spot = Image(fioriName: "fiori.ill.no.saved.items.v1.spot")
        ///
        public static let noSearchResultsDialog = Image(fioriName: "fiori.ill.no.search.results.dialog")
        ///
        public static let noSearchResultsDot = Image(fioriName: "fiori.ill.no.search.results.dot")
        ///
        public static let noSearchResultsScene = Image(fioriName: "fiori.ill.no.search.results.scene")
        ///
        public static let noSearchResultsSpot = Image(fioriName: "fiori.ill.no.search.results.spot")
        ///
        public static let noTasksDialog = Image(fioriName: "fiori.ill.no.tasks.dialog")
        ///
        public static let noTasksDot = Image(fioriName: "fiori.ill.no.tasks.dot")
        ///
        public static let noTasksScene = Image(fioriName: "fiori.ill.no.tasks.scene")
        ///
        public static let noTasksSpot = Image(fioriName: "fiori.ill.no.tasks.spot")
        ///
        public static let noTasksV1Dialog = Image(fioriName: "fiori.ill.no.tasks.v1.dialog")
        ///
        public static let noTasksV1Dot = Image(fioriName: "fiori.ill.no.tasks.v1.dot")
        ///
        public static let noTasksV1Scene = Image(fioriName: "fiori.ill.no.tasks.v1.scene")
        ///
        public static let noTasksV1Spot = Image(fioriName: "fiori.ill.no.tasks.v1.spot")
        ///
        public static let pageNotFoundDialog = Image(fioriName: "fiori.ill.page.not.found.dialog")
        ///
        public static let pageNotFoundDot = Image(fioriName: "fiori.ill.page.not.found.dot")
        ///
        public static let pageNotFoundScene = Image(fioriName: "fiori.ill.page.not.found.scene")
        ///
        public static let pageNotFoundSpot = Image(fioriName: "fiori.ill.page.not.found.spot")
        ///
        public static let reloadScreenDialog = Image(fioriName: "fiori.ill.reload.screen.dialog")
        ///
        public static let reloadScreenDot = Image(fioriName: "fiori.ill.reload.screen.dot")
        ///
        public static let reloadScreenScene = Image(fioriName: "fiori.ill.reload.screen.scene")
        ///
        public static let reloadScreenSpot = Image(fioriName: "fiori.ill.reload.screen.spot")
        ///
        public static let resizeColumnDialog = Image(fioriName: "fiori.ill.resize.column.dialog")
        ///
        public static let resizeColumnDot = Image(fioriName: "fiori.ill.resize.column.dot")
        ///
        public static let resizeColumnScene = Image(fioriName: "fiori.ill.resize.column.scene")
        ///
        public static let resizeColumnSpot = Image(fioriName: "fiori.ill.resize.column.spot")
        ///
        public static let searchEarthDialog = Image(fioriName: "fiori.ill.search.earth.dialog")
        ///
        public static let searchEarthDot = Image(fioriName: "fiori.ill.search.earth.dot")
        ///
        public static let searchEarthScene = Image(fioriName: "fiori.ill.search.earth.scene")
        ///
        public static let searchEarthSpot = Image(fioriName: "fiori.ill.search.earth.spot")
        ///
        public static let searchFolderDialog = Image(fioriName: "fiori.ill.search.folder.dialog")
        ///
        public static let searchFolderDot = Image(fioriName: "fiori.ill.search.folder.dot")
        ///
        public static let searchFolderScene = Image(fioriName: "fiori.ill.search.folder.scene")
        ///
        public static let searchFolderSpot = Image(fioriName: "fiori.ill.search.folder.spot")
        ///
        public static let signOutDialog = Image(fioriName: "fiori.ill.sign.out.dialog")
        ///
        public static let signOutDot = Image(fioriName: "fiori.ill.sign.out.dot")
        ///
        public static let signOutScene = Image(fioriName: "fiori.ill.sign.out.scene")
        ///
        public static let signOutSpot = Image(fioriName: "fiori.ill.sign.out.spot")
        ///
        public static let simpleBalloonDialog = Image(fioriName: "fiori.ill.simple.balloon.dialog")
        ///
        public static let simpleBalloonDot = Image(fioriName: "fiori.ill.simple.balloon.dot")
        ///
        public static let simpleBalloonScene = Image(fioriName: "fiori.ill.simple.balloon.scene")
        ///
        public static let simpleBalloonSpot = Image(fioriName: "fiori.ill.simple.balloon.spot")
        ///
        public static let simpleBellDialog = Image(fioriName: "fiori.ill.simple.bell.dialog")
        ///
        public static let simpleBellDot = Image(fioriName: "fiori.ill.simple.bell.dot")
        ///
        public static let simpleBellScene = Image(fioriName: "fiori.ill.simple.bell.scene")
        ///
        public static let simpleBellSpot = Image(fioriName: "fiori.ill.simple.bell.spot")
        ///
        public static let simpleCalendarDialog = Image(fioriName: "fiori.ill.simple.calendar.dialog")
        ///
        public static let simpleCalendarDot = Image(fioriName: "fiori.ill.simple.calendar.dot")
        ///
        public static let simpleCalendarScene = Image(fioriName: "fiori.ill.simple.calendar.scene")
        ///
        public static let simpleCalendarSpot = Image(fioriName: "fiori.ill.simple.calendar.spot")
        ///
        public static let simpleCheckMarkDialog = Image(fioriName: "fiori.ill.simple.check.mark.dialog")
        ///
        public static let simpleCheckMarkDot = Image(fioriName: "fiori.ill.simple.check.mark.dot")
        ///
        public static let simpleCheckMarkScene = Image(fioriName: "fiori.ill.simple.check.mark.scene")
        ///
        public static let simpleCheckMarkSpot = Image(fioriName: "fiori.ill.simple.check.mark.spot")
        ///
        public static let simpleConnectionDialog = Image(fioriName: "fiori.ill.simple.connection.dialog")
        ///
        public static let simpleConnectionDot = Image(fioriName: "fiori.ill.simple.connection.dot")
        ///
        public static let simpleConnectionScene = Image(fioriName: "fiori.ill.simple.connection.scene")
        ///
        public static let simpleConnectionSpot = Image(fioriName: "fiori.ill.simple.connection.spot")
        ///
        public static let simpleEmptyDocDialog = Image(fioriName: "fiori.ill.simple.empty.doc.dialog")
        ///
        public static let simpleEmptyDocDot = Image(fioriName: "fiori.ill.simple.empty.doc.dot")
        ///
        public static let simpleEmptyDocScene = Image(fioriName: "fiori.ill.simple.empty.doc.scene")
        ///
        public static let simpleEmptyDocSpot = Image(fioriName: "fiori.ill.simple.empty.doc.spot")
        ///
        public static let simpleEmptyListDialog = Image(fioriName: "fiori.ill.simple.empty.list.dialog")
        ///
        public static let simpleEmptyListDot = Image(fioriName: "fiori.ill.simple.empty.list.dot")
        ///
        public static let simpleEmptyListScene = Image(fioriName: "fiori.ill.simple.empty.list.scene")
        ///
        public static let simpleEmptyListSpot = Image(fioriName: "fiori.ill.simple.empty.list.spot")
        ///
        public static let simpleErrorDialog = Image(fioriName: "fiori.ill.simple.error.dialog")
        ///
        public static let simpleErrorDot = Image(fioriName: "fiori.ill.simple.error.dot")
        ///
        public static let simpleErrorScene = Image(fioriName: "fiori.ill.simple.error.scene")
        ///
        public static let simpleErrorSpot = Image(fioriName: "fiori.ill.simple.error.spot")
        ///
        public static let simpleMagnifierDialog = Image(fioriName: "fiori.ill.simple.magnifier.dialog")
        ///
        public static let simpleMagnifierDot = Image(fioriName: "fiori.ill.simple.magnifier.dot")
        ///
        public static let simpleMagnifierScene = Image(fioriName: "fiori.ill.simple.magnifier.scene")
        ///
        public static let simpleMagnifierSpot = Image(fioriName: "fiori.ill.simple.magnifier.spot")
        ///
        public static let simpleMailDialog = Image(fioriName: "fiori.ill.simple.mail.dialog")
        ///
        public static let simpleMailDot = Image(fioriName: "fiori.ill.simple.mail.dot")
        ///
        public static let simpleMailScene = Image(fioriName: "fiori.ill.simple.mail.scene")
        ///
        public static let simpleMailSpot = Image(fioriName: "fiori.ill.simple.mail.spot")
        ///
        public static let simpleNoSavedItemsDialog = Image(fioriName: "fiori.ill.simple.no.saved.items.dialog")
        ///
        public static let simpleNoSavedItemsDot = Image(fioriName: "fiori.ill.simple.no.saved.items.dot")
        ///
        public static let simpleNoSavedItemsScene = Image(fioriName: "fiori.ill.simple.no.saved.items.scene")
        ///
        public static let simpleNoSavedItemsSpot = Image(fioriName: "fiori.ill.simple.no.saved.items.spot")
        ///
        public static let simpleNotFoundMagnifierDialog = Image(fioriName: "fiori.ill.simple.not.found.magnifier.dialog")
        ///
        public static let simpleNotFoundMagnifierDot = Image(fioriName: "fiori.ill.simple.not.found.magnifier.dot")
        ///
        public static let simpleNotFoundMagnifierScene = Image(fioriName: "fiori.ill.simple.not.found.magnifier.scene")
        ///
        public static let simpleNotFoundMagnifierSpot = Image(fioriName: "fiori.ill.simple.not.found.magnifier.spot")
        ///
        public static let simpleReloadDialog = Image(fioriName: "fiori.ill.simple.reload.dialog")
        ///
        public static let simpleReloadDot = Image(fioriName: "fiori.ill.simple.reload.dot")
        ///
        public static let simpleReloadScene = Image(fioriName: "fiori.ill.simple.reload.scene")
        ///
        public static let simpleReloadSpot = Image(fioriName: "fiori.ill.simple.reload.spot")
        ///
        public static let simpleTaskDialog = Image(fioriName: "fiori.ill.simple.task.dialog")
        ///
        public static let simpleTaskDot = Image(fioriName: "fiori.ill.simple.task.dot")
        ///
        public static let simpleTaskScene = Image(fioriName: "fiori.ill.simple.task.scene")
        ///
        public static let simpleTaskSpot = Image(fioriName: "fiori.ill.simple.task.spot")
        ///
        public static let sleepingBellDialog = Image(fioriName: "fiori.ill.sleeping.bell.dialog")
        ///
        public static let sleepingBellDot = Image(fioriName: "fiori.ill.sleeping.bell.dot")
        ///
        public static let sleepingBellScene = Image(fioriName: "fiori.ill.sleeping.bell.scene")
        ///
        public static let sleepingBellSpot = Image(fioriName: "fiori.ill.sleeping.bell.spot")
        ///
        public static let sortColumnDialog = Image(fioriName: "fiori.ill.sort.column.dialog")
        ///
        public static let sortColumnDot = Image(fioriName: "fiori.ill.sort.column.dot")
        ///
        public static let sortColumnScene = Image(fioriName: "fiori.ill.sort.column.scene")
        ///
        public static let sortColumnSpot = Image(fioriName: "fiori.ill.sort.column.spot")
        ///
        public static let successBalloonScene = Image(fioriName: "fiori.ill.success.balloon.scene")
        ///
        public static let successBalloonDialog = Image(fioriName: "fiori.ill.success.balloon.dialog")
        ///
        public static let successBalloonDot = Image(fioriName: "fiori.ill.success.balloon.dot")
        ///
        public static let successBalloonSpot = Image(fioriName: "fiori.ill.success.balloon.spot")
        ///
        public static let successCheckMarkDialog = Image(fioriName: "fiori.ill.success.check.mark.dialog")
        ///
        public static let successCheckMarkDot = Image(fioriName: "fiori.ill.success.check.mark.dot")
        ///
        public static let successCheckMarkScene = Image(fioriName: "fiori.ill.success.check.mark.scene")
        ///
        public static let successCheckMarkSpot = Image(fioriName: "fiori.ill.success.check.mark.spot")
        ///
        public static let successHighFiveDialog = Image(fioriName: "fiori.ill.success.high.five.dialog")
        ///
        public static let successHighFiveDot = Image(fioriName: "fiori.ill.success.high.five.dot")
        ///
        public static let successHighFiveScene = Image(fioriName: "fiori.ill.success.high.five.scene")
        ///
        public static let successHighFiveSpot = Image(fioriName: "fiori.ill.success.high.five.spot")
        ///
        public static let successScreenDialog = Image(fioriName: "fiori.ill.success.screen.dialog")
        ///
        public static let successScreenDot = Image(fioriName: "fiori.ill.success.screen.dot")
        ///
        public static let successScreenScene = Image(fioriName: "fiori.ill.success.screen.scene")
        ///
        public static let successScreenSpot = Image(fioriName: "fiori.ill.success.screen.spot")
        ///
        public static let surveyDialog = Image(fioriName: "fiori.ill.survey.dialog")
        ///
        public static let surveyDot = Image(fioriName: "fiori.ill.survey.dot")
        ///
        public static let surveyScene = Image(fioriName: "fiori.ill.survey.scene")
        ///
        public static let surveySpot = Image(fioriName: "fiori.ill.survey.spot")
        ///
        public static let tentDialog = Image(fioriName: "fiori.ill.tent.dialog")
        ///
        public static let tentDot = Image(fioriName: "fiori.ill.tent.dot")
        ///
        public static let tentScene = Image(fioriName: "fiori.ill.tent.scene")
        ///
        public static let tentSpot = Image(fioriName: "fiori.ill.tent.spot")
        ///
        public static let tntAvatarDialog = Image(fioriName: "fiori.ill.tnt.avatar.dialog")
        ///
        public static let tntAvatarDot = Image(fioriName: "fiori.ill.tnt.avatar.dot")
        ///
        public static let tntAvatarScene = Image(fioriName: "fiori.ill.tnt.avatar.scene")
        ///
        public static let tntAvatarSpot = Image(fioriName: "fiori.ill.tnt.avatar.spot")
        ///
        public static let tntCalculatorDialog = Image(fioriName: "fiori.ill.tnt.calculator.dialog")
        ///
        public static let tntCalculatorDot = Image(fioriName: "fiori.ill.tnt.calculator.dot")
        ///
        public static let tntCalculatorScene = Image(fioriName: "fiori.ill.tnt.calculator.scene")
        ///
        public static let tntCalculatorSpot = Image(fioriName: "fiori.ill.tnt.calculator.spot")
        ///
        public static let tntChartDoughnutDialog = Image(fioriName: "fiori.ill.tnt.chart.doughnut.dialog")
        ///
        public static let tntChartDoughnutDot = Image(fioriName: "fiori.ill.tnt.chart.doughnut.dot")
        ///
        public static let tntChartDoughnutScene = Image(fioriName: "fiori.ill.tnt.chart.doughnut.scene")
        ///
        public static let tntChartDoughnutSpot = Image(fioriName: "fiori.ill.tnt.chart.doughnut.spot")
        ///
        public static let tntChartAreaDialog = Image(fioriName: "fiori.ill.tnt.chart.area.dialog")
        ///
        public static let tntChartAreaDot = Image(fioriName: "fiori.ill.tnt.chart.area.dot")
        ///
        public static let tntChartAreaScene = Image(fioriName: "fiori.ill.tnt.chart.area.scene")
        ///
        public static let tntChartAreaSpot = Image(fioriName: "fiori.ill.tnt.chart.area.spot")
        ///
        public static let tntChartArea2Dialog = Image(fioriName: "fiori.ill.tnt.chart.area2.dialog")
        ///
        public static let tntChartArea2Dot = Image(fioriName: "fiori.ill.tnt.chart.area2.dot")
        ///
        public static let tntChartArea2Scene = Image(fioriName: "fiori.ill.tnt.chart.area2.scene")
        ///
        public static let tntChartArea2Spot = Image(fioriName: "fiori.ill.tnt.chart.area2.spot")
        ///
        public static let tntChartBarDialog = Image(fioriName: "fiori.ill.tnt.chart.bar.dialog")
        ///
        public static let tntChartBarDot = Image(fioriName: "fiori.ill.tnt.chart.bar.dot")
        ///
        public static let tntChartBarScene = Image(fioriName: "fiori.ill.tnt.chart.bar.scene")
        ///
        public static let tntChartBarSpot = Image(fioriName: "fiori.ill.tnt.chart.bar.spot")
        ///
        public static let tntChartBpmnFlowDialog = Image(fioriName: "fiori.ill.tnt.chart.bpmn.flow.dialog")
        ///
        public static let tntChartBpmnFlowDot = Image(fioriName: "fiori.ill.tnt.chart.bpmn.flow.dot")
        ///
        public static let tntChartBpmnFlowScene = Image(fioriName: "fiori.ill.tnt.chart.bpmn.flow.scene")
        ///
        public static let tntChartBpmnFlowSpot = Image(fioriName: "fiori.ill.tnt.chart.bpmn.flow.spot")
        ///
        public static let tntChartBulletDialog = Image(fioriName: "fiori.ill.tnt.chart.bullet.dialog")
        ///
        public static let tntChartBulletDot = Image(fioriName: "fiori.ill.tnt.chart.bullet.dot")
        ///
        public static let tntChartBulletScene = Image(fioriName: "fiori.ill.tnt.chart.bullet.scene")
        ///
        public static let tntChartBulletSpot = Image(fioriName: "fiori.ill.tnt.chart.bullet.spot")
        ///
        public static let tntChartFlowDialog = Image(fioriName: "fiori.ill.tnt.chart.flow.dialog")
        ///
        public static let tntChartFlowDot = Image(fioriName: "fiori.ill.tnt.chart.flow.dot")
        ///
        public static let tntChartFlowScene = Image(fioriName: "fiori.ill.tnt.chart.flow.scene")
        ///
        public static let tntChartFlowSpot = Image(fioriName: "fiori.ill.tnt.chart.flow.spot")
        ///
        public static let tntChartGanttDialog = Image(fioriName: "fiori.ill.tnt.chart.gantt.dialog")
        ///
        public static let tntChartGanttDot = Image(fioriName: "fiori.ill.tnt.chart.gantt.dot")
        ///
        public static let tntChartGanttScene = Image(fioriName: "fiori.ill.tnt.chart.gantt.scene")
        ///
        public static let tntChartGanttSpot = Image(fioriName: "fiori.ill.tnt.chart.gantt.spot")
        ///
        public static let tntChartOrgDialog = Image(fioriName: "fiori.ill.tnt.chart.org.dialog")
        ///
        public static let tntChartOrgDot = Image(fioriName: "fiori.ill.tnt.chart.org.dot")
        ///
        public static let tntChartOrgScene = Image(fioriName: "fiori.ill.tnt.chart.org.scene")
        ///
        public static let tntChartOrgSpot = Image(fioriName: "fiori.ill.tnt.chart.org.spot")
        ///
        public static let tntChartPieDialog = Image(fioriName: "fiori.ill.tnt.chart.pie.dialog")
        ///
        public static let tntChartPieDot = Image(fioriName: "fiori.ill.tnt.chart.pie.dot")
        ///
        public static let tntChartPieScene = Image(fioriName: "fiori.ill.tnt.chart.pie.scene")
        ///
        public static let tntChartPieSpot = Image(fioriName: "fiori.ill.tnt.chart.pie.spot")
        ///
        public static let tntCodePlaceholderDialog = Image(fioriName: "fiori.ill.tnt.code.placeholder.dialog")
        ///
        public static let tntCodePlaceholderDot = Image(fioriName: "fiori.ill.tnt.code.placeholder.dot")
        ///
        public static let tntCodePlaceholderScene = Image(fioriName: "fiori.ill.tnt.code.placeholder.scene")
        ///
        public static let tntCodePlaceholderSpot = Image(fioriName: "fiori.ill.tnt.code.placeholder.spot")
        ///
        public static let tntCompanyDialog = Image(fioriName: "fiori.ill.tnt.company.dialog")
        ///
        public static let tntCompanyDot = Image(fioriName: "fiori.ill.tnt.company.dot")
        ///
        public static let tntCompanyScene = Image(fioriName: "fiori.ill.tnt.company.scene")
        ///
        public static let tntCompanySpot = Image(fioriName: "fiori.ill.tnt.company.spot")
        ///
        public static let tntCompassDialog = Image(fioriName: "fiori.ill.tnt.compass.dialog")
        ///
        public static let tntCompassDot = Image(fioriName: "fiori.ill.tnt.compass.dot")
        ///
        public static let tntCompassScene = Image(fioriName: "fiori.ill.tnt.compass.scene")
        ///
        public static let tntCompassSpot = Image(fioriName: "fiori.ill.tnt.compass.spot")
        ///
        public static let tntComponentsDialog = Image(fioriName: "fiori.ill.tnt.components.dialog")
        ///
        public static let tntComponentsDot = Image(fioriName: "fiori.ill.tnt.components.dot")
        ///
        public static let tntComponentsScene = Image(fioriName: "fiori.ill.tnt.components.scene")
        ///
        public static let tntComponentsSpot = Image(fioriName: "fiori.ill.tnt.components.spot")
        ///
        public static let tntDialogDialog = Image(fioriName: "fiori.ill.tnt.dialog.dialog")
        ///
        public static let tntDialogDot = Image(fioriName: "fiori.ill.tnt.dialog.dot")
        ///
        public static let tntDialogScene = Image(fioriName: "fiori.ill.tnt.dialog.scene")
        ///
        public static let tntDialogSpot = Image(fioriName: "fiori.ill.tnt.dialog.spot")
        ///
        public static let tntExternalLinkDialog = Image(fioriName: "fiori.ill.tnt.external.link.dialog")
        ///
        public static let tntExternalLinkDot = Image(fioriName: "fiori.ill.tnt.external.link.dot")
        ///
        public static let tntExternalLinkScene = Image(fioriName: "fiori.ill.tnt.external.link.scene")
        ///
        public static let tntExternalLinkSpot = Image(fioriName: "fiori.ill.tnt.external.link.spot")
        ///
        public static let tntFaceIdDialog = Image(fioriName: "fiori.ill.tnt.face.id.dialog")
        ///
        public static let tntFaceIdDot = Image(fioriName: "fiori.ill.tnt.face.id.dot")
        ///
        public static let tntFaceIdScene = Image(fioriName: "fiori.ill.tnt.face.id.scene")
        ///
        public static let tntFaceIdSpot = Image(fioriName: "fiori.ill.tnt.face.id.spot")
        ///
        public static let tntFingerprintDialog = Image(fioriName: "fiori.ill.tnt.fingerprint.dialog")
        ///
        public static let tntFingerprintDot = Image(fioriName: "fiori.ill.tnt.fingerprint.dot")
        ///
        public static let tntFingerprintScene = Image(fioriName: "fiori.ill.tnt.fingerprint.scene")
        ///
        public static let tntFingerprintSpot = Image(fioriName: "fiori.ill.tnt.fingerprint.spot")
        ///
        public static let tntHandshakeDialog = Image(fioriName: "fiori.ill.tnt.handshake.dialog")
        ///
        public static let tntHandshakeDot = Image(fioriName: "fiori.ill.tnt.handshake.dot")
        ///
        public static let tntHandshakeScene = Image(fioriName: "fiori.ill.tnt.handshake.scene")
        ///
        public static let tntHandshakeSpot = Image(fioriName: "fiori.ill.tnt.handshake.spot")
        ///
        public static let tntHelpDialog = Image(fioriName: "fiori.ill.tnt.help.dialog")
        ///
        public static let tntHelpDot = Image(fioriName: "fiori.ill.tnt.help.dot")
        ///
        public static let tntHelpScene = Image(fioriName: "fiori.ill.tnt.help.scene")
        ///
        public static let tntHelpSpot = Image(fioriName: "fiori.ill.tnt.help.spot")
        ///
        public static let tntLockDialog = Image(fioriName: "fiori.ill.tnt.lock.dialog")
        ///
        public static let tntLockDot = Image(fioriName: "fiori.ill.tnt.lock.dot")
        ///
        public static let tntLockScene = Image(fioriName: "fiori.ill.tnt.lock.scene")
        ///
        public static let tntLockSpot = Image(fioriName: "fiori.ill.tnt.lock.spot")
        ///
        public static let tntMissionDialog = Image(fioriName: "fiori.ill.tnt.mission.dialog")
        ///
        public static let tntMissionDot = Image(fioriName: "fiori.ill.tnt.mission.dot")
        ///
        public static let tntMissionFailedDialog = Image(fioriName: "fiori.ill.tnt.mission.failed.dialog")
        ///
        public static let tntMissionFailedDot = Image(fioriName: "fiori.ill.tnt.mission.failed.dot")
        ///
        public static let tntMissionFailedScene = Image(fioriName: "fiori.ill.tnt.mission.failed.scene")
        ///
        public static let tntMissionFailedSpot = Image(fioriName: "fiori.ill.tnt.mission.failed.spot")
        ///
        public static let tntMissionScene = Image(fioriName: "fiori.ill.tnt.mission.scene")
        ///
        public static let tntMissionSpot = Image(fioriName: "fiori.ill.tnt.mission.spot")
        ///
        public static let tntNoApplicationsDialog = Image(fioriName: "fiori.ill.tnt.no.applications.dialog")
        ///
        public static let tntNoApplicationsDot = Image(fioriName: "fiori.ill.tnt.no.applications.dot")
        ///
        public static let tntNoApplicationsScene = Image(fioriName: "fiori.ill.tnt.no.applications.scene")
        ///
        public static let tntNoApplicationsSpot = Image(fioriName: "fiori.ill.tnt.no.applications.spot")
        ///
        public static let tntNoFlowsDialog = Image(fioriName: "fiori.ill.tnt.no.flows.dialog")
        ///
        public static let tntNoFlowsDot = Image(fioriName: "fiori.ill.tnt.no.flows.dot")
        ///
        public static let tntNoFlowsScene = Image(fioriName: "fiori.ill.tnt.no.flows.scene")
        ///
        public static let tntNoFlowsSpot = Image(fioriName: "fiori.ill.tnt.no.flows.spot")
        ///
        public static let tntNoUsersDialog = Image(fioriName: "fiori.ill.tnt.no.users.dialog")
        ///
        public static let tntNoUsersDot = Image(fioriName: "fiori.ill.tnt.no.users.dot")
        ///
        public static let tntNoUsersScene = Image(fioriName: "fiori.ill.tnt.no.users.scene")
        ///
        public static let tntNoUsersSpot = Image(fioriName: "fiori.ill.tnt.no.users.spot")
        ///
        public static let tntRadarDialog = Image(fioriName: "fiori.ill.tnt.radar.dialog")
        ///
        public static let tntRadarDot = Image(fioriName: "fiori.ill.tnt.radar.dot")
        ///
        public static let tntRadarScene = Image(fioriName: "fiori.ill.tnt.radar.scene")
        ///
        public static let tntRadarSpot = Image(fioriName: "fiori.ill.tnt.radar.spot")
        ///
        public static let tntRoadMapDialog = Image(fioriName: "fiori.ill.tnt.road.map.dialog")
        ///
        public static let tntRoadMapDot = Image(fioriName: "fiori.ill.tnt.road.map.dot")
        ///
        public static let tntRoadMapScene = Image(fioriName: "fiori.ill.tnt.road.map.scene")
        ///
        public static let tntRoadMapSpot = Image(fioriName: "fiori.ill.tnt.road.map.spot")
        ///
        public static let tntSecretsDialog = Image(fioriName: "fiori.ill.tnt.secrets.dialog")
        ///
        public static let tntSecretsDot = Image(fioriName: "fiori.ill.tnt.secrets.dot")
        ///
        public static let tntSecretsScene = Image(fioriName: "fiori.ill.tnt.secrets.scene")
        ///
        public static let tntSecretsSpot = Image(fioriName: "fiori.ill.tnt.secrets.spot")
        ///
        public static let tntServicesDialog = Image(fioriName: "fiori.ill.tnt.services.dialog")
        ///
        public static let tntServicesDot = Image(fioriName: "fiori.ill.tnt.services.dot")
        ///
        public static let tntServicesScene = Image(fioriName: "fiori.ill.tnt.services.scene")
        ///
        public static let tntServicesSpot = Image(fioriName: "fiori.ill.tnt.services.spot")
        ///
        public static let tntSessionExpiredDialog = Image(fioriName: "fiori.ill.tnt.session.expired.dialog")
        ///
        public static let tntSessionExpiredDot = Image(fioriName: "fiori.ill.tnt.session.expired.dot")
        ///
        public static let tntSessionExpiredScene = Image(fioriName: "fiori.ill.tnt.session.expired.scene")
        ///
        public static let tntSessionExpiredSpot = Image(fioriName: "fiori.ill.tnt.session.expired.spot")
        ///
        public static let tntSessionExpiringDialog = Image(fioriName: "fiori.ill.tnt.session.expiring.dialog")
        ///
        public static let tntSessionExpiringDot = Image(fioriName: "fiori.ill.tnt.session.expiring.dot")
        ///
        public static let tntSessionExpiringScene = Image(fioriName: "fiori.ill.tnt.session.expiring.scene")
        ///
        public static let tntSessionExpiringSpot = Image(fioriName: "fiori.ill.tnt.session.expiring.spot")
        ///
        public static let tntSettingsDialog = Image(fioriName: "fiori.ill.tnt.settings.dialog")
        ///
        public static let tntSettingsDot = Image(fioriName: "fiori.ill.tnt.settings.dot")
        ///
        public static let tntSettingsScene = Image(fioriName: "fiori.ill.tnt.settings.scene")
        ///
        public static let tntSettingsSpot = Image(fioriName: "fiori.ill.tnt.settings.spot")
        ///
        public static let tntSuccessDialog = Image(fioriName: "fiori.ill.tnt.success.dialog")
        ///
        public static let tntSuccessDot = Image(fioriName: "fiori.ill.tnt.success.dot")
        ///
        public static let tntSuccessScene = Image(fioriName: "fiori.ill.tnt.success.scene")
        ///
        public static let tntSuccessSpot = Image(fioriName: "fiori.ill.tnt.success.spot")
        ///
        public static let tntSuccessfulAuthDialog = Image(fioriName: "fiori.ill.tnt.successful.auth.dialog")
        ///
        public static let tntSuccessfulAuthDot = Image(fioriName: "fiori.ill.tnt.successful.auth.dot")
        ///
        public static let tntSuccessfulAuthScene = Image(fioriName: "fiori.ill.tnt.successful.auth.scene")
        ///
        public static let tntSuccessfulAuthSpot = Image(fioriName: "fiori.ill.tnt.successful.auth.spot")
        ///
        public static let tntSystemsDialog = Image(fioriName: "fiori.ill.tnt.systems.dialog")
        ///
        public static let tntSystemsDot = Image(fioriName: "fiori.ill.tnt.systems.dot")
        ///
        public static let tntSystemsScene = Image(fioriName: "fiori.ill.tnt.systems.scene")
        ///
        public static let tntSystemsSpot = Image(fioriName: "fiori.ill.tnt.systems.spot")
        ///
        public static let tntTeamsDialog = Image(fioriName: "fiori.ill.tnt.teams.dialog")
        ///
        public static let tntTeamsDot = Image(fioriName: "fiori.ill.tnt.teams.dot")
        ///
        public static let tntTeamsScene = Image(fioriName: "fiori.ill.tnt.teams.scene")
        ///
        public static let tntTeamsSpot = Image(fioriName: "fiori.ill.tnt.teams.spot")
        ///
        public static let tntToolsDialog = Image(fioriName: "fiori.ill.tnt.tools.dialog")
        ///
        public static let tntToolsDot = Image(fioriName: "fiori.ill.tnt.tools.dot")
        ///
        public static let tntToolsScene = Image(fioriName: "fiori.ill.tnt.tools.scene")
        ///
        public static let tntToolsSpot = Image(fioriName: "fiori.ill.tnt.tools.spot")
        ///
        public static let tntTutorialsDialog = Image(fioriName: "fiori.ill.tnt.tutorials.dialog")
        ///
        public static let tntTutorialsDot = Image(fioriName: "fiori.ill.tnt.tutorials.dot")
        ///
        public static let tntTutorialsScene = Image(fioriName: "fiori.ill.tnt.tutorials.scene")
        ///
        public static let tntTutorialsSpot = Image(fioriName: "fiori.ill.tnt.tutorials.spot")
        ///
        public static let tntUnableToLoadDialog = Image(fioriName: "fiori.ill.tnt.unable.to.load.dialog")
        ///
        public static let tntUnableToLoadDot = Image(fioriName: "fiori.ill.tnt.unable.to.load.dot")
        ///
        public static let tntUnableToLoadScene = Image(fioriName: "fiori.ill.tnt.unable.to.load.scene")
        ///
        public static let tntUnableToLoadSpot = Image(fioriName: "fiori.ill.tnt.unable.to.load.spot")
        ///
        public static let tntUnlockDialog = Image(fioriName: "fiori.ill.tnt.unlock.dialog")
        ///
        public static let tntUnlockDot = Image(fioriName: "fiori.ill.tnt.unlock.dot")
        ///
        public static let tntUnlockScene = Image(fioriName: "fiori.ill.tnt.unlock.scene")
        ///
        public static let tntUnlockSpot = Image(fioriName: "fiori.ill.tnt.unlock.spot")
        ///
        public static let tntUnsuccessfulAuthDialog = Image(fioriName: "fiori.ill.tnt.unsuccessful.auth.dialog")
        ///
        public static let tntUnsuccessfulAuthDot = Image(fioriName: "fiori.ill.tnt.unsuccessful.auth.dot")
        ///
        public static let tntUnsuccessfulAuthScene = Image(fioriName: "fiori.ill.tnt.unsuccessful.auth.scene")
        ///
        public static let tntUnsuccessfulAuthSpot = Image(fioriName: "fiori.ill.tnt.unsuccessful.auth.spot")
        ///
        public static let tntUser2Dialog = Image(fioriName: "fiori.ill.tnt.user2.dialog")
        ///
        public static let tntUser2Dot = Image(fioriName: "fiori.ill.tnt.user2.dot")
        ///
        public static let tntUser2Scene = Image(fioriName: "fiori.ill.tnt.user2.scene")
        ///
        public static let tntUser2Spot = Image(fioriName: "fiori.ill.tnt.user2.spot")
        ///
        public static let unableToLoadDialog = Image(fioriName: "fiori.ill.unable.to.load.dialog")
        ///
        public static let unableToLoadDot = Image(fioriName: "fiori.ill.unable.to.load.dot")
        ///
        public static let unableToLoadImageDialog = Image(fioriName: "fiori.ill.unable.to.load.image.dialog")
        ///
        public static let unableToLoadImageDot = Image(fioriName: "fiori.ill.unable.to.load.image.dot")
        ///
        public static let unableToLoadImageScene = Image(fioriName: "fiori.ill.unable.to.load.image.scene")
        ///
        public static let unableToLoadImageSpot = Image(fioriName: "fiori.ill.unable.to.load.image.spot")
        ///
        public static let unableToLoadScene = Image(fioriName: "fiori.ill.unable.to.load.scene")
        ///
        public static let unableToLoadSpot = Image(fioriName: "fiori.ill.unable.to.load.spot")
        ///
        public static let unableToUploadDialog = Image(fioriName: "fiori.ill.unable.to.upload.dialog")
        ///
        public static let unableToUploadDot = Image(fioriName: "fiori.ill.unable.to.upload.dot")
        ///
        public static let unableToUploadScene = Image(fioriName: "fiori.ill.unable.to.upload.scene")
        ///
        public static let unableToUploadSpot = Image(fioriName: "fiori.ill.unable.to.upload.spot")
        ///
        public static let uploadCollectionDialog = Image(fioriName: "fiori.ill.upload.collection.dialog")
        ///
        public static let uploadCollectionDot = Image(fioriName: "fiori.ill.upload.collection.dot")
        ///
        public static let uploadCollectionScene = Image(fioriName: "fiori.ill.upload.collection.scene")
        ///
        public static let uploadCollectionSpot = Image(fioriName: "fiori.ill.upload.collection.spot")
        ///
        public static let uploadToCloudDialog = Image(fioriName: "fiori.ill.upload.to.cloud.dialog")
        ///
        public static let uploadToCloudDot = Image(fioriName: "fiori.ill.upload.to.cloud.dot")
        ///
        public static let uploadToCloudScene = Image(fioriName: "fiori.ill.upload.to.cloud.scene")
        ///
        public static let uploadToCloudSpot = Image(fioriName: "fiori.ill.upload.to.cloud.spot")
        
        // V3
        ///
        public static let addColumnDialogV3 = Image(fioriName: "fiori.ill.add.column.dialog.v3")
        ///
        public static let addColumnDotV3 = Image(fioriName: "fiori.ill.add.column.dot.v3")
        ///
        public static let addColumnSceneV3 = Image(fioriName: "fiori.ill.add.column.scene.v3")
        ///
        public static let addColumnSpotV3 = Image(fioriName: "fiori.ill.add.column.spot.v3")
        ///
        public static let addDimensionsDialogV3 = Image(fioriName: "fiori.ill.add.dimensions.dialog.v3")
        ///
        public static let addDimensionsDotV3 = Image(fioriName: "fiori.ill.add.dimensions.dot.v3")
        ///
        public static let addDimensionsSceneV3 = Image(fioriName: "fiori.ill.add.dimensions.scene.v3")
        ///
        public static let addDimensionsSpotV3 = Image(fioriName: "fiori.ill.add.dimensions.spot.v3")
        ///
        public static let addPeopleDialogV3 = Image(fioriName: "fiori.ill.add.people.dialog.v3")
        ///
        public static let addPeopleDotV3 = Image(fioriName: "fiori.ill.add.people.dot.v3")
        ///
        public static let addPeopleSceneV3 = Image(fioriName: "fiori.ill.add.people.scene.v3")
        ///
        public static let addPeopleSpotV3 = Image(fioriName: "fiori.ill.add.people.spot.v3")
        ///
        public static let beforeSearchDialogV3 = Image(fioriName: "fiori.ill.before.search.dialog.v3")
        ///
        public static let beforeSearchDotV3 = Image(fioriName: "fiori.ill.before.search.dot.v3")
        ///
        public static let beforeSearchSceneV3 = Image(fioriName: "fiori.ill.before.search.scene.v3")
        ///
        public static let beforeSearchSpotV3 = Image(fioriName: "fiori.ill.before.search.spot.v3")
        ///
        public static let connectionDialogV3 = Image(fioriName: "fiori.ill.connection.dialog.v3")
        ///
        public static let connectionDotV3 = Image(fioriName: "fiori.ill.connection.dot.v3")
        ///
        public static let connectionSceneV3 = Image(fioriName: "fiori.ill.connection.scene.v3")
        ///
        public static let connectionSpotV3 = Image(fioriName: "fiori.ill.connection.spot.v3")
        ///
        public static let emptyPlanningCalendarDialogV3 = Image(fioriName: "fiori.ill.empty.planning.calendar.dialog.v3")
        ///
        public static let emptyPlanningCalendarDotV3 = Image(fioriName: "fiori.ill.empty.planning.calendar.dot.v3")
        ///
        public static let emptyPlanningCalendarSceneV3 = Image(fioriName: "fiori.ill.empty.planning.calendar.scene.v3")
        ///
        public static let emptyPlanningCalendarSpotV3 = Image(fioriName: "fiori.ill.empty.planning.calendar.spot.v3")
        ///
        public static let errorScreenDialogV3 = Image(fioriName: "fiori.ill.error.screen.dialog.v3")
        ///
        public static let errorScreenDotV3 = Image(fioriName: "fiori.ill.error.screen.dot.v3")
        ///
        public static let errorScreenSceneV3 = Image(fioriName: "fiori.ill.error.screen.scene.v3")
        ///
        public static let errorScreenSpotV3 = Image(fioriName: "fiori.ill.error.screen.spot.v3")
        ///
        public static let filterTableDialogV3 = Image(fioriName: "fiori.ill.filter.table.dialog.v3")
        ///
        public static let filterTableDotV3 = Image(fioriName: "fiori.ill.filter.table.dot.v3")
        ///
        public static let filterTableSceneV3 = Image(fioriName: "fiori.ill.filter.table.scene.v3")
        ///
        public static let filterTableSpotV3 = Image(fioriName: "fiori.ill.filter.table.spot.v3")
        ///
        public static let groupTableDialogV3 = Image(fioriName: "fiori.ill.group.table.dialog.v3")
        ///
        public static let groupTableDotV3 = Image(fioriName: "fiori.ill.group.table.dot.v3")
        ///
        public static let groupTableSceneV3 = Image(fioriName: "fiori.ill.group.table.scene.v3")
        ///
        public static let groupTableSpotV3 = Image(fioriName: "fiori.ill.group.table.spot.v3")
        ///
        public static let newMailDialogV3 = Image(fioriName: "fiori.ill.new.mail.dialog.v3")
        ///
        public static let newMailDotV3 = Image(fioriName: "fiori.ill.new.mail.dot.v3")
        ///
        public static let newMailSceneV3 = Image(fioriName: "fiori.ill.new.mail.scene.v3")
        ///
        public static let newMailSpotV3 = Image(fioriName: "fiori.ill.new.mail.spot.v3")
        ///
        public static let noActivitiesDialogV3 = Image(fioriName: "fiori.ill.no.activities.dialog.v3")
        ///
        public static let noActivitiesDotV3 = Image(fioriName: "fiori.ill.no.activities.dot.v3")
        ///
        public static let noActivitiesSceneV3 = Image(fioriName: "fiori.ill.no.activities.scene.v3")
        ///
        public static let noActivitiesSpotV3 = Image(fioriName: "fiori.ill.no.activities.spot.v3")
        ///
        public static let noColumnsSetDialogV3 = Image(fioriName: "fiori.ill.no.columns.set.dialog.v3")
        ///
        public static let noColumnsSetDotV3 = Image(fioriName: "fiori.ill.no.columns.set.dot.v3")
        ///
        public static let noColumnsSetSceneV3 = Image(fioriName: "fiori.ill.no.columns.set.scene.v3")
        ///
        public static let noColumnsSetSpotV3 = Image(fioriName: "fiori.ill.no.columns.set.spot.v3")
        ///
        public static let noDataDialogV3 = Image(fioriName: "fiori.ill.no.data.dialog.v3")
        ///
        public static let noDataDotV3 = Image(fioriName: "fiori.ill.no.data.dot.v3")
        ///
        public static let noDataSceneV3 = Image(fioriName: "fiori.ill.no.data.scene.v3")
        ///
        public static let noDataSpotV3 = Image(fioriName: "fiori.ill.no.data.spot.v3")
        ///
        public static let noDimensionsSetDialogV3 = Image(fioriName: "fiori.ill.no.dimensions.set.dialog.v3")
        ///
        public static let noDimensionsSetDotV3 = Image(fioriName: "fiori.ill.no.dimensions.set.dot.v3")
        ///
        public static let noDimensionsSetSceneV3 = Image(fioriName: "fiori.ill.no.dimensions.set.scene.v3")
        ///
        public static let noDimensionsSetSpotV3 = Image(fioriName: "fiori.ill.no.dimensions.set.spot.v3")
        ///
        public static let noEntriesDialogV3 = Image(fioriName: "fiori.ill.no.entries.dialog.v3")
        ///
        public static let noEntriesDotV3 = Image(fioriName: "fiori.ill.no.entries.dot.v3")
        ///
        public static let noEntriesSceneV3 = Image(fioriName: "fiori.ill.no.entries.scene.v3")
        ///
        public static let noEntriesSpotV3 = Image(fioriName: "fiori.ill.no.entries.spot.v3")
        ///
        public static let noFilterResultsDialogV3 = Image(fioriName: "fiori.ill.no.filter.results.dialog.v3")
        ///
        public static let noFilterResultsDotV3 = Image(fioriName: "fiori.ill.no.filter.results.dot.v3")
        ///
        public static let noFilterResultsSceneV3 = Image(fioriName: "fiori.ill.no.filter.results.scene.v3")
        ///
        public static let noFilterResultsSpotV3 = Image(fioriName: "fiori.ill.no.filter.results.spot.v3")
        ///
        public static let noMailDialogV3 = Image(fioriName: "fiori.ill.no.mail.dialog.v3")
        ///
        public static let noMailDotV3 = Image(fioriName: "fiori.ill.no.mail.dot.v3")
        ///
        public static let noMailSceneV3 = Image(fioriName: "fiori.ill.no.mail.scene.v3")
        ///
        public static let noMailSpotV3 = Image(fioriName: "fiori.ill.no.mail.spot.v3")
        ///
        public static let noNotificationsDialogV3 = Image(fioriName: "fiori.ill.no.notifications.dialog.v3")
        ///
        public static let noNotificationsDotV3 = Image(fioriName: "fiori.ill.no.notifications.dot.v3")
        ///
        public static let noNotificationsSceneV3 = Image(fioriName: "fiori.ill.no.notifications.scene.v3")
        ///
        public static let noNotificationsSpotV3 = Image(fioriName: "fiori.ill.no.notifications.spot.v3")
        ///
        public static let noSavedItemsDialogV3 = Image(fioriName: "fiori.ill.no.saved.items.dialog.v3")
        ///
        public static let noSavedItemsDotV3 = Image(fioriName: "fiori.ill.no.saved.items.dot.v3")
        ///
        public static let noSavedItemsSceneV3 = Image(fioriName: "fiori.ill.no.saved.items.scene.v3")
        ///
        public static let noSavedItemsSpotV3 = Image(fioriName: "fiori.ill.no.saved.items.spot.v3")
        ///
        public static let noSearchResultsDialogV3 = Image(fioriName: "fiori.ill.no.search.results.dialog.v3")
        ///
        public static let noSearchResultsDotV3 = Image(fioriName: "fiori.ill.no.search.results.dot.v3")
        ///
        public static let noSearchResultsSceneV3 = Image(fioriName: "fiori.ill.no.search.results.scene.v3")
        ///
        public static let noSearchResultsSpotV3 = Image(fioriName: "fiori.ill.no.search.results.spot.v3")
        ///
        public static let noTasksDialogV3 = Image(fioriName: "fiori.ill.no.tasks.dialog.v3")
        ///
        public static let noTasksDotV3 = Image(fioriName: "fiori.ill.no.tasks.dot.v3")
        ///
        public static let noTasksSceneV3 = Image(fioriName: "fiori.ill.no.tasks.scene.v3")
        ///
        public static let noTasksSpotV3 = Image(fioriName: "fiori.ill.no.tasks.spot.v3")
        ///
        public static let resizeColumnDialogV3 = Image(fioriName: "fiori.ill.resize.column.dialog.v3")
        ///
        public static let resizeColumnDotV3 = Image(fioriName: "fiori.ill.resize.column.dot.v3")
        ///
        public static let resizeColumnSceneV3 = Image(fioriName: "fiori.ill.resize.column.scene.v3")
        ///
        public static let resizeColumnSpotV3 = Image(fioriName: "fiori.ill.resize.column.spot.v3")
        ///
        public static let signOutDialogV3 = Image(fioriName: "fiori.ill.sign.out.dialog.v3")
        ///
        public static let signOutDotV3 = Image(fioriName: "fiori.ill.sign.out.dot.v3")
        ///
        public static let signOutSceneV3 = Image(fioriName: "fiori.ill.sign.out.scene.v3")
        ///
        public static let signOutSpotV3 = Image(fioriName: "fiori.ill.sign.out.spot.v3")
        ///
        public static let sortColumnDialogV3 = Image(fioriName: "fiori.ill.sort.column.dialog.v3")
        ///
        public static let sortColumnDotV3 = Image(fioriName: "fiori.ill.sort.column.dot.v3")
        ///
        public static let sortColumnSceneV3 = Image(fioriName: "fiori.ill.sort.column.scene.v3")
        ///
        public static let sortColumnSpotV3 = Image(fioriName: "fiori.ill.sort.column.spot.v3")
        ///
        public static let successCheckMarkDialogV3 = Image(fioriName: "fiori.ill.success.check.mark.dialog.v3")
        ///
        public static let successCheckMarkDotV3 = Image(fioriName: "fiori.ill.success.check.mark.dot.v3")
        ///
        public static let successCheckMarkSceneV3 = Image(fioriName: "fiori.ill.success.check.mark.scene.v3")
        ///
        public static let successCheckMarkSpotV3 = Image(fioriName: "fiori.ill.success.check.mark.spot.v3")
        ///
        public static let successHighFiveDialogV3 = Image(fioriName: "fiori.ill.success.high.five.dialog.v3")
        ///
        public static let successHighFiveDotV3 = Image(fioriName: "fiori.ill.success.high.five.dot.v3")
        ///
        public static let successHighFiveSceneV3 = Image(fioriName: "fiori.ill.success.high.five.scene.v3")
        ///
        public static let successHighFiveSpotV3 = Image(fioriName: "fiori.ill.success.high.five.spot.v3")
        ///
        public static let successScreenDialogV3 = Image(fioriName: "fiori.ill.success.screen.dialog.v3")
        ///
        public static let successScreenDotV3 = Image(fioriName: "fiori.ill.success.screen.dot.v3")
        ///
        public static let successScreenSceneV3 = Image(fioriName: "fiori.ill.success.screen.scene.v3")
        ///
        public static let successScreenSpotV3 = Image(fioriName: "fiori.ill.success.screen.spot.v3")
        ///
        public static let unableToLoadImageDialogV3 = Image(fioriName: "fiori.ill.unable.to.load.image.dialog.v3")
        ///
        public static let unableToLoadImageDotV3 = Image(fioriName: "fiori.ill.unable.to.load.image.dot.v3")
        ///
        public static let unableToLoadImageSceneV3 = Image(fioriName: "fiori.ill.unable.to.load.image.scene.v3")
        ///
        public static let unableToLoadImageSpotV3 = Image(fioriName: "fiori.ill.unable.to.load.image.spot.v3")
        ///
        public static let unableToLoadScreenDialogV3 = Image(fioriName: "fiori.ill.unable.to.load.screen.dialog.v3")
        ///
        public static let unableToLoadScreenDotV3 = Image(fioriName: "fiori.ill.unable.to.load.screen.dot.v3")
        ///
        public static let unableToLoadScreenSceneV3 = Image(fioriName: "fiori.ill.unable.to.load.screen.scene.v3")
        ///
        public static let unableToLoadScreenSpotV3 = Image(fioriName: "fiori.ill.unable.to.load.screen.spot.v3")
        ///
        public static let uploadCollectionDialogV3 = Image(fioriName: "fiori.ill.upload.collection.dialog.v3")
        ///
        public static let uploadCollectionDotV3 = Image(fioriName: "fiori.ill.upload.collection.dot.v3")
        ///
        public static let uploadCollectionSceneV3 = Image(fioriName: "fiori.ill.upload.collection.scene.v3")
        ///
        public static let uploadCollectionSpotV3 = Image(fioriName: "fiori.ill.upload.collection.spot.v3")
        ///
        public static let uploadToCloudDialogV3 = Image(fioriName: "fiori.ill.upload.to.cloud.dialog.v3")
        ///
        public static let uploadToCloudDotV3 = Image(fioriName: "fiori.ill.upload.to.cloud.dot.v3")
        ///
        public static let uploadToCloudSceneV3 = Image(fioriName: "fiori.ill.upload.to.cloud.scene.v3")
        ///
        public static let uploadToCloudSpotV3 = Image(fioriName: "fiori.ill.upload.to.cloud.spot.v3")
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
        guard let name else {
            return nil
        }
        
        return UIImage(named: name, in: Bundle.accessor, with: nil)
    }
}
