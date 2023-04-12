
import SwiftUI

public enum FioriIcon {
    /// Images representing actions
    public enum actions {
        ///
        public static let accept: Image = .init("fiori.accept", bundle: Bundle.module)
        ///
        public static let actionSettingsFill: Image = .init("fiori.action.settings.fill", bundle: Bundle.module)
        ///
        public static let actionSettings: Image = .init("fiori.action.settings", bundle: Bundle.module)
        ///
        public static let action: Image = .init("fiori.action", bundle: Bundle.module)
        ///
        public static let activate: Image = .init("fiori.activate", bundle: Bundle.module)
        ///
        public static let activities2: Image = .init("fiori.activities.2", bundle: Bundle.module)
        ///
        public static let addActivity: Image = .init("fiori.add.activity", bundle: Bundle.module)
        ///
        public static let addCoursebook: Image = .init("fiori.add.coursebook", bundle: Bundle.module)
        ///
        public static let addFavorite: Image = .init("fiori.add.favorite", bundle: Bundle.module)
        ///
        public static let addFilter: Image = .init("fiori.add.filter", bundle: Bundle.module)
        ///
        public static let addFolder: Image = .init("fiori.add.folder", bundle: Bundle.module)
        ///
        public static let addPhoto: Image = .init("fiori.add.photo", bundle: Bundle.module)
        ///
        public static let add: Image = .init("fiori.add", bundle: Bundle.module)
        ///
        public static let alphabeticalOrder: Image = .init("fiori.alphabetical.order", bundle: Bundle.module)
        ///
        public static let backToTop: Image = .init("fiori.back.to.top", bundle: Bundle.module)
        ///
        public static let begin: Image = .init("fiori.begin", bundle: Bundle.module)
        ///
        public static let blur: Image = .init("fiori.blur", bundle: Bundle.module)
        ///
        public static let bookmarkFill: Image = .init("fiori.bookmark.fill", bundle: Bundle.module)
        ///
        public static let bookmark: Image = .init("fiori.bookmark", bundle: Bundle.module)
        ///
        public static let browseFolder: Image = .init("fiori.browse.folder", bundle: Bundle.module)
        ///
        public static let call: Image = .init("fiori.call", bundle: Bundle.module)
        ///
        public static let cancelMaintenance: Image = .init("fiori.cancel.maintenance", bundle: Bundle.module)
        ///
        public static let cancelShare: Image = .init("fiori.cancel.share", bundle: Bundle.module)
        ///
        public static let cause: Image = .init("fiori.cause", bundle: Bundle.module)
        ///
        public static let clearFilter: Image = .init("fiori.clear.filter", bundle: Bundle.module)
        ///
        public static let comment: Image = .init("fiori.comment", bundle: Bundle.module)
        ///
        public static let complete: Image = .init("fiori.complete", bundle: Bundle.module)
        ///
        public static let copy: Image = .init("fiori.copy", bundle: Bundle.module)
        ///
        public static let createForm: Image = .init("fiori.create.form", bundle: Bundle.module)
        ///
        public static let create: Image = .init("fiori.create", bundle: Bundle.module)
        ///
        public static let customize: Image = .init("fiori.customize", bundle: Bundle.module)
        ///
        public static let decline: Image = .init("fiori.decline", bundle: Bundle.module)
        ///
        public static let deleteFill: Image = .init("fiori.delete.fill", bundle: Bundle.module)
        ///
        public static let delete: Image = .init("fiori.delete", bundle: Bundle.module)
        ///
        public static let detailView: Image = .init("fiori.detail.view", bundle: Bundle.module)
        ///
        public static let down: Image = .init("fiori.down", bundle: Bundle.module)
        ///
        public static let download: Image = .init("fiori.download", bundle: Bundle.module)
        ///
        public static let duplicate: Image = .init("fiori.duplicate", bundle: Bundle.module)
        ///
        public static let editOutside: Image = .init("fiori.edit.outside", bundle: Bundle.module)
        ///
        public static let edit: Image = .init("fiori.edit", bundle: Bundle.module)
        ///
        public static let emailRead: Image = .init("fiori.email.read", bundle: Bundle.module)
        ///
        public static let email: Image = .init("fiori.email", bundle: Bundle.module)
        ///
        public static let favorite: Image = .init("fiori.favorite", bundle: Bundle.module)
        ///
        public static let feed: Image = .init("fiori.feed", bundle: Bundle.module)
        ///
        public static let filterFill: Image = .init("fiori.filter.fill", bundle: Bundle.module)
        ///
        public static let filter: Image = .init("fiori.filter", bundle: Bundle.module)
        ///
        public static let flag: Image = .init("fiori.flag", bundle: Bundle.module)
        ///
        public static let generalLeaveRequest: Image = .init("fiori.general.leave.request", bundle: Bundle.module)
        ///
        public static let generateShortcut: Image = .init("fiori.generate.shortcut", bundle: Bundle.module)
        ///
        public static let hide: Image = .init("fiori.hide", bundle: Bundle.module)
        ///
        public static let hint: Image = .init("fiori.hint", bundle: Bundle.module)
        ///
        public static let homeFill: Image = .init("fiori.home.fill", bundle: Bundle.module)
        ///
        public static let home: Image = .init("fiori.home", bundle: Bundle.module)
        ///
        public static let inboxFill: Image = .init("fiori.inbox.fill", bundle: Bundle.module)
        ///
        public static let inbox: Image = .init("fiori.inbox", bundle: Bundle.module)
        ///
        public static let inspection: Image = .init("fiori.inspection", bundle: Bundle.module)
        ///
        public static let journeyArrive: Image = .init("fiori.journey.arrive", bundle: Bundle.module)
        ///
        public static let less: Image = .init("fiori.less", bundle: Bundle.module)
        ///
        public static let locked: Image = .init("fiori.locked", bundle: Bundle.module)
        ///
        public static let menuFill: Image = .init("fiori.menu.fill", bundle: Bundle.module)
        ///
        public static let menu: Image = .init("fiori.menu", bundle: Bundle.module)
        ///
        public static let microphone: Image = .init("fiori.microphone", bundle: Bundle.module)
        ///
        public static let navigationDownArrow: Image = .init("fiori.navigation.down.arrow", bundle: Bundle.module)
        ///
        public static let navigationUpArrow: Image = .init("fiori.navigation.up.arrow", bundle: Bundle.module)
        ///
        public static let notification2Fill: Image = .init("fiori.notification.2.fill", bundle: Bundle.module)
        ///
        public static let notification2: Image = .init("fiori.notification.2", bundle: Bundle.module)
        ///
        public static let overflow: Image = .init("fiori.overflow", bundle: Bundle.module)
        ///
        public static let paging: Image = .init("fiori.paging", bundle: Bundle.module)
        ///
        public static let paperPlane: Image = .init("fiori.paper.plane", bundle: Bundle.module)
        ///
        public static let pushpinOn: Image = .init("fiori.pushpin.on", bundle: Bundle.module)
        ///
        public static let receipt: Image = .init("fiori.receipt", bundle: Bundle.module)
        ///
        public static let redo: Image = .init("fiori.redo", bundle: Bundle.module)
        ///
        public static let response: Image = .init("fiori.response", bundle: Bundle.module)
        ///
        public static let searchFill: Image = .init("fiori.search.fill", bundle: Bundle.module)
        ///
        public static let search: Image = .init("fiori.search", bundle: Bundle.module)
        ///
        public static let share2: Image = .init("fiori.share.2", bundle: Bundle.module)
        ///
        public static let share: Image = .init("fiori.share", bundle: Bundle.module)
        ///
        public static let show: Image = .init("fiori.show", bundle: Bundle.module)
        ///
        public static let simulate: Image = .init("fiori.simulate", bundle: Bundle.module)
        ///
        public static let slimArrowDown: Image = .init("fiori.slim.arrow.down", bundle: Bundle.module)
        ///
        public static let slimArrowLeft: Image = .init("fiori.slim.arrow.left", bundle: Bundle.module)
        ///
        public static let slimArrowRight: Image = .init("fiori.slim.arrow.right", bundle: Bundle.module)
        ///
        public static let slimArrowUp: Image = .init("fiori.slim.arrow.up", bundle: Bundle.module)
        ///
        public static let sortAscending: Image = .init("fiori.sort.ascending", bundle: Bundle.module)
        ///
        public static let sortDescending: Image = .init("fiori.sort.descending", bundle: Bundle.module)
        ///
        public static let sort: Image = .init("fiori.sort", bundle: Bundle.module)
        ///
        public static let sortingRanking: Image = .init("fiori.sorting.ranking", bundle: Bundle.module)
        ///
        public static let sync: Image = .init("fiori.sync", bundle: Bundle.module)
        ///
        public static let sysCancel: Image = .init("fiori.sys.cancel", bundle: Bundle.module)
        ///
        public static let sysEnterFill: Image = .init("fiori.sys.enter.fill", bundle: Bundle.module)
        ///
        public static let sysEnter: Image = .init("fiori.sys.enter", bundle: Bundle.module)
        ///
        public static let sysHelpFill: Image = .init("fiori.sys.help.fill", bundle: Bundle.module)
        ///
        public static let sysHelp: Image = .init("fiori.sys.help", bundle: Bundle.module)
        ///
        public static let systemExitFill: Image = .init("fiori.system.exit.fill", bundle: Bundle.module)
        ///
        public static let systemExit: Image = .init("fiori.system.exit", bundle: Bundle.module)
        ///
        public static let unfavorite: Image = .init("fiori.unfavorite", bundle: Bundle.module)
        ///
        public static let wrench: Image = .init("fiori.wrench", bundle: Bundle.module)
        ///
        public static let zoomIn: Image = .init("fiori.zoom.in", bundle: Bundle.module)
        ///
        public static let zoomOut: Image = .init("fiori.zoom.out", bundle: Bundle.module)
    }
    
