#![allow(non_upper_case_globals)]
#![allow(non_camel_case_types)]
#![allow(non_snake_case)]

include!(concat!(env!("OUT_DIR"), "/bindings.rs"));

// #[cfg(test)]
// mod tests {

//     use crate::{
//         BinaryenAddFunction, BinaryenAddInt32, BinaryenBinary, BinaryenLocalGet,
//         BinaryenModuleCreate, BinaryenModuleDispose, BinaryenModulePrint,
//         BinaryenModulePrintStackIR, BinaryenTypeCreate, BinaryenTypeInt32,
//     };

//     #[test]
//     fn test() {
//         unsafe {
//             let module = BinaryenModuleCreate();
//             let mut params_types = [BinaryenTypeInt32(), BinaryenTypeInt32()];
//             let params = BinaryenTypeCreate(params_types.as_mut_ptr(), params_types.len() as u32);
//             let results = BinaryenTypeInt32();

//             // Get the arguments, and add them
//             let x = BinaryenLocalGet(module, 0, params_types[0]);
//             let y = BinaryenLocalGet(module, 1, params_types[1]);
//             let add_expression = BinaryenBinary(module, BinaryenAddInt32(), x, y);

//             // Create the add function
//             let _adder_function = BinaryenAddFunction(
//                 module,
//                 "adder".as_ptr() as *const i8,
//                 params,
//                 results,
//                 &mut 0,
//                 0,
//                 add_expression,
//             );

//             BinaryenModulePrint(module);
//             BinaryenModulePrintStackIR(module);

//             BinaryenModuleDispose(module);
//         }
//     }
// }
