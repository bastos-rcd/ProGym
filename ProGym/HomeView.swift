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
		NavigationView {
			VStack(spacing: 0) {
				ZStack {
					Text("ProGym")
						.font(.system(size: 20))
						.fontWeight(.bold)
					
					HStack {
						Spacer()
						
						NavigationLink(
							destination: showPlans
							? AnyView(NewPlanView().environment(\.managedObjectContext, viewContext))
							: AnyView(NewWorkoutView().environment(\.managedObjectContext, viewContext))
						) {
							Text("+")
								.font(.system(size: 40))
								.fontWeight(.regular)
								.foregroundColor(Color.black)
						}
					}
				}
				.padding(.horizontal)
				
				HStack(spacing: 0) {
					Button(action: {
						showPlans = true
					}) {
						Text("PLANS")
							.font(.system(size: 16))
							.fontWeight(.bold)
							.foregroundColor(showPlans ? Color.black : Color.gray)
						
					}
					.padding()
					.frame(maxWidth: .infinity)
					.overlay(
						Rectangle()
							.frame(height: 2)
							.foregroundColor(showPlans ? Color.black : Color.gray)
							.padding(.top, 50)
					)
					
					Button(action: {
						showPlans = false
					}) {
						Text("WORKOUTS")
							.font(.system(size: 16))
							.fontWeight(.bold)
							.foregroundColor(!showPlans ? Color.black : Color.gray)
					}
					.padding()
					.frame(maxWidth: .infinity)
					.overlay(
						Rectangle()
							.frame(height: 2)
							.foregroundColor(!showPlans ? Color.black : Color.gray)
							.padding(.top, 50)
					)
				}
				.padding(.bottom, 20)
				
				if showPlans {
					Text("Plans")
				}
				else {
					Text("Workouts")
				}
				
				Spacer()
			}
			.background(Color.white)
		}
	}
}

#Preview {
	HomeView()
		.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