    /// Images representing arrows
    public enum arrows {
        ///
        public static let arrowBottom: Image = .init("fiori.arrow.bottom", bundle: Bundle.module)
        ///
        public static let arrowDown: Image = .init("fiori.arrow.down", bundle: Bundle.module)
        ///
        public static let arrowLeft: Image = .init("fiori.arrow.left", bundle: Bundle.module)
        ///
        public static let arrowRight: Image = .init("fiori.arrow.right", bundle: Bundle.module)
        ///
        public static let arrowTop: Image = .init("fiori.arrow.top", bundle: Bundle.module)
        ///
        public static let closeCommandField: Image = .init("fiori.close.command.field", bundle: Bundle.module)
        ///
        public static let compareArrows: Image = .init("fiori.compare.arrows", bundle: Bundle.module)
        ///
        public static let initiative: Image = .init("fiori.initiative", bundle: Bundle.module)
        ///
        public static let sourceCode: Image = .init("fiori.source.code", bundle: Bundle.module)
    }
    
    /// Images representing calendars
    public enum calendars {
        ///
        public static let accelerated: Image = .init("fiori.accelerated", bundle: Bundle.module)
        ///
        public static let appointment2: Image = .init("fiori.appointment.2", bundle: Bundle.module)
        ///
        public static let appointment: Image = .init("fiori.appointment", bundle: Bundle.module)
        ///
        public static let calendarFill: Image = .init("fiori.calendar.fill", bundle: Bundle.module)
        ///
        public static let calendar: Image = .init("fiori.calendar", bundle: Bundle.module)
        ///
        public static let checkAvailability: Image = .init("fiori.check.availability", bundle: Bundle.module)
        ///
        public static let dateTime: Image = .init("fiori.date.time", bundle: Bundle.module)
    }
    
