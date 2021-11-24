const express = require("express");
const bodyParser = require("body-parser");
const { urlencoded } = require("body-parser");

const { Pool, Client } = require('pg')
let pool;
const ejs = require("ejs");
const { json } = require("stream/consumers");
const app = express()
app.set("view engine","ejs");
app.use(bodyParser.urlencoded({extended:true}))
app.use(express.static('public'));


app.get("/",(req,res)=>{
    res.sendFile(__dirname+"/login.html");
});


app.post("/",async(req,res)=>{
    nm = req.body.loginid;
    psd = req.body.loginpassword;
   // console.log(psd);
    // credentials = {
    //     user: nm,
    //     password: psd,
    //     host: "localhost",
    //     port: "5432",
    //     database: "grocery"
    // }
    // console.log(credentials)
    try{
        pool = new Pool({
            user: nm,
            password: psd,
            host: "localhost",
            port: "5432",
            database: "grocery"
        });
        pool.connect((err) => {
            if (err) {
                res.render("error",{errormessage:"Check the credentials again"});
            }else
            {
                if(nm == "manager")
                {
                    res.redirect("/manager");
                }else 
                {
                    res.redirect("/checkout");
                }
            }
            // client.query('SELECT NOW()', (err, result) => {
            //     release()
            //     if (err) {
            //         return console.error('Error executing query', err.stack)
            //     }
            //     console.log(result.rows)
            // })
        })


    }catch(err)
    {
        console.log("error occuerd in items section")
        console.log(err);
    }
    
    // res.redirect("/employee");
});







// -------------------------------------EMPLOYEE--------------------------------------

app.get("/employee",async (req,res)=>{
    t2 = "select * from employee";
    try{
        const q = await pool.query(t2);
        const arr = [];
        for (var i = 0; i < q.rows.length; i++) {
            arr.push(q.rows[i]);
        }
        res.render("employee", { arr: arr });
    }catch(err)
    {
        console.log("error in employee section get req");
        console.log(err);
    }
    
});

app.post("/employee",async (req,res)=>{
    q1 = "select emp_id from employee";
    t2 = "select * from employee";
    q2 = "insert into employee(emp_id,name,ssn,phone,store_id) values($1,$2,$3,$4,$5)";

    emp_name = req.body.name;
    phone = req.body.phone;
    store_id = req.body.store_id;
    ssn = parseInt(Math.random() * 1000000000, 10);
    empid = await pool.query(q1);
    var mx =0;
    for(var i=0; i< empid.rows.length ;i++)
    {
        mx = Math.max(mx,empid.rows[i].emp_id);
    }
    emp_id = mx+1;
    data = [emp_id,emp_name,ssn,phone,store_id];
    
    try{
        r = await pool.query(q2,data);

        const q = await pool.query(t2);
        const arr = [];
        for (var i = 0; i < q.rows.length; i++) {
            arr.push(q.rows[i]);
        }
        res.render("employee", { arr: arr });

    }catch(err)
    {
       
        res.json(err);
    }
});






// -------------------------------------EMPLOYEE--------------------------------------







// -------------------------------------ITEMS--------------------------------------

app.get("/items",async(req,res)=>{

    q1 = "select * from items";
    try{

        r = await pool.query(q1);
        
        const arr = []
        for (var i=0; i<r.rows.length;i++)
        {
            arr.push(r.rows[i]);
        }
        res.render("items",{arr:arr});
    }catch(err){
        console.log("error in items secction get req");
        console.log(err);
    }

});


app.post("/items",async(req,res)=>{
    q1 = "select item_id from items";
    q2 = "select checkout_id from items";
    q3 = "insert into items(item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values ($1,$2,$3,$4,$5,$6,$7,$8,$9)";
    try
    {

        r = await pool.query(q1);
        // console.log(r);
        var mx= 0;
        for( var i =0;i< r.rows.length;i++)
        {
            mx = Math.max(mx,r.rows[i].item_id);
        }


        r2 = await pool.query(q2);
        var mx2 = 0;
        for (var i = 0; i < r2.rows.length; i++) {
            mx2 = Math.max(mx2,r2.rows[i].checkout_id);
        }

        mx = mx+1;
        item_id = mx;
        qty = parseInt(req.body.qty);
        item_name = req.body.itemname;
        description = req.body.description;
        taxable = req.body.taxable;
        if(taxable == "yes")
        {
            taxable = 1;
        }else
        {
            taxable =0;
        }
        price = parseFloat(req.body.price);
        weight = parseFloat(req.body.weight);
        store_id = parseInt(req.body.store_id);
        checkout_id = mx2+1;
        data = [item_id,qty,item_name,description,taxable,price,weight,store_id,checkout_id];
        
        r3 = await pool.query(q3,data);
        res.redirect("/items");

    }catch(err)
    {
        console.log("error occured in items section post req");
        console.log(err);
        res.json(err);
    }
})



