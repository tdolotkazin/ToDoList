import Foundation
struct StringProvider {
    var addNewTask: String { NSLocalizedString("add new task", comment: "") }
    var taskList: String { NSLocalizedString("task list", comment: "") }
    var taskName: String { NSLocalizedString("task name", comment: "") }
    var description: String { NSLocalizedString("description", comment: "")}
    var mandatoryFieldsLegend: String { NSLocalizedString("mandatory fields legend", comment: "")}
    var enterText: String { NSLocalizedString("enter text", comment: "")}
    var priority: String { NSLocalizedString("priority", comment: "")}
    var add: String { NSLocalizedString("add", comment: "")}
    var task: String { NSLocalizedString("task", comment: "")}
    var edit: String { NSLocalizedString("edit", comment: "")}
    var done: String { NSLocalizedString("done", comment: "")}
    var notDone: String { NSLocalizedString("not done", comment: "")}
    var status: String { NSLocalizedString("status", comment: "")}
    var save: String { NSLocalizedString("save", comment: "")}
    var cancel: String { NSLocalizedString("cancel", comment: "")}

    // Task priorities
    var critical: String { NSLocalizedString("critical", comment: "")}
    var high: String { NSLocalizedString("high", comment: "")}
    var medium: String { NSLocalizedString("medium", comment: "")}
    var low: String { NSLocalizedString("low", comment: "")}
}