    /// Images representing callout
    public enum callout {
        ///
        public static let discussion: Image = .init("fiori.discussion", bundle: Bundle.module)
    }
    
    /// Images representing charts
    public enum charts {
        ///
        public static let areaChart: Image = .init("fiori.area.chart", bundle: Bundle.module)
        ///
        public static let bubbleChart: Image = .init("fiori.bubble.chart", bundle: Bundle.module)
        ///
        public static let businessObjectsExperienceFill: Image = .init("fiori.business.objects.experience.fill", bundle: Bundle.module)
        ///
        public static let businessObjectsExperience: Image = .init("fiori.business.objects.experience", bundle: Bundle.module)
        ///
        public static let chartAxis: Image = .init("fiori.chart.axis", bundle: Bundle.module)
        ///
        public static let chartTreeMap: Image = .init("fiori.chart.tree.map", bundle: Bundle.module)
        ///
        public static let checklistFill: Image = .init("fiori.checklist.fill", bundle: Bundle.module)
        ///
        public static let checklistItemFill: Image = .init("fiori.checklist.item.fill", bundle: Bundle.module)
        ///
        public static let checklistItem: Image = .init("fiori.checklist.item", bundle: Bundle.module)
        ///
        public static let checklist: Image = .init("fiori.checklist", bundle: Bundle.module)
        ///
        public static let chevronPhaseFill: Image = .init("fiori.chevron.phase.fill", bundle: Bundle.module)
        ///
        public static let chevronPhase: Image = .init("fiori.chevron.phase", bundle: Bundle.module)
        ///
        public static let choroplethChart: Image = .init("fiori.choropleth.chart", bundle: Bundle.module)
        ///
        public static let circleTaskFill: Image = .init("fiori.circle.task.fill", bundle: Bundle.module)
        ///
        public static let circleTask: Image = .init("fiori.circle.task", bundle: Bundle.module)
        ///
        public static let columnChartDualAxis: Image = .init("fiori.column.chart.dual.axis", bundle: Bundle.module)
        ///
        public static let horizontalBarChart: Image = .init("fiori.horizontal.bar.chart", bundle: Bundle.module)
        ///
        public static let orgChartFill: Image = .init("fiori.org.chart.fill", bundle: Bundle.module)
        ///
        public static let orgChart: Image = .init("fiori.org.chart", bundle: Bundle.module)
        ///
        public static let pieChart: Image = .init("fiori.pie.chart", bundle: Bundle.module)
        ///
        public static let programTrianglesFill: Image = .init("fiori.program.triangles.fill", bundle: Bundle.module)
        ///
        public static let programTriangles: Image = .init("fiori.program.triangles", bundle: Bundle.module)
        ///
        public static let toolsOpportunityFill: Image = .init("fiori.tools.opportunity.fill", bundle: Bundle.module)
        ///
        public static let toolsOpportunity: Image = .init("fiori.tools.opportunity", bundle: Bundle.module)
        ///
        public static let tree: Image = .init("fiori.tree", bundle: Bundle.module)
        ///
        public static let lineChart: Image = .init("fiori.line.chart", bundle: Bundle.module)
    }
    