// -------------------------------------ITEMS--------------------------------------


// -------------------------------------Customer--------------------------------------

app.get("/customer",async(req,res)=>{
    q1 = "select * from customer";
    
    
    try{

            r1 =await pool.query(q1);
            const arr = []
            //console.log(JSON.stringify(r1));
            for(var i =0;i<r1.rows.length;i++)
            {
                arr.push(r1.rows[i]);
            }



            
            res.render("customer",{arr:arr});


    }catch(err)
    {
        console.log("error occured in customer section get request");
        console.log(err);
        res.json(err);
    }

});


app.post("/customer",async(req,res)=>{

    q2 = "insert into customer(cust_id, name, phone, email) values($1,$2,$3,$4) ";
    q3 = "select cust_id from customer";
    try
    {


            r2 = await pool.query(q3);
            mx =0;
            for (var i = 0; i < r2.rows.length; i++) {
               mx = Math.max(mx,r2.rows[i].cust_id);
            }
            data = [mx+1,req.body.name,req.body.phone,req.body.email];

            r3 = await pool.query(q2,data);
            res.redirect("/customer");

    }catch(err)
    {
        console.log("error in customer section post request");
        console.log(err);
        res.json(err);
    }
});





// -------------------------------------Customer--------------------------------------





// -------------------------------------STORE--------------------------------------

// insert into STORE(store_id, address) values(10, '651 Lake View Junction,Miraj');
app.get("/store",async(req,res)=>{

    q1 = "select * from store";
    try{

        r1 = await pool.query(q1);
        const arr = [];
        for(var i =0;i<r1.rows.length;i++)
        {
            arr.push(r1.rows[i]);
        }

        res.render("store",{arr:arr});

    }catch(err)
    {
        console.log("error in store section get req");
        console.log(err);
        res.json(err);
    }


});


app.post("/store", async(req,res)=>{

    q1 = "select store_id from store";
    q2 = "insert into store(store_id,address) values ($1,$2)";
     try{
         mx = 0;
        r1 = await pool.query(q1);
        for(var i=0;i<r1.rows.length;i++)
        {
            mx = Math.max(mx,r1.rows[i].store_id);
        }

        data = [mx+1,req.body.store];

        r2 = await pool.query(q2,data);
        res.redirect("/store");
     }catch(err)
     {
         console.log("error in store section post req");
         console.log(err);
         res.json(err);
     }

})




// -------------------------------------STORE--------------------------------------




// -------------------------------------checkout--------------------------------------
let check_itemname = "";
let check_customername = "";
let check_cust_id = 0;
let check_item_id = 0;
let check_qty = 0;
let check_tax = 0;
let check_amt = 0;
let check_prc = 0;
let check_store_id = 0;
let check_array = [];


app.get("/checkout",async(req,res)=>{

    // let itemname = "";
    // let customername = "";
    // let cust_id = 0;
    // let item_id = 0;
    // let qty = 0;
    // let tax = 0;
    // let amt = 0;
    // let prc = 0;
    // let store_id = 0;
    // let array = [];
   q1 = "select * from items";

   try{
        itemres = await pool.query(q1);
        const iarray = []
        for(var i =0; i< itemres.rows.length; i++)
        {
            iarray.push(itemres.rows[i]);
        }
       res.render("checkout", { arr: check_array, customer_name: check_customername, amount: check_amt,itemarray:iarray });

   }catch(err)
   {
       console.log("error in checkout get req");
       console.log(err);
   }

});

// insert into ITEMS(item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values(1, 6, 'Fruits', 'Apple,banana', false, 599, 75, 1, 1);

