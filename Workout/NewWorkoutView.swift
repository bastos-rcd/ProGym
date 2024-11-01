import SwiftUI

struct NewWorkoutView: View {
	@Environment(\.managedObjectContext) private var viewContext
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		VStack {
			Text("new workout")
		}
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: Button(action: {
			presentationMode.wrappedValue.dismiss()
		}) {
			Text("ANNULER")
				.fontWeight(.bold)
				.font(.system(size: 16))
				.foregroundColor(Color.black)
		})
	}
}

#Preview {
    NewWorkoutView()
		.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
