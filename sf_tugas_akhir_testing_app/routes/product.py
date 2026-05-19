from flask import Blueprint, render_template, request, redirect, url_for, session
from extensions import db
from models.models import Product
import os
from werkzeug.utils import secure_filename
from flask import current_app

product = Blueprint("product", __name__)

@product.route("/")
def index():
    products = Product.query.order_by(Product.id.desc()).all()
    return render_template("index.html", products=products)


@product.route("/upload", methods=["GET", "POST"])
def upload():
    if "user" not in session:
        return redirect(url_for("auth.login"))

    if request.method == "POST":
        name = request.form["name"]
        desc = request.form["description"]
        price = request.form["price"]

        file = request.files["file"]
        filename = secure_filename(file.filename)

        file.save(os.path.join(current_app.root_path, "static/uploads", filename))

        new_product = Product(name=name, description=desc, price=price, image=filename)
        db.session.add(new_product)
        db.session.commit()

        return redirect(url_for("product.index"))

    return render_template("upload.html")

@product.route("/<int:product_id>")
def detail(product_id):
    product = Product.query.get_or_404(product_id)
    return render_template("product_detail.html", product=product)
