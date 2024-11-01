import SwiftUI
import CoreData

struct HomeView: View {
	@Environment(\.managedObjectContext) private var viewContext
	@FetchRequest(
		entity: Exercise.entity(),
		sortDescriptors: [NSSortDescriptor(keyPath: \Exercise.name, ascending: true)]
	) private var exercises: FetchedResults<Exercise>
	
	@State private var showPlans: Bool = true
	
	var body: some View {
		VStack {
			HStack(spacing: 0) {
				Button(action: {
					showPlans = true
				}) {
					Text("PLANS")
						.fontWeight(.bold)
						.foregroundColor(showPlans ? Color.black : Color.gray)
						
				}
				.padding()
				.frame(maxWidth: .infinity)
				.overlay(
					Rectangle()
						.frame(height: 2)
						.foregroundColor(showPlans ? Color.black : Color.gray)
						.padding(.top, 40)
				)
				
				Button(action: {
					showPlans = false
				}) {
					Text("WORKOUTS")
						.fontWeight(.bold)
						.foregroundColor(!showPlans ? Color.black : Color.gray)
				}
				.padding()
				.frame(maxWidth: .infinity)
				.overlay(
					Rectangle()
						.frame(height: 2)
						.foregroundColor(!showPlans ? Color.black : Color.gray)
						.padding(.top, 40)
				)
			}
			
			if showPlans {
				Text("Plans")
			}
			else {
				Text("Workouts")
			}
			
			Spacer()
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
	}
}