    /// Images representing clipboards
    public enum clipboards {
        ///
        public static let activities: Image = .init("fiori.activities", bundle: Bundle.module)
        ///
        public static let activityAssignedToGoal: Image = .init("fiori.activity.assigned.to.goal", bundle: Bundle.module)
        ///
        public static let activityIndividual: Image = .init("fiori.activity.individual", bundle: Bundle.module)
        ///
        public static let activityItems: Image = .init("fiori.activity.items", bundle: Bundle.module)
        ///
        public static let clinicalFastTracker: Image = .init("fiori.clinical.fast.tracker", bundle: Bundle.module)
        ///
        public static let taskFill: Image = .init("fiori.task.fill", bundle: Bundle.module)
        ///
        public static let task: Image = .init("fiori.task", bundle: Bundle.module)
    }
    
    /// Images representing device
    public enum device {
        ///
        public static let fobWatchFill: Image = .init("fiori.fob.watch.fill", bundle: Bundle.module)
        ///
        public static let fobWatch: Image = .init("fiori.fob.watch", bundle: Bundle.module)
        ///
        public static let machine: Image = .init("fiori.machine", bundle: Bundle.module)
        ///
        public static let megaphone: Image = .init("fiori.megaphone", bundle: Bundle.module)
    }
    
    /// Images representing documents
    public enum documents {
        ///
        public static let attachmentAudio: Image = .init("fiori.attachment.audio", bundle: Bundle.module)
        ///
        public static let attachmentEpub: Image = .init("fiori.attachment.epub", bundle: Bundle.module)
        ///
        public static let attachmentHtml: Image = .init("fiori.attachment.html", bundle: Bundle.module)
        ///
        public static let attachmentPhoto: Image = .init("fiori.attachment.photo", bundle: Bundle.module)
        ///
        public static let attachment: Image = .init("fiori.attachment", bundle: Bundle.module)
        ///
        public static let attachmentText: Image = .init("fiori.attachment.text", bundle: Bundle.module)
        ///
        public static let attachmentVideo: Image = .init("fiori.attachment.video", bundle: Bundle.module)
        ///
        public static let attachmentZip: Image = .init("fiori.attachment.zip", bundle: Bundle.module)
        ///
        public static let barcode: Image = .init("fiori.barcode", bundle: Bundle.module)
        ///
        public static let clinicalOrder: Image = .init("fiori.clinical.order", bundle: Bundle.module)
        ///
        public static let customerFinancialFactSheet: Image = .init("fiori.customer.financial.fact.sheet", bundle: Bundle.module)
        ///
        public static let docAttachment: Image = .init("fiori.doc.attachment", bundle: Bundle.module)
        ///
        public static let document: Image = .init("fiori.document", bundle: Bundle.module)
        ///
        public static let documentText: Image = .init("fiori.document.text", bundle: Bundle.module)
        ///
        public static let documents: Image = .init("fiori.documents", bundle: Bundle.module)
        ///
        public static let expenseReport: Image = .init("fiori.expense.report", bundle: Bundle.module)
        ///
        public static let pdfAttachment: Image = .init("fiori.pdf.attachment", bundle: Bundle.module)
        ///
        public static let salesDocument: Image = .init("fiori.sales.document", bundle: Bundle.module)
        ///
        public static let salesOrderItem: Image = .init("fiori.sales.order.item", bundle: Bundle.module)
    }
    