app.post("/checkout", async(req,res)=>{
//    let itemname = "";
//    let customername = "";
//    let cust_id = 0;
//    let item_id = 0;
//    let qty = 0;
//    let tax = 0;
//    let amt = 0;
//    let prc = 0;
//    let store_id =0;
//    let array =[];
    if (req.body.item) {

        check_item_id = req.body.item;
        check_qty = req.body.qty;
        check_tax = req.body.tax;

       
        q2 = `select * from items where(item_id = ${check_item_id})`;
        try{
            r1  = await pool.query(q2);
            check_itemname = r1.rows[0].item_name;
            check_store_id = r1.rows[0].store_id;
            if(r1.rows[0].taxable)
            {
                check_prc = Math.round((check_tax / 100) * (r1.rows[0].price));
                check_amt += Math.round((check_tax/100)*(r1.rows[0].price));

            }else
            {
                check_prc = (r1.rows[0].price);
                check_amt += (r1.rows[0].price);
            }
            if(r1.rows[0].qty >= check_qty)
            {   
                var rem = r1.rows[0].qty - check_qty;
                q3 = `update items set qty = ${rem} where(item_id = ${check_item_id})`;
                r = await pool.query(q3);

            }else
            {
                res.render("error", { errormessage:"Item not available...Sorry for the inconvenience"});
            }
             j = {customer_id: check_cust_id,item_id: check_item_id,item_name:check_itemname,quantity:check_qty,price:check_prc,store_id:check_store_id};
             JSON.stringify(j);
             check_array.push(j);
            //  check_array.forEach(element => {
            //     console.log(element);
            //  });
             
            // console.log(nm);
            // console.log(amt);
            // console.log(id);
            // console.log(qty);
            // console.log(tax);

            itemquery = "select * from items";
            itemres = await pool.query(itemquery);
            let iarray = [];
            for (var i = 0; i < itemres.rows.length; i++) {
                iarray.push(itemres.rows[i]);
            }

            res.render("checkout",{arr:check_array,customer_name:check_customername,amount:check_amt,itemarray:iarray});
           

        }catch(err)
        {
            console.log("error in checkout post rq");
            console.log(err);
        }
    }
    
    if(req.body.customer_id)
    {
        
        check_cust_id = req.body.customer_id;
        //console.log(check_cust_id);
        q1 = `select name from customer where (cust_id = ${check_cust_id})`;
        try {
            //console.log(q1);
            r1 = await pool.query(q1);
            //console.log(r1);
            if (r1.rows.length > 0) {
                check_customername = r1.rows[0].name;
                //console.log(check_customername);
                // j = { customer_id: cust_id, item_id: item_id, item_name: itemname, quantity: qty, price: prc, store_id: store_id };
                // array.push(j);
                res.redirect("/checkout");
            } else {
                res.redirect("/addcustomer")
            }


        } catch (err) {
            console.log("error in checkout post");
            console.log(err);
        }
    }
    
   
   

    
    

});



// -------------------------------------checkout--------------------------------------




// -------------------------------------manager--------------------------------------


app.get("/manager",(req,res)=>{
    res.render("manager");
})


app.post("/manager",async(req,res)=>{

 qu = req.body.query;
if(!qu)
{
    res.render("error",{errormessage:"Ooops!😭 check your query again!!!"});
}
 console.log(qu);
 try{
    r = await pool.query(qu);
    const array = [];
    for(var i =0;i< r.rows.length;i++)
    {
        array.push(r.rows[i]);
    }

    // array.forEach(element => {
    //     console.log(element);
    // });

    res.render("query",{arr:array});
    //res.json(array);
 }catch (err)
 {
    res.render("error",{errormessage:"oops!😭 check your query again!!!"});
 }


})

// -------------------------------------manager--------------------------------------



// -------------------------------------addcustomer--------------------------------------

app.get("/addcustomer",(req,res)=>{
    res.render("addcustomer");
});

app.post("/addcustomer",async (req,res)=>{

    cust_name = req.body.name;
    cust_phone = req.body.phone;
    cust_email = req.body.email;
    
    q1 = "select cust_id from customer"
    q2 = "insert into customer(cust_id,name,phone,email) values($1,$2,$3,$4)"
    mx = 0;
    try{
        r1 = await pool.query(q1);
        //console.log(r1);
        
        for(var i =0; i<r1.rows.length;i++)
        {
            mx = Math.max(mx,r1.rows[i].cust_id);
        }
        mx = mx+1;
        
        
    }catch(err)
    {
        console.log("error in addcustomer post");
        console.log(err);
    }

    try{
        data = [mx, cust_name, cust_phone, cust_email];
        r2 = await pool.query(q2, data)
    }catch(err)
    {
        console.log("error in addcustomer post");
        console.log(err);
    }

    res.redirect("/checkout");
   

});



// -------------------------------------addcustomer--------------------------------------




//------------------------------------customer2-------------------------------------



app.get("/customer2", async (req, res) => {
    q1 = "select * from customer";


    try {

        r1 = await pool.query(q1);
        const arr = []
        //console.log(JSON.stringify(r1));
        for (var i = 0; i < r1.rows.length; i++) {
            arr.push(r1.rows[i]);
        }




        res.render("customer2", { arr: arr });


    } catch (err) {
        console.log("error occured in customer section get request");
        console.log(err);
        res.json(err);
    }

});


app.post("/customer2", async (req, res) => {

    q2 = "insert into customer(cust_id, name, phone, email) values($1,$2,$3,$4) ";
    q3 = "select cust_id from customer";
    try {


        r2 = await pool.query(q3);
        mx = 0;
        for (var i = 0; i < r2.rows.length; i++) {
            mx = Math.max(mx, r2.rows[i].cust_id);
        }
        data = [mx + 1, req.body.name, req.body.phone, req.body.email];

        r3 = await pool.query(q2, data);
        res.redirect("/checkout");

    } catch (err) {
        console.log("error in customer section post request");
        console.log(err);
        res.json(err);
    }
});


//------------------------------------customer2-------------------------------------



app.listen(3000,()=>{
    console.log("Server started at port 3000");
});