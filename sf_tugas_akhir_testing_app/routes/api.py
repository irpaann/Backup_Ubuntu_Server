from flask import Blueprint, jsonify
from models.models import User

api = Blueprint("api", __name__)

@api.route("/api/users")
def api_users():
    all_users = User.query.all()

    data = [{
        "id": u.id,
        "name": u.name,
        "email": u.email
    } for u in all_users]

    return jsonify({"status": "ok", "users": data})
