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
        
        public static let hierarchyOff = Image(fioriName: "fiori.hierarchy.off")
        
        public static let hierarchyOn = Image(fioriName: "fiori.hierarchy.on")
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
        public static let achievementExtraSmall = Image(fioriName: "fiori.ill.achievement.extrasmall")
        ///
        public static let achievementLarge = Image(fioriName: "fiori.ill.achievement.large")
        ///
        public static let achievementMedium = Image(fioriName: "fiori.ill.achievement.medium")
        ///
        public static let achievementSmall = Image(fioriName: "fiori.ill.achievement.small")
        ///
        public static let addDimensionsExtraSmall = Image(fioriName: "fiori.ill.add.dimensions.extrasmall")
        ///
        public static let addDimensionsLarge = Image(fioriName: "fiori.ill.add.dimensions.large")
        ///
        public static let addDimensionsMedium = Image(fioriName: "fiori.ill.add.dimensions.medium")
        ///
        public static let addDimensionsSmall = Image(fioriName: "fiori.ill.add.dimensions.small")
        ///
        public static let addPeopleToCalendarExtraSmall = Image(fioriName: "fiori.ill.add.people.to.calendar.extrasmall")
        ///
        public static let addPeopleToCalendarLarge = Image(fioriName: "fiori.ill.add.people.to.calendar.large")
        ///
        public static let addPeopleToCalendarMedium = Image(fioriName: "fiori.ill.add.people.to.calendar.medium")
        ///
        public static let addPeopleToCalendarSmall = Image(fioriName: "fiori.ill.add.people.to.calendar.small")
        ///
        public static let addingColumnsExtraSmall = Image(fioriName: "fiori.ill.adding.columns.extrasmall")
        ///
        public static let addingColumnsLarge = Image(fioriName: "fiori.ill.adding.columns.large")
        ///
        public static let addingColumnsMedium = Image(fioriName: "fiori.ill.adding.columns.medium")
        ///
        public static let addingColumnsSmall = Image(fioriName: "fiori.ill.adding.columns.small")
        ///
        public static let beforeSearchExtraSmall = Image(fioriName: "fiori.ill.before.search.extrasmall")
        ///
        public static let beforeSearchLarge = Image(fioriName: "fiori.ill.before.search.large")
        ///
        public static let beforeSearchMedium = Image(fioriName: "fiori.ill.before.search.medium")
        ///
        public static let beforeSearchSmall = Image(fioriName: "fiori.ill.before.search.small")
        ///
        public static let dragFilesToUploadExtraSmall = Image(fioriName: "fiori.ill.drag.files.to.upload.extrasmall")
        ///
        public static let dragFilesToUploadLarge = Image(fioriName: "fiori.ill.drag.files.to.upload.large")
        ///
        public static let dragFilesToUploadMedium = Image(fioriName: "fiori.ill.drag.files.to.upload.medium")
        ///
        public static let dragFilesToUploadSmall = Image(fioriName: "fiori.ill.drag.files.to.upload.small")
        ///
        public static let emptyPlanningCalendarExtraSmall = Image(fioriName: "fiori.ill.empty.planning.calendar.extrasmall")
        ///
        public static let emptyPlanningCalendarLarge = Image(fioriName: "fiori.ill.empty.planning.calendar.large")
        ///
        public static let emptyPlanningCalendarMedium = Image(fioriName: "fiori.ill.empty.planning.calendar.medium")
        ///
        public static let emptyPlanningCalendarSmall = Image(fioriName: "fiori.ill.empty.planning.calendar.small")
        ///
        public static let filteringColumnsExtraSmall = Image(fioriName: "fiori.ill.filtering.columns.extrasmall")
        ///
        public static let filteringColumnsLarge = Image(fioriName: "fiori.ill.filtering.columns.large")
        ///
        public static let filteringColumnsMedium = Image(fioriName: "fiori.ill.filtering.columns.medium")
        ///
        public static let filteringColumnsSmall = Image(fioriName: "fiori.ill.filtering.columns.small")
        ///
        public static let groupingColumnsExtraSmall = Image(fioriName: "fiori.ill.grouping.columns.extrasmall")
        ///
        public static let groupingColumnsLarge = Image(fioriName: "fiori.ill.grouping.columns.large")
        ///
        public static let groupingColumnsMedium = Image(fioriName: "fiori.ill.grouping.columns.medium")
        ///
        public static let groupingColumnsSmall = Image(fioriName: "fiori.ill.grouping.columns.small")
        ///
        public static let keyTaskExtraSmall = Image(fioriName: "fiori.ill.key.task.extrasmall")
        ///
        public static let keyTaskLarge = Image(fioriName: "fiori.ill.key.task.large")
        ///
        public static let keyTaskMedium = Image(fioriName: "fiori.ill.key.task.medium")
        ///
        public static let keyTaskSmall = Image(fioriName: "fiori.ill.key.task.small")
        ///
        public static let newMailExtraSmall = Image(fioriName: "fiori.ill.new.mail.extrasmall")
        ///
        public static let newMailLarge = Image(fioriName: "fiori.ill.new.mail.large")
        ///
        public static let newMailMedium = Image(fioriName: "fiori.ill.new.mail.medium")
        ///
        public static let newMailSmall = Image(fioriName: "fiori.ill.new.mail.small")
        ///
        public static let noActivitiesExtraSmall = Image(fioriName: "fiori.ill.no.activities.extrasmall")
        ///
        public static let noActivitiesLarge = Image(fioriName: "fiori.ill.no.activities.large")
        ///
        public static let noActivitiesMedium = Image(fioriName: "fiori.ill.no.activities.medium")
        ///
        public static let noActivitiesSmall = Image(fioriName: "fiori.ill.no.activities.small")
        ///
        public static let noChartDataExtraSmall = Image(fioriName: "fiori.ill.no.chart.data.extrasmall")
        ///
        public static let noChartDataLarge = Image(fioriName: "fiori.ill.no.chart.data.large")
        ///
        public static let noChartDataMedium = Image(fioriName: "fiori.ill.no.chart.data.medium")
        ///
        public static let noChartDataSmall = Image(fioriName: "fiori.ill.no.chart.data.small")
        ///
        public static let noColumnsSetExtraSmall = Image(fioriName: "fiori.ill.no.columns.set.extrasmall")
        ///
        public static let noColumnsSetLarge = Image(fioriName: "fiori.ill.no.columns.set.large")
        ///
        public static let noColumnsSetMedium = Image(fioriName: "fiori.ill.no.columns.set.medium")
        ///
        public static let noColumnsSetSmall = Image(fioriName: "fiori.ill.no.columns.set.small")
        ///
        public static let noDataExtraSmall = Image(fioriName: "fiori.ill.no.data.extrasmall")
        ///
        public static let noDataLarge = Image(fioriName: "fiori.ill.no.data.large")
        ///
        public static let noDataMedium = Image(fioriName: "fiori.ill.no.data.medium")
        ///
        public static let noDataSmall = Image(fioriName: "fiori.ill.no.data.small")
        ///
        public static let noEntriesExtraSmall = Image(fioriName: "fiori.ill.no.entries.extrasmall")
        ///
        public static let noEntriesLarge = Image(fioriName: "fiori.ill.no.entries.large")
        ///
        public static let noEntriesMedium = Image(fioriName: "fiori.ill.no.entries.medium")
        ///
        public static let noEntriesSmall = Image(fioriName: "fiori.ill.no.entries.small")
        ///
        public static let noFilterResultsExtraSmall = Image(fioriName: "fiori.ill.no.filter.results.extrasmall")
        ///
        public static let noFilterResultsLarge = Image(fioriName: "fiori.ill.no.filter.results.large")
        ///
        public static let noFilterResultsMedium = Image(fioriName: "fiori.ill.no.filter.results.medium")
        ///
        public static let noFilterResultsSmall = Image(fioriName: "fiori.ill.no.filter.results.small")
        ///
        public static let noMailExtraSmall = Image(fioriName: "fiori.ill.no.mail.extrasmall")
        ///
        public static let noMailLarge = Image(fioriName: "fiori.ill.no.mail.large")
        ///
        public static let noMailMedium = Image(fioriName: "fiori.ill.no.mail.medium")
        ///
        public static let noMailSmall = Image(fioriName: "fiori.ill.no.mail.small")
        ///
        public static let noNotificationsExtraSmall = Image(fioriName: "fiori.ill.no.notifications.extrasmall")
        ///
        public static let noNotificationsLarge = Image(fioriName: "fiori.ill.no.notifications.large")
        ///
        public static let noNotificationsMedium = Image(fioriName: "fiori.ill.no.notifications.medium")
        ///
        public static let noNotificationsSmall = Image(fioriName: "fiori.ill.no.notifications.small")
        ///
        public static let noSavedItemsExtraSmall = Image(fioriName: "fiori.ill.no.saved.items.extrasmall")
        ///
        public static let noSavedItemsLarge = Image(fioriName: "fiori.ill.no.saved.items.large")
        ///
        public static let noSavedItemsMedium = Image(fioriName: "fiori.ill.no.saved.items.medium")
        ///
        public static let noSavedItemsSmall = Image(fioriName: "fiori.ill.no.saved.items.small")
        ///
        public static let noSearchResultsExtraSmall = Image(fioriName: "fiori.ill.no.search.results.extrasmall")
        ///
        public static let noSearchResultsLarge = Image(fioriName: "fiori.ill.no.search.results.large")
        ///
        public static let noSearchResultsMedium = Image(fioriName: "fiori.ill.no.search.results.medium")
        ///
        public static let noSearchResultsSmall = Image(fioriName: "fiori.ill.no.search.results.small")
        ///
        public static let noTasksExtraSmall = Image(fioriName: "fiori.ill.no.tasks.extrasmall")
        ///
        public static let noTasksLarge = Image(fioriName: "fiori.ill.no.tasks.large")
        ///
        public static let noTasksMedium = Image(fioriName: "fiori.ill.no.tasks.medium")
        ///
        public static let noTasksSmall = Image(fioriName: "fiori.ill.no.tasks.small")
        ///
        public static let pageNotFoundExtraSmall = Image(fioriName: "fiori.ill.page.not.found.extrasmall")
        ///
        public static let pageNotFoundLarge = Image(fioriName: "fiori.ill.page.not.found.large")
        ///
        public static let pageNotFoundMedium = Image(fioriName: "fiori.ill.page.not.found.medium")
        ///
        public static let pageNotFoundSmall = Image(fioriName: "fiori.ill.page.not.found.small")
        ///
        public static let receiveAppreciationExtraSmall = Image(fioriName: "fiori.ill.receive.appreciation.extrasmall")
        ///
        public static let receiveAppreciationLarge = Image(fioriName: "fiori.ill.receive.appreciation.large")
        ///
        public static let receiveAppreciationMedium = Image(fioriName: "fiori.ill.receive.appreciation.medium")
        ///
        public static let receiveAppreciationSmall = Image(fioriName: "fiori.ill.receive.appreciation.small")
        ///
        public static let resizingColumnsExtraSmall = Image(fioriName: "fiori.ill.resizing.columns.extrasmall")
        ///
        public static let resizingColumnsLarge = Image(fioriName: "fiori.ill.resizing.columns.large")
        ///
        public static let resizingColumnsMedium = Image(fioriName: "fiori.ill.resizing.columns.medium")
        ///
        public static let resizingColumnsSmall = Image(fioriName: "fiori.ill.resizing.columns.small")
        ///
        public static let signOutExtraSmall = Image(fioriName: "fiori.ill.sign.out.extrasmall")
        ///
        public static let signOutLarge = Image(fioriName: "fiori.ill.sign.out.large")
        ///
        public static let signOutMedium = Image(fioriName: "fiori.ill.sign.out.medium")
        ///
        public static let signOutSmall = Image(fioriName: "fiori.ill.sign.out.small")
        ///
        public static let sortingColumnsExtraSmall = Image(fioriName: "fiori.ill.sorting.columns.extrasmall")
        ///
        public static let sortingColumnsLarge = Image(fioriName: "fiori.ill.sorting.columns.large")
        ///
        public static let sortingColumnsMedium = Image(fioriName: "fiori.ill.sorting.columns.medium")
        ///
        public static let sortingColumnsSmall = Image(fioriName: "fiori.ill.sorting.columns.small")
        ///
        public static let surveyExtraSmall = Image(fioriName: "fiori.ill.survey.extrasmall")
        ///
        public static let surveyLarge = Image(fioriName: "fiori.ill.survey.large")
        ///
        public static let surveyMedium = Image(fioriName: "fiori.ill.survey.medium")
        ///
        public static let surveySmall = Image(fioriName: "fiori.ill.survey.small")
        ///
        public static let unableToLoadExtraSmall = Image(fioriName: "fiori.ill.unable.to.load.extrasmall")
        ///
        public static let unableToLoadImageExtraSmall = Image(fioriName: "fiori.ill.unable.to.load.image.extrasmall")
        ///
        public static let unableToLoadImageLarge = Image(fioriName: "fiori.ill.unable.to.load.image.large")
        ///
        public static let unableToLoadImageMedium = Image(fioriName: "fiori.ill.unable.to.load.image.medium")
        ///
        public static let unableToLoadImageSmall = Image(fioriName: "fiori.ill.unable.to.load.image.small")
        ///
        public static let unableToLoadLarge = Image(fioriName: "fiori.ill.unable.to.load.large")
        ///
        public static let unableToLoadMedium = Image(fioriName: "fiori.ill.unable.to.load.medium")
        ///
        public static let unableToLoadSmall = Image(fioriName: "fiori.ill.unable.to.load.small")
        ///
        public static let unableToUploadExtraSmall = Image(fioriName: "fiori.ill.unable.to.upload.extrasmall")
        ///
        public static let unableToUploadLarge = Image(fioriName: "fiori.ill.unable.to.upload.large")
        ///
        public static let unableToUploadMedium = Image(fioriName: "fiori.ill.unable.to.upload.medium")
        ///
        public static let unableToUploadSmall = Image(fioriName: "fiori.ill.unable.to.upload.small")
        ///
        public static let uploadToCloudExtraSmall = Image(fioriName: "fiori.ill.upload.to.cloud.extrasmall")
        ///
        public static let uploadToCloudLarge = Image(fioriName: "fiori.ill.upload.to.cloud.large")
        ///
        public static let uploadToCloudMedium = Image(fioriName: "fiori.ill.upload.to.cloud.medium")
        ///
        public static let uploadToCloudSmall = Image(fioriName: "fiori.ill.upload.to.cloud.small")
        ///
        public static let userHasSignedUpExtraSmall = Image(fioriName: "fiori.ill.user.has.signed.up.extrasmall")
        ///
        public static let userHasSignedUpLarge = Image(fioriName: "fiori.ill.user.has.signed.up.large")
        ///
        public static let userHasSignedUpMedium = Image(fioriName: "fiori.ill.user.has.signed.up.medium")
        ///
        public static let userHasSignedUpSmall = Image(fioriName: "fiori.ill.user.has.signed.up.small")

        // Removed illustrations
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addColumnDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addColumnDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addColumnScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addColumnSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addDimensionsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addDimensionsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addDimensionsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addDimensionsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addPeopleDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addPeopleDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addPeopleScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addPeopleSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let balloonSkyDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let balloonSkyDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let balloonSkyScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let balloonSkySpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearchDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearchDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearchScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearchSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearch2Dialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearch2Dot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearch2Scene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearch2Spot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let connectionDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let connectionDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let connectionScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let connectionSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyCalendarDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyCalendarDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyCalendarScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyCalendarSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyListDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyListDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyListScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyListSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyPlanningCalendarDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyPlanningCalendarDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyPlanningCalendarScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyPlanningCalendarSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let errorScreenDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let errorScreenDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let errorScreenScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let errorScreenSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let filterTableDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let filterTableDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let filterTableScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let filterTableSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let groupTableDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let groupTableDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let groupTableScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let groupTableSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let newMailDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let newMailDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let newMailScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let newMailSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noActivitiesDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noActivitiesDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noActivitiesScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noActivitiesSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noColumnsSetDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noColumnsSetDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noColumnsSetScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noColumnsSetSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDataDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDataDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDataScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDataSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDimensionsSetDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDimensionsSetDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDimensionsSetScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDimensionsSetSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noEntriesDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noEntriesDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noEntriesScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noEntriesSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noFilterResultsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noFilterResultsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noFilterResultsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noFilterResultsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailV1Dialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailV1Dot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailV1Scene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailV1Spot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noNotificationsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noNotificationsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noNotificationsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noNotificationsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsV1Dialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsV1Dot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsV1Scene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsV1Spot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSearchResultsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSearchResultsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSearchResultsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSearchResultsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksV1Dialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksV1Dot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksV1Scene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksV1Spot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let pageNotFoundDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let pageNotFoundDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let pageNotFoundScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let pageNotFoundSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let reloadScreenDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let reloadScreenDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let reloadScreenScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let reloadScreenSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let resizeColumnDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let resizeColumnDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let resizeColumnScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let resizeColumnSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let searchEarthDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let searchEarthDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let searchEarthScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let searchEarthSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let searchFolderDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let searchFolderDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let searchFolderScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let searchFolderSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let signOutDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let signOutDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let signOutScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let signOutSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleBalloonDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleBalloonDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleBalloonScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleBalloonSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleBellDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleBellDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleBellScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleBellSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleCalendarDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleCalendarDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleCalendarScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleCalendarSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleCheckMarkDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleCheckMarkDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleCheckMarkScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleCheckMarkSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleConnectionDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleConnectionDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleConnectionScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleConnectionSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleEmptyDocDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleEmptyDocDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleEmptyDocScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleEmptyDocSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleEmptyListDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleEmptyListDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleEmptyListScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleEmptyListSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleErrorDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleErrorDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleErrorScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleErrorSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleMagnifierDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleMagnifierDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleMagnifierScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleMagnifierSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleMailDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleMailDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleMailScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleMailSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleNoSavedItemsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleNoSavedItemsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleNoSavedItemsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleNoSavedItemsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleNotFoundMagnifierDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleNotFoundMagnifierDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleNotFoundMagnifierScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleNotFoundMagnifierSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleReloadDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleReloadDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleReloadScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleReloadSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleTaskDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleTaskDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleTaskScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let simpleTaskSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sleepingBellDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sleepingBellDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sleepingBellScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sleepingBellSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sortColumnDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sortColumnDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sortColumnScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sortColumnSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successBalloonScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successBalloonDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successBalloonDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successBalloonSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successCheckMarkDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successCheckMarkDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successCheckMarkScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successCheckMarkSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successHighFiveDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successHighFiveDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successHighFiveScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successHighFiveSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successScreenDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successScreenDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successScreenScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successScreenSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let surveyDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let surveyDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let surveyScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let surveySpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tentDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tentDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tentScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tentSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntAvatarDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntAvatarDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntAvatarScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntAvatarSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCalculatorDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCalculatorDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCalculatorScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCalculatorSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartDoughnutDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartDoughnutDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartDoughnutScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartDoughnutSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartAreaDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartAreaDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartAreaScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartAreaSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartArea2Dialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartArea2Dot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartArea2Scene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartArea2Spot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBarDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBarDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBarScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBarSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBpmnFlowDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBpmnFlowDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBpmnFlowScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBpmnFlowSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBulletDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBulletDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBulletScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartBulletSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartFlowDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartFlowDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartFlowScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartFlowSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartGanttDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartGanttDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartGanttScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartGanttSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartOrgDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartOrgDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartOrgScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartOrgSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartPieDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartPieDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartPieScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntChartPieSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCodePlaceholderDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCodePlaceholderDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCodePlaceholderScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCodePlaceholderSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCompanyDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCompanyDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCompanyScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCompanySpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCompassDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCompassDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCompassScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntCompassSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntComponentsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntComponentsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntComponentsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntComponentsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntDialogDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntDialogDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntDialogScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntDialogSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntExternalLinkDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntExternalLinkDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntExternalLinkScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntExternalLinkSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntFaceIdDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntFaceIdDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntFaceIdScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntFaceIdSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntFingerprintDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntFingerprintDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntFingerprintScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntFingerprintSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntHandshakeDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntHandshakeDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntHandshakeScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntHandshakeSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntHelpDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntHelpDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntHelpScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntHelpSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntLockDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntLockDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntLockScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntLockSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntMissionDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntMissionDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntMissionFailedDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntMissionFailedDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntMissionFailedScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntMissionFailedSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntMissionScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntMissionSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoApplicationsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoApplicationsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoApplicationsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoApplicationsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoFlowsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoFlowsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoFlowsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoFlowsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoUsersDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoUsersDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoUsersScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntNoUsersSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntRadarDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntRadarDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntRadarScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntRadarSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntRoadMapDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntRoadMapDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntRoadMapScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntRoadMapSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSecretsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSecretsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSecretsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSecretsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntServicesDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntServicesDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntServicesScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntServicesSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSessionExpiredDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSessionExpiredDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSessionExpiredScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSessionExpiredSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSessionExpiringDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSessionExpiringDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSessionExpiringScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSessionExpiringSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSettingsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSettingsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSettingsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSettingsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSuccessDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSuccessDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSuccessScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSuccessSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSuccessfulAuthDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSuccessfulAuthDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSuccessfulAuthScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSuccessfulAuthSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSystemsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSystemsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSystemsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntSystemsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntTeamsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntTeamsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntTeamsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntTeamsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntToolsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntToolsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntToolsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntToolsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntTutorialsDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntTutorialsDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntTutorialsScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntTutorialsSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnableToLoadDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnableToLoadDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnableToLoadScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnableToLoadSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnlockDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnlockDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnlockScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnlockSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnsuccessfulAuthDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnsuccessfulAuthDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnsuccessfulAuthScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUnsuccessfulAuthSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUser2Dialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUser2Dot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUser2Scene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let tntUser2Spot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadImageDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadImageDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadImageScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadImageSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToUploadDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToUploadDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToUploadScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToUploadSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadCollectionDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadCollectionDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadCollectionScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadCollectionSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadToCloudDialog = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadToCloudDot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadToCloudScene = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadToCloudSpot = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addColumnDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addColumnDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addColumnSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addColumnSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addDimensionsDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addDimensionsDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addDimensionsSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addDimensionsSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addPeopleDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addPeopleDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addPeopleSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let addPeopleSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearchDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearchDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearchSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let beforeSearchSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let connectionDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let connectionDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let connectionSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let connectionSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyPlanningCalendarDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyPlanningCalendarDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyPlanningCalendarSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let emptyPlanningCalendarSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let errorScreenDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let errorScreenDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let errorScreenSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let errorScreenSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let filterTableDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let filterTableDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let filterTableSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let filterTableSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let groupTableDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let groupTableDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let groupTableSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let groupTableSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let newMailDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let newMailDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let newMailSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let newMailSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noActivitiesDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noActivitiesDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noActivitiesSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noActivitiesSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noColumnsSetDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noColumnsSetDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noColumnsSetSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noColumnsSetSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDataDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDataDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDataSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDataSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDimensionsSetDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDimensionsSetDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDimensionsSetSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noDimensionsSetSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noEntriesDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noEntriesDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noEntriesSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noEntriesSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noFilterResultsDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noFilterResultsDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noFilterResultsSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noFilterResultsSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noMailSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noNotificationsDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noNotificationsDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noNotificationsSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noNotificationsSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSavedItemsSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSearchResultsDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSearchResultsDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSearchResultsSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noSearchResultsSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let noTasksSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let resizeColumnDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let resizeColumnDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let resizeColumnSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let resizeColumnSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let signOutDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let signOutDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let signOutSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let signOutSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sortColumnDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sortColumnDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sortColumnSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let sortColumnSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successCheckMarkDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successCheckMarkDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successCheckMarkSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successCheckMarkSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successHighFiveDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successHighFiveDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successHighFiveSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successHighFiveSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successScreenDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successScreenDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successScreenSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let successScreenSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadImageDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadImageDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadImageSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadImageSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadScreenDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadScreenDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadScreenSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let unableToLoadScreenSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadCollectionDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadCollectionDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadCollectionSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadCollectionSpotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadToCloudDialogV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadToCloudDotV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadToCloudSceneV3 = EmptyView()
        ///
        @available(swift, obsoleted: 5.0, message: "Illustration was removed")
        public static let uploadToCloudSpotV3 = EmptyView()
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
