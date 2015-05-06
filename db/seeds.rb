@manager_position = Position.create!(title: 'manager')
@engineer_position = Position.create!(title: 'engineer')
@intern_position = Position.create!(title: 'intern')

@admin = User.create!(email: 'admin@aps.com' , password: 'adminadmin', password_confirmation: 'adminadmin', name: 'admin', surname: 'admin_surname', position_id: @manager_position.id, admin: true)
@employee1 = User.create!(email: 'employee1@aps.com' , password: 'employee', password_confirmation: 'employee', name: 'employee', surname: 'employee', position_id: @manager_position.id, admin: false)
@employee2 = User.create!(email: 'employee2@aps.com' , password: 'employee', password_confirmation: 'employee', name: 'employee', surname: 'employee', position_id: @engineer_position.id, admin: false)
@intern = User.create!(email: 'intern@aps.com', password: 'internintern', password_confirmation: 'internintern', name: 'intern', surname: 'intern', position_id: @intern_position.id, admin: true)

@project = Project.create!(title: 'First Project', start_date: DateTime.now, end_date: DateTime.now + 20.days, manager_id: @employee1.id)

@product = Product.create!(name: 'Product1', product_type: 1)

@equipment1 = Equipment.create!(name: 'Equipment1', eq_type: 1)
@equipment2 = Equipment.create!(name: 'Equipment2', eq_type: 2)

@production1 = Production.create!(product_id: @product.id, quantity: 100, project_id: @project.id)
@production2 = Production.create!(product_id: @product.id, quantity: 150, project_id: @project.id)

@material1 = Material.create!(name: 'Material1', quantity: '100')
@material2 = Material.create!(name: 'Material2', quantity: '120')
@material3 = Material.create!(name: 'Material3', quantity: '200')
