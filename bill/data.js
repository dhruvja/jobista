const fs = require('fs');
const changeData = (client,date,sender,id) => {
    var file = fs.readFileSync('logo1.jpg','base64')
    var data = {
        // Customize enables you to provide your own templates
        // Please review the documentation for instructions and examples
        customize: {
            // template: fs.readFileSync("template.html", "base64"), // Must be base64 encoded html
        },
        images: {
            // The logo on top of your invoice
            "logo": file
            // "logo": fs.readFileSync( __dirname + "/logo1.txt",{encoding:'base64', flag:'r'}),
            // "logo": "https://public.easyinvoice.cloud/img/logo_en_original.png"
            // "logo": "http://localhost:5000/api/uploads/logo1.jpg"
        },
        // Your own data
        sender: {
            company: "Jobista",
            address: "Sample Street 123",
            zip: "572101",
            city: "Tumkur",
            State: "Karnataka",
            country: "India",
            //"custom1": "custom value 1",
            //"custom2": "custom value 2",
            //"custom3": "custom value 3"
        },
        // Your recipient
        client: {
            company: client,
            address: "",
            zip: "572103",
            city: "Tumkur",
            state: "Karnataka",
            country: "India",
            // "custom1": "custom value 1",
            // "custom2": "custom value 2",
            // "custom3": "custom value 3"
        },
        information: {
            // Invoice number
            number: id,
            // Invoice data
            date: date,
        },
        // The products you would like to see on your invoice
        // Total values are being calculated automatically
        products: [
            {
                quantity: 2,
                description: "Electric works",
                "tax-rate": 3,
                price: 500,
            },
            // {
            //     "quantity": 4.1,
            //     "description": "Product 2",
            //     "tax-rate": 6,
            //     "price": 12.34
            // },
            // {
            //     "quantity": 4.5678,
            //     "description": "Product 3",
            //     "tax-rate": 21,
            //     "price": 6324.453456
            // }
        ],
        // The message you would like to display on the bottom of your invoice
        "bottom-notice": "The invoice is paid successfully",
        // Settings to customize your invoice
        settings: {
            currency: "INR", // See documentation 'Locales and Currency' for more info. Leave empty for no currency.
            // "locale": "nl-NL", // Defaults to en-US, used for number formatting (See documentation 'Locales and Currency')
            // "tax-notation": "gst", // Defaults to 'vat'
            // "margin-top": 25, // Defaults to '25'
            // "margin-right": 25, // Defaults to '25'
            // "margin-left": 25, // Defaults to '25'
            // "margin-bottom": 25, // Defaults to '25'
            // "format": "A4" // Defaults to A4, options: A3, A4, A5, Legal, Letter, Tabloid
        },
        // Translate your invoice to your preferred language
        translate: {
            // "invoice": "FACTUUR",  // Default to 'INVOICE'
            // "number": "Nummer", // Defaults to 'Number'
            // "date": "Datum", // Default to 'Date'
            // "due-date": "Verloopdatum", // Defaults to 'Due Date'
            // "subtotal": "Subtotaal", // Defaults to 'Subtotal'
            // "products": "Producten", // Defaults to 'Products'
            // "quantity": "Aantal", // Default to 'Quantity'
            // "price": "Prijs", // Defaults to 'Price'
            // "product-total": "Totaal", // Defaults to 'Total'
            // "total": "Totaal" // Defaults to 'Total'
        },
    };
    return data
}


module.exports = changeData;