    /// Images representing folder
    public enum folder {
        ///
        public static let batchPayments: Image = .init("fiori.batch.payments", bundle: Bundle.module)
        ///
        public static let folderBlank: Image = .init("fiori.folder.blank", bundle: Bundle.module)
        ///
        public static let folderFill: Image = .init("fiori.folder.fill", bundle: Bundle.module)
        ///
        public static let folder: Image = .init("fiori.folder", bundle: Bundle.module)
    }
    
    /// Images representing form
    public enum form {
        ///
        public static let approvals: Image = .init("fiori.approvals", bundle: Bundle.module)
    }
    
    /// Images representing medical
    public enum medical {
        ///
        public static let accidentalLeave: Image = .init("fiori.accidental.leave", bundle: Bundle.module)
        ///
        public static let bed: Image = .init("fiori.bed", bundle: Bundle.module)
        ///
        public static let electrocardiogram: Image = .init("fiori.electrocardiogram", bundle: Bundle.module)
    }
    
    /// Images representing money
    public enum money {
        ///
        public static let capitalProjects: Image = .init("fiori.capital.projects", bundle: Bundle.module)
        ///
        public static let commissionCheck: Image = .init("fiori.commission.check", bundle: Bundle.module)
        ///
        public static let lead: Image = .init("fiori.lead", bundle: Bundle.module)
        ///
        public static let loan: Image = .init("fiori.loan", bundle: Bundle.module)
        ///
        public static let moneyBills: Image = .init("fiori.money.bills", bundle: Bundle.module)
        ///
        public static let monitorPayments: Image = .init("fiori.monitor.payments", bundle: Bundle.module)
        ///
        public static let travelExpenseReportFill: Image = .init("fiori.travel.expense.report.fill", bundle: Bundle.module)
        ///
        public static let travelExpenseReport: Image = .init("fiori.travel.expense.report", bundle: Bundle.module)
        ///
        public static let paidLeave: Image = .init("fiori.paid.leave", bundle: Bundle.module)
    }
    
    /// Images representing objects
    public enum objects {
        ///
        public static let acUnit: Image = .init("fiori.ac.unit", bundle: Bundle.module)
        ///
        public static let addressBook: Image = .init("fiori.address.book", bundle: Bundle.module)
        ///
        public static let addresses: Image = .init("fiori.addresses", bundle: Bundle.module)
        ///
        public static let arobase: Image = .init("fiori.arobase", bundle: Bundle.module)
        ///
        public static let background: Image = .init("fiori.background", bundle: Bundle.module)
        ///
        public static let badge: Image = .init("fiori.badge", bundle: Bundle.module)
        ///
        public static let bbydActiveSales: Image = .init("fiori.bbyd.active.sales", bundle: Bundle.module)
        ///
        public static let bbydDashboard: Image = .init("fiori.bbyd.dashboard", bundle: Bundle.module)
        ///
        public static let bellFill: Image = .init("fiori.bell.fill", bundle: Bundle.module)
        ///
        public static let bell: Image = .init("fiori.bell", bundle: Bundle.module)
        ///
        public static let blankTag2: Image = .init("fiori.blank.tag.2", bundle: Bundle.module)
        ///
        public static let blankTag: Image = .init("fiori.blank.tag", bundle: Bundle.module)
        ///
        public static let border: Image = .init("fiori.border", bundle: Bundle.module)
        ///
        public static let building: Image = .init("fiori.building", bundle: Bundle.module)
        ///
        public static let bulletTextFill: Image = .init("fiori.bullet.text.fill", bundle: Bundle.module)
        ///
        public static let bulletText: Image = .init("fiori.bullet.text", bundle: Bundle.module)
        ///
        public static let businessByDesign: Image = .init("fiori.business.by.design", bundle: Bundle.module)
        ///
        public static let businessCardFill: Image = .init("fiori.business.card.fill", bundle: Bundle.module)
        ///
        public static let businessCard: Image = .init("fiori.business.card", bundle: Bundle.module)
        ///
        public static let businessObjectsExplorer: Image = .init("fiori.business.objects.explorer", bundle: Bundle.module)
        ///
        public static let businessObjectsMobileFill: Image = .init("fiori.business.objects.mobile.fill", bundle: Bundle.module)
        ///
        public static let businessObjectsMobile: Image = .init("fiori.business.objects.mobile", bundle: Bundle.module)
        ///
        public static let camera: Image = .init("fiori.camera", bundle: Bundle.module)
        ///
        public static let cardFill: Image = .init("fiori.card.fill", bundle: Bundle.module)
        ///
        public static let card: Image = .init("fiori.card", bundle: Bundle.module)
        ///
        public static let cloud: Image = .init("fiori.cloud", bundle: Bundle.module)
        ///
        public static let co: Image = .init("fiori.co", bundle: Bundle.module)
        ///
        public static let competitorFill: Image = .init("fiori.competitor.fill", bundle: Bundle.module)
        ///
        public static let competitor: Image = .init("fiori.competitor", bundle: Bundle.module)
        ///
        public static let contacts: Image = .init("fiori.contacts", bundle: Bundle.module)
        ///
        public static let creditCard: Image = .init("fiori.credit.card", bundle: Bundle.module)
        ///
        public static let crmSales: Image = .init("fiori.crm.sales", bundle: Bundle.module)
        ///
        public static let eCare: Image = .init("fiori.e.care", bundle: Bundle.module)
        ///
        public static let educationFill: Image = .init("fiori.education.fill", bundle: Bundle.module)
        ///
        public static let education: Image = .init("fiori.education", bundle: Bundle.module)
        ///
        public static let explorer: Image = .init("fiori.explorer", bundle: Bundle.module)
        ///
        public static let factory: Image = .init("fiori.factory", bundle: Bundle.module)
        ///
        public static let header: Image = .init("fiori.header", bundle: Bundle.module)
        ///
        public static let headset: Image = .init("fiori.headset", bundle: Bundle.module)
        ///
        public static let map3Fill: Image = .init("fiori.map.3.fill", bundle: Bundle.module)
        ///
        public static let map3: Image = .init("fiori.map.3", bundle: Bundle.module)
        ///
        public static let mapFill: Image = .init("fiori.map.fill", bundle: Bundle.module)
        ///
        public static let map: Image = .init("fiori.map", bundle: Bundle.module)
        ///
        public static let number: Image = .init("fiori.number", bundle: Bundle.module)
        ///
        public static let picture: Image = .init("fiori.picture", bundle: Bundle.module)
        ///
        public static let productFill: Image = .init("fiori.product.fill", bundle: Bundle.module)
        ///
        public static let product: Image = .init("fiori.product", bundle: Bundle.module)
        ///
        public static let qrCode: Image = .init("fiori.qr.code", bundle: Bundle.module)
        ///
        public static let screenSplitOne: Image = .init("fiori.screen.split.one", bundle: Bundle.module)
        ///
        public static let screenSplitThree: Image = .init("fiori.screen.split.three", bundle: Bundle.module)
        ///
        public static let screenSplitTwo: Image = .init("fiori.screen.split.two", bundle: Bundle.module)
        ///
        public static let studyLeaveFill: Image = .init("fiori.study.leave.fill", bundle: Bundle.module)
        ///
        public static let studyLeave: Image = .init("fiori.study.leave", bundle: Bundle.module)
        ///
        public static let suitcaseFill: Image = .init("fiori.suitcase.fill", bundle: Bundle.module)
        ///
        public static let suitcase: Image = .init("fiori.suitcase", bundle: Bundle.module)
        ///
        public static let targetGroupFill: Image = .init("fiori.target.group.fill", bundle: Bundle.module)
        ///
        public static let targetGroup: Image = .init("fiori.target.group", bundle: Bundle.module)
        ///
        public static let umbrella: Image = .init("fiori.umbrella", bundle: Bundle.module)
        ///
        public static let world: Image = .init("fiori.world", bundle: Bundle.module)
    }
    
    /// Images representing people
    public enum people {
        ///
        public static let account: Image = .init("fiori.account", bundle: Bundle.module)
        ///
        public static let addContact: Image = .init("fiori.add.contact", bundle: Bundle.module)
        ///
        public static let addEmployee: Image = .init("fiori.add.employee", bundle: Bundle.module)
        ///
        public static let citizenConnect: Image = .init("fiori.citizen.connect", bundle: Bundle.module)
        ///
        public static let collaborateFill: Image = .init("fiori.collaborate.fill", bundle: Bundle.module)
        ///
        public static let collaborate: Image = .init("fiori.collaborate", bundle: Bundle.module)
        ///
        public static let companyViewFill: Image = .init("fiori.company.view.fill", bundle: Bundle.module)
        ///
        public static let companyView: Image = .init("fiori.company.view", bundle: Bundle.module)
        ///
        public static let customerBriefing: Image = .init("fiori.customer.briefing", bundle: Bundle.module)
        ///
        public static let customerFill: Image = .init("fiori.customer.fill", bundle: Bundle.module)
        ///
        public static let customer: Image = .init("fiori.customer", bundle: Bundle.module)
        ///
        public static let employeeApprovals: Image = .init("fiori.employee.approvals", bundle: Bundle.module)
        ///
        public static let employeeLookup: Image = .init("fiori.employee.lookup", bundle: Bundle.module)
        ///
        public static let employeePane: Image = .init("fiori.employee.pane", bundle: Bundle.module)
        ///
        public static let employeeRejections: Image = .init("fiori.employee.rejections", bundle: Bundle.module)
        ///
        public static let employee: Image = .init("fiori.employee", bundle: Bundle.module)
        ///
        public static let group: Image = .init("fiori.group", bundle: Bundle.module)
        ///
        public static let leads: Image = .init("fiori.leads", bundle: Bundle.module)
        ///
        public static let learningAssistant: Image = .init("fiori.learning.assistant", bundle: Bundle.module)
        ///
        public static let personPlaceholderFill: Image = .init("fiori.person.placeholder.fill", bundle: Bundle.module)
        ///
        public static let personPlaceholder: Image = .init("fiori.person.placeholder", bundle: Bundle.module)
    }
    
