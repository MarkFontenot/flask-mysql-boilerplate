from flask import Blueprint, request, jsonify, make_response
import json
from src import db

caregivers = Blueprint('caregiver', __name__)

@caregivers.route('/user', methods=['GET'])
def get_user_caregivers():
    # Get all caregivers associated with the current user
    caregivers = User.query.filter_by(id=user_id).first().caregivers
    return jsonify(caregivers=[c.serialize() for c in caregivers])

@caregivers.route('/user', methods=['POST'])
def add_user_caregiver():
    # Add a new caregiver for the current user
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')
    phone = data.get('phone')
    caregiver = caregiver(name=name, email=email, phone=phone, user_id=current_user.id)
    db.session.add(caregiver)
    db.session.commit()
    return jsonify(message='Caregiver added successfully!')

@caregivers.route('/user/<int:user_id>', methods=['PUT'])
def update_user_caregiver(user_id):
    # Update an existing caregiver for the current user
    caregiver = Caregiver.query.filter_by(id=user_id, user_id=current_user.id).first()
    if not caregiver:
        return jsonify(error='Caregiver not found!')
    data = request.get_json()
    caregiver.name = data.get('name', caregiver.name)
    caregiver.email = data.get('email', caregiver.email)
    caregiver.phone = data.get('phone', caregiver.phone)
    db.session.commit()
    return jsonify(message='Caregiver updated successfully!')

@caregivers.route('/user/<int:user_id>', methods=['DELETE'])
def delete_user_caregiver(user_id):
    # Delete an existing caregiver for the current user
    caregiver = Caregiver.query.filter_by(id=caregiver_id, user_id=current_user.id).first()
    if not caregiver:
        return jsonify(error='Caregiver not found!')
    db.session.delete(caregiver)
    db.session.commit()
    return jsonify(message='Caregiver deleted successfully!')

@caregivers.route('/medical-professionals/add', methods=['POST'])
def add_medical_professional():
    if request.method == 'POST':
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        specialty = request.form['specialty']
        treatment_id = request.form['treatment_id']

        # create a new medical professional object
        new_professional = MedicalProfessional(first_name=first_name, last_name=last_name, specialty=specialty, treatment_id=treatment_id)

        # add the new professional to the database
        db.session.add(new_professional)
        db.session.commit()

        # return success message
        return 'New medical professional added successfully!'

@caregivers.route('/treatment-centers', methods=['GET'])
def get_treatment_centers():
    centers = TreatmentCenter.query.all()
    center_list = []

    # loop through all centers and add them to the center_list
    for center in centers:
        center_dict = {}
        center_dict['center_id'] = center.center_id
        center_dict['street_address'] = center.street_address
        center_dict['state'] = center.state
        center_dict['city'] = center.city
        center_dict['zip_code'] = center.zip_code
        center_dict['website'] = center.website
        center_dict['professional_id'] = center.professional_id
        center_dict['email_1'] = center.email_1
        center_dict['email_2'] = center.email_2
        center_dict['phone_1'] = center.phone_1
        center_dict['phone_2'] = center.phone_2
        center_list.append(center_dict)

    # return the center_list as JSON
    return jsonify(center_list)

@caregivers.route('/supported-by', methods=['POST'])
def create_supported_by():
    try:
        resource_id = request.json['resource_id']
        user_id = request.json['user_id']
        # check if both resource_id and user_id are present
        if not resource_id or not user_id:
            return jsonify({'error': 'Please provide both resource_id and user_id.'}), 400
        # create a new supported_by entry
        new_entry = SupportedBy(resource_id=resource_id, user_id=user_id)
        db.session.add(new_entry)
        db.session.commit()
        return jsonify({'message': 'New entry added to supported_by table.'}), 201
    except:
        return jsonify({'error': 'Failed to create a new entry in supported_by table.'}), 500

@caregivers.route('/meeting', methods=['POST'])
def create_meeting():
    try:
        support_group_id = request.json['support_group_id']
        # check if support_group_id is present
        if not support_group_id:
            return jsonify({'error': 'Please provide support_group_id.'}), 400
        # create a new meeting entry
        new_entry = Meeting(support_group_id=support_group_id)
        db.session.add(new_entry)
        db.session.commit()
        return jsonify({'message': 'New entry added to meeting table.'}), 201
    except:
        return jsonify({'error': 'Failed to create a new entry in meeting table.'}), 500
