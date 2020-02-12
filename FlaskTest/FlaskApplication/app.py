from flask import Flask, render_template, request, redirect, url_for, flash, make_response
from flask_mysqldb import MySQL
import pdfkit

app = Flask(__name__)

app.secret_key = "flash message"
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_OASSWORD'] = ''
app.config['MYSQL_DB'] = 'flasktest'
mysql = MySQL(app)

@app.route("/")
def index():
    cur=mysql.connection.cursor()
    cur.execute("select * from product")
    data = cur.fetchall()
    cur.close()
    return render_template('product.html', product=data)



@app.route('/product')
def retrive_product_data():

        cur = mysql.connection.cursor()
        cur.execute("select * from product")
        data = cur.fetchall()
        cur.close()

        return render_template('product.html', product=data)






@app.route("/insert_Product", methods=['POST'])
def insert_Product():

    if request.method == "POST":

        name = request.form['ProductName']
        product_description = request.form['ProductDescription']

        cur = mysql.connection.cursor()
        cur.execute("insert into product (ProductName,ProductDescription) values (%s,%s)", (name,product_description))
        flash("Data Inserted Successfully!")
        mysql.connection.commit()
        return redirect(url_for('retrive_product_data'))


@app.route('/update_Product', methods=['POST'])
def update_Product():

        id_data = request.form['Id']
        name = request.form['name']
        product_description = request.form['description']
        cur = mysql.connection.cursor()
        cur.execute("""UPDATE product SET ProductName=%s, ProductDescription=%s WHERE ProductId=%s """, (name, product_description, id_data,))
        flash("Data Updated Successfully !")
        mysql.connection.commit()
        return redirect(url_for('retrive_product_data'))





@app.route('/location')
def retrive_location_data():

        cur = mysql.connection.cursor()
        cur.execute("select * from location")
        data = cur.fetchall()
        cur.close()

        return render_template('location.html', location=data)




@app.route("/insert_Location", methods=['POST'])
def insert_Location():

    if request.method == "POST":

        name = request.form['LocationName']
        Location_description = request.form['LocationDescription']

        cur = mysql.connection.cursor()
        cur.execute("insert into location (LocationName,LocationDescription) values (%s,%s)", (name,Location_description))
        flash("Data Inserted Successfully!")
        mysql.connection.commit()
        return redirect(url_for('retrive_location_data'))


@app.route('/update_Location', methods=['POST'])
def update_Location():

        Location_Id_Edit = request.form['Locatiion_Id']
        Locationname = request.form['Locationname_edit']
        Location_description = request.form['LocationDescription_edit']
        cur = mysql.connection.cursor()
        cur.execute("""UPDATE location SET LocationName=%s, LocationDescription=%s WHERE LocationId=%s """, (Locationname, Location_description, Location_Id_Edit,))
        flash("Data Updated Successfully !")
        mysql.connection.commit()
        return redirect(url_for('retrive_location_data'))

@app.route('/productMovememt')
def retrive_product_mov():

        cur = mysql.connection.cursor()
        cur.execute("select * from location")
        data = cur.fetchall()
        cur.close()

        cur = mysql.connection.cursor()
        cur.execute("select * from product")
        productdata = cur.fetchall()
        cur.close()

        cur = mysql.connection.cursor()
        cur.execute("select * from productmovement")
        Movdata = cur.fetchall()
        cur.close()

        return render_template('ProductMovement.html', Movlocation=data, productnames=productdata,productMovememt=Movdata)











@app.route("/insert_mov", methods=['POST'])
def insert_mov():

    if request.method == "POST":
        ProductId = request.form["Mov_ProductId"]
        FromLocation = request.form["Mov_FromLocation"]
        ToLocation = request.form["Mov_ToLocation"]
        Quantity = request.form["Mov_Quantity"]
        Time = request.form["Mov_Time"]

        cur = mysql.connection.cursor()
        cur.execute("insert into productmovement (FromLocation,ToLocation,ProductId,ProductQuantity,Timestamp) values (%s,%s,%s,%s,%s)", (FromLocation, ToLocation, ProductId, Quantity, Time))
        flash("Data Inserted Successfully!")
        mysql.connection.commit()
        return redirect(url_for('retrive_product_mov'))

@app.route('/update_mov', methods=['POST'])
def update_mov():
        MovId = request.form["Mov_Id"]
        ProductId = request.form["Mov_ProductId"]
        FromLocation = request.form["Mov_FromLocation"]
        ToLocation = request.form["Mov_ToLocation"]
        Quantity = request.form["Mov_Quantity"]
        Time = request.form["Mov_Time"]
        cur = mysql.connection.cursor()
        cur.execute("""UPDATE productmovement SET Timestamp=%s, FromLocation=%s, ToLocation=%s, ProductId=%s, 
        ProductQuantity=%s WHERE MovementId=%s """, (Time,FromLocation, ToLocation, ProductId, Quantity, MovId))
        flash("Data Updated Successfully !")
        mysql.connection.commit()
        return redirect(url_for('retrive_product_mov'))

if __name__ == '__main__':
    app.run(debug=True)