    /// Images representing places
    public enum places {
        ///
        public static let retailStore: Image = .init("fiori.retail.store", bundle: Bundle.module)
    }
    
    /// Images representing shopping
    public enum shopping {
        ///
        public static let basketFill: Image = .init("fiori.basket.fill", bundle: Bundle.module)
        ///
        public static let basket: Image = .init("fiori.basket", bundle: Bundle.module)
        ///
        public static let cart2: Image = .init("fiori.cart.2", bundle: Bundle.module)
        ///
        public static let cart3: Image = .init("fiori.cart.3", bundle: Bundle.module)
        ///
        public static let cart4: Image = .init("fiori.cart.4", bundle: Bundle.module)
        ///
        public static let cartApproval: Image = .init("fiori.cart.approval", bundle: Bundle.module)
        ///
        public static let cartFill: Image = .init("fiori.cart.fill", bundle: Bundle.module)
        ///
        public static let cart: Image = .init("fiori.cart", bundle: Bundle.module)
    }
    
    /// Images representing status
    public enum status {
        ///
        public static let appearOffline: Image = .init("fiori.appear.offline", bundle: Bundle.module)
        ///
        public static let busy: Image = .init("fiori.busy", bundle: Bundle.module)
        ///
        public static let error: Image = .init("fiori.error", bundle: Bundle.module)
        ///
        public static let history: Image = .init("fiori.history", bundle: Bundle.module)
        ///
        public static let informationFill: Image = .init("fiori.information.fill", bundle: Bundle.module)
        ///
        public static let loader0: Image = .init("fiori.loader.0", bundle: Bundle.module)
        ///
        public static let loader1: Image = .init("fiori.loader.1", bundle: Bundle.module)
        ///
        public static let loader3: Image = .init("fiori.loader.3", bundle: Bundle.module)
        ///
        public static let messageWarning: Image = .init("fiori.message.warning", bundle: Bundle.module)
        ///
        public static let notification: Image = .init("fiori.notification", bundle: Bundle.module)
        ///
        public static let warning: Image = .init("fiori.warning", bundle: Bundle.module)
    }
    
    /// Images representing time
    public enum time {
        ///
        public static let createEntryTime: Image = .init("fiori.create.entry.time", bundle: Bundle.module)
        ///
        public static let past: Image = .init("fiori.past", bundle: Bundle.module)
    }
    
    /// Images representing transport
    public enum transport {
        ///
        public static let busPublicTransport: Image = .init("fiori.bus.public.transport", bundle: Bundle.module)
        ///
        public static let carRentalFill: Image = .init("fiori.car.rental.fill", bundle: Bundle.module)
        ///
        public static let carRental: Image = .init("fiori.car.rental", bundle: Bundle.module)
        ///
        public static let cargoTrain: Image = .init("fiori.cargo.train", bundle: Bundle.module)
        ///
        public static let flightFill: Image = .init("fiori.flight.fill", bundle: Bundle.module)
        ///
        public static let flight: Image = .init("fiori.flight", bundle: Bundle.module)
        ///
        public static let passengerTrain: Image = .init("fiori.passenger.train", bundle: Bundle.module)
        ///
        public static let shippingStatus: Image = .init("fiori.shipping.status", bundle: Bundle.module)
    }
    
    /// Images representing travel
    public enum travel {
        ///
        public static let meal: Image = .init("fiori.meal", bundle: Bundle.module)
    }
}

public extension Image {
    init?(fioriName: String) {
        self.init(fioriName, bundle: Bundle.module)
    }
}
