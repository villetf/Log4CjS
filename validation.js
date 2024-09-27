// Denna fil är en del av Log4CjS. Mer info finns här: https://gitlab.ltkalmar.se/oc/log4cjs



const Validator = require('validatorjs');

const rules = {
   token: 'required|string|min:30|max:30',
   user: 'required|string|max:50',
   button: 'required|integer|min:1',
   object: 'string|max:30'
};

const errorMsgs = {
   required: ':attribute är obligatoriskt',
   integer: ':attribute måste vara ett heltal',
   min: ':attribute måste vara minst 1',
   max: ':attribute måste vara högst 10',
   string: ':attribute måste vara en sträng'
};

module.exports = {
   rules,
   errorMsgs,
   Validator
};

