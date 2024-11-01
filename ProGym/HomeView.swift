import SwiftUI
import CoreData

struct HomeView: View {
	@Environment(\.managedObjectContext) private var viewContext
	@FetchRequest(
		entity: Exercise.entity(),
		sortDescriptors: [NSSortDescriptor(keyPath: \Exercise.name, ascending: true)]
	) private var exercises: FetchedResults<Exercise>
	
	var body: some View{
		NavigationView {
			List {
				ForEach(exercises) { exercise in
					Text(exercise.name ?? "NONE")
				}
			}
			.navigationTitle("Exercices")
		}
	}
}
