from flask import Blueprint, render_template, session, request, redirect, url_for
from extensions import db
from models.models import User

user = Blueprint("user", __name__)

@user.route("/profile")
def profile():
    if "user" not in session:
        return redirect(url_for("auth.login"))

    u = User.query.filter_by(email=session["user"]).first()
    return render_template("profile.html", user=u)


@user.route("/profile/update", methods=["POST"])
def update_profile():
    if "user" not in session:
        return redirect(url_for("auth.login"))

    new_name = request.form["name"]
    u = User.query.filter_by(email=session["user"]).first()

    u.name = new_name
    db.session.commit()

    session["user_name"] = new_name
    return redirect(url_for("user.profile"))
