import CoreData

struct PersistenceController {
	static let shared = PersistenceController()
	
	let container: NSPersistentContainer
	
	init(inMemory: Bool = false){
		container = NSPersistentContainer(name: "ProGym")
		
		if inMemory {
			container.persistentStoreDescriptions.first?.url = URL(
				fileURLWithPath: "/dev/null"
			)
		}
		
		container.loadPersistentStores { _, error in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		}
		
		populateStaticData()
	}
	
	func populateStaticData(){
		let context = container.viewContext
		
		let request: NSFetchRequest<BodyPart> = BodyPart.fetchRequest()
		let count = (try? context.count(for: request)) ?? 0
		guard count == 0 else { return }
		
		let amrs = BodyPart(context: context)
		amrs.name = "AMRS"
		let back = BodyPart(context: context)
		back.name = "BACK"
		let chest = BodyPart(context: context)
		chest.name = "CHEST"
		let legs = BodyPart(context: context)
		legs.name = "LEGS"
		let shoulders = BodyPart(context: context)
		shoulders.name = "SHOULDERS"
		
		let dumbbellBicepsCurl = Exercise(context: context)
		dumbbellBicepsCurl.name = "Dumbbell Biceps Curl"
		dumbbellBicepsCurl.pictureUrl = "dumbbell-biceps-curl.png"
		dumbbellBicepsCurl.bodyPart = amrs
		
		let barbellRowing = Exercise(context: context)
		barbellRowing.name = "Barbell Rowing"
		barbellRowing.pictureUrl = "barbell-rowing.png"
		barbellRowing.bodyPart = back
		
		let benchPress = Exercise(context: context)
		benchPress.name = "Bench Press"
		benchPress.pictureUrl = "bench-press.png"
		benchPress.bodyPart = chest
		
		let squat = Exercise(context: context)
		squat.name = "Squat"
		squat.pictureUrl = "squat.png"
		squat.bodyPart = legs
		
		let dumbbellShoulderPress = Exercise(context: context)
		dumbbellShoulderPress.name = "Dumbbell Shoulder Press"
		dumbbellShoulderPress.pictureUrl = "dumbbell-shoulder-press.png"
		dumbbellShoulderPress.bodyPart = shoulders
		
		do {
			try context.save()
		} catch {
			print("Error saving data: \(error)")
		}
	}
}
