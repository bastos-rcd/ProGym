import SwiftUI

struct NewPlanView: View {
	@Environment(\.managedObjectContext) private var viewContext
	@Environment(\.presentationMode) var presentationMode
	
    var body: some View {
		VStack {
			Text("new plan")
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
    NewPlanView()
		.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
