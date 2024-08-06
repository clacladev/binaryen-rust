
function asmFunc(imports) {
 var Math_imul = Math.imul;
 var Math_fround = Math.fround;
 var Math_abs = Math.abs;
 var Math_clz32 = Math.clz32;
 var Math_min = Math.min;
 var Math_max = Math.max;
 var Math_floor = Math.floor;
 var Math_ceil = Math.ceil;
 var Math_trunc = Math.trunc;
 var Math_sqrt = Math.sqrt;
 function $0($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return Math_fround(Math_fround($0_1 + $1_1));
 }
 
 function $1($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return Math_fround(Math_fround($0_1 - $1_1));
 }
 
 function $2($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return Math_fround(Math_fround($0_1 * $1_1));
 }
 
 function $3($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return Math_fround(Math_fround($0_1 / $1_1));
 }
 
 function $4($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return +($0_1 + $1_1);
 }
 
 function $5($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return +($0_1 - $1_1);
 }
 
 function $6($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return +($0_1 * $1_1);
 }
 
 function $7($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return +($0_1 / $1_1);
 }
 
 function $8($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return $0_1 == $1_1 | 0;
 }
 
 function $9($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return $0_1 != $1_1 | 0;
 }
 
 function $10($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return $0_1 >= $1_1 | 0;
 }
 
 function $11($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return $0_1 > $1_1 | 0;
 }
 
 function $12($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return $0_1 <= $1_1 | 0;
 }
 
 function $13($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return $0_1 < $1_1 | 0;
 }
 
 function $14($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return $0_1 == $1_1 | 0;
 }
 
 function $15($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return $0_1 != $1_1 | 0;
 }
 
 function $16($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return $0_1 >= $1_1 | 0;
 }
 
 function $17($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return $0_1 > $1_1 | 0;
 }
 
 function $18($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return $0_1 <= $1_1 | 0;
 }
 
 function $19($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return $0_1 < $1_1 | 0;
 }
 
 function $20($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return Math_fround(Math_fround(Math_min($0_1, $1_1)));
 }
 
 function $21($0_1, $1_1) {
  $0_1 = Math_fround($0_1);
  $1_1 = Math_fround($1_1);
  return Math_fround(Math_fround(Math_max($0_1, $1_1)));
 }
 
 function $22($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return +Math_min($0_1, $1_1);
 }
 
 function $23($0_1, $1_1) {
  $0_1 = +$0_1;
  $1_1 = +$1_1;
  return +Math_max($0_1, $1_1);
 }
 
 function $24($0_1) {
  $0_1 = Math_fround($0_1);
  return +(+$0_1);
 }
 
 function $25($0_1) {
  $0_1 = +$0_1;
  return Math_fround(Math_fround($0_1));
 }
 
 function $26($0_1) {
  $0_1 = Math_fround($0_1);
  return Math_fround(Math_fround(Math_floor($0_1)));
 }
 
 function $27($0_1) {
  $0_1 = Math_fround($0_1);
  return Math_fround(Math_fround(Math_ceil($0_1)));
 }
 
 function $28($0_1) {
  $0_1 = +$0_1;
  return +Math_floor($0_1);
 }
 
 function $29($0_1) {
  $0_1 = +$0_1;
  return +Math_ceil($0_1);
 }
 
 function $30($0_1) {
  $0_1 = Math_fround($0_1);
  return Math_fround(Math_fround(Math_sqrt($0_1)));
 }
 
 function $31($0_1) {
  $0_1 = +$0_1;
  return +Math_sqrt($0_1);
 }
 
 function $32($0_1) {
  $0_1 = $0_1 | 0;
  return Math_fround(Math_fround($0_1 | 0));
 }
 
 function $33($0_1) {
  $0_1 = $0_1 | 0;
  return +(+($0_1 | 0));
 }
 
 function $34($0_1) {
  $0_1 = $0_1 | 0;
  return Math_fround(Math_fround($0_1 >>> 0));
 }
 
 function $35($0_1) {
  $0_1 = $0_1 | 0;
  return +(+($0_1 >>> 0));
 }
 
 function $36($0_1) {
  $0_1 = Math_fround($0_1);
  return ~~$0_1 | 0;
 }
 
 function $37($0_1) {
  $0_1 = +$0_1;
  return ~~$0_1 | 0;
 }
 
 function $38($0_1) {
  $0_1 = Math_fround($0_1);
  return ~~$0_1 >>> 0 | 0;
 }
 
 function $39($0_1) {
  $0_1 = +$0_1;
  return ~~$0_1 >>> 0 | 0;
 }
 
 function $40($0_1, $0$hi) {
  $0_1 = $0_1 | 0;
  $0$hi = $0$hi | 0;
  var i64toi32_i32$0 = 0;
  i64toi32_i32$0 = $0$hi;
  return Math_fround(Math_fround(+($0_1 >>> 0) + 4294967296.0 * +(i64toi32_i32$0 | 0)));
 }
 
 function $41($0_1, $0$hi) {
  $0_1 = $0_1 | 0;
  $0$hi = $0$hi | 0;
  var i64toi32_i32$0 = 0;
  i64toi32_i32$0 = $0$hi;
  return +(+($0_1 >>> 0) + 4294967296.0 * +(i64toi32_i32$0 | 0));
 }
 
 function $42($0_1, $0$hi) {
  $0_1 = $0_1 | 0;
  $0$hi = $0$hi | 0;
  var i64toi32_i32$0 = 0;
  i64toi32_i32$0 = $0$hi;
  return Math_fround(Math_fround(+($0_1 >>> 0) + 4294967296.0 * +(i64toi32_i32$0 >>> 0)));
 }
 
 function $43($0_1, $0$hi) {
  $0_1 = $0_1 | 0;
  $0$hi = $0$hi | 0;
  var i64toi32_i32$0 = 0;
  i64toi32_i32$0 = $0$hi;
  return +(+($0_1 >>> 0) + 4294967296.0 * +(i64toi32_i32$0 >>> 0));
 }
 
 function $44($0_1) {
  $0_1 = Math_fround($0_1);
  var i64toi32_i32$0 = Math_fround(0), $3_1 = 0, $4_1 = 0, i64toi32_i32$1 = 0;
  i64toi32_i32$0 = $0_1;
  if (Math_fround(Math_abs(i64toi32_i32$0)) >= Math_fround(1.0)) {
   if (i64toi32_i32$0 > Math_fround(0.0)) {
    $3_1 = ~~Math_fround(Math_min(Math_fround(Math_floor(Math_fround(i64toi32_i32$0 / Math_fround(4294967296.0)))), Math_fround(Math_fround(4294967296.0) - Math_fround(1.0)))) >>> 0
   } else {
    $3_1 = ~~Math_fround(Math_ceil(Math_fround(Math_fround(i64toi32_i32$0 - Math_fround(~~i64toi32_i32$0 >>> 0 >>> 0)) / Math_fround(4294967296.0)))) >>> 0
   }
   $4_1 = $3_1;
  } else {
   $4_1 = 0
  }
  i64toi32_i32$1 = $4_1;
  return (~~i64toi32_i32$0 >>> 0 | 0) == (0 | 0) & (i64toi32_i32$1 | 0) == (0 | 0) | 0 | 0;
 }
 
 function $45($0_1) {
  $0_1 = +$0_1;
  var i64toi32_i32$0 = 0.0, $3_1 = 0, $4_1 = 0, i64toi32_i32$1 = 0;
  i64toi32_i32$0 = $0_1;
  if (Math_abs(i64toi32_i32$0) >= 1.0) {
   if (i64toi32_i32$0 > 0.0) {
    $3_1 = ~~Math_min(Math_floor(i64toi32_i32$0 / 4294967296.0), 4294967296.0 - 1.0) >>> 0
   } else {
    $3_1 = ~~Math_ceil((i64toi32_i32$0 - +(~~i64toi32_i32$0 >>> 0 >>> 0)) / 4294967296.0) >>> 0
   }
   $4_1 = $3_1;
  } else {
   $4_1 = 0
  }
  i64toi32_i32$1 = $4_1;
  return (~~i64toi32_i32$0 >>> 0 | 0) == (0 | 0) & (i64toi32_i32$1 | 0) == (0 | 0) | 0 | 0;
 }
 
 function $46($0_1) {
  $0_1 = Math_fround($0_1);
  var i64toi32_i32$0 = Math_fround(0), $3_1 = 0, $4_1 = 0, i64toi32_i32$1 = 0;
  i64toi32_i32$0 = $0_1;
  if (Math_fround(Math_abs(i64toi32_i32$0)) >= Math_fround(1.0)) {
   if (i64toi32_i32$0 > Math_fround(0.0)) {
    $3_1 = ~~Math_fround(Math_min(Math_fround(Math_floor(Math_fround(i64toi32_i32$0 / Math_fround(4294967296.0)))), Math_fround(Math_fround(4294967296.0) - Math_fround(1.0)))) >>> 0
   } else {
    $3_1 = ~~Math_fround(Math_ceil(Math_fround(Math_fround(i64toi32_i32$0 - Math_fround(~~i64toi32_i32$0 >>> 0 >>> 0)) / Math_fround(4294967296.0)))) >>> 0
   }
   $4_1 = $3_1;
  } else {
   $4_1 = 0
  }
  i64toi32_i32$1 = $4_1;
  return (~~i64toi32_i32$0 >>> 0 | 0) == (0 | 0) & (i64toi32_i32$1 | 0) == (0 | 0) | 0 | 0;
 }
 
 function $47($0_1) {
  $0_1 = +$0_1;
  var i64toi32_i32$0 = 0.0, $3_1 = 0, $4_1 = 0, i64toi32_i32$1 = 0;
  i64toi32_i32$0 = $0_1;
  if (Math_abs(i64toi32_i32$0) >= 1.0) {
   if (i64toi32_i32$0 > 0.0) {
    $3_1 = ~~Math_min(Math_floor(i64toi32_i32$0 / 4294967296.0), 4294967296.0 - 1.0) >>> 0
   } else {
    $3_1 = ~~Math_ceil((i64toi32_i32$0 - +(~~i64toi32_i32$0 >>> 0 >>> 0)) / 4294967296.0) >>> 0
   }
   $4_1 = $3_1;
  } else {
   $4_1 = 0
  }
  i64toi32_i32$1 = $4_1;
  return (~~i64toi32_i32$0 >>> 0 | 0) == (0 | 0) & (i64toi32_i32$1 | 0) == (0 | 0) | 0 | 0;
 }
 
 function legalstub$40($0_1, $1_1) {
  $0_1 = $0_1 | 0;
  $1_1 = $1_1 | 0;
  var i64toi32_i32$2 = 0, i64toi32_i32$0 = 0, i64toi32_i32$1 = 0, i64toi32_i32$4 = 0, i64toi32_i32$3 = 0, $10_1 = 0, $3_1 = 0, $3$hi = 0, $6$hi = 0;
  i64toi32_i32$0 = 0;
  $3_1 = $0_1;
  $3$hi = i64toi32_i32$0;
  i64toi32_i32$0 = 0;
  i64toi32_i32$2 = $1_1;
  i64toi32_i32$1 = 0;
  i64toi32_i32$3 = 32;
  i64toi32_i32$4 = i64toi32_i32$3 & 31 | 0;
  if (32 >>> 0 <= (i64toi32_i32$3 & 63 | 0) >>> 0) {
   i64toi32_i32$1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
   $10_1 = 0;
  } else {
   i64toi32_i32$1 = ((1 << i64toi32_i32$4 | 0) - 1 | 0) & (i64toi32_i32$2 >>> (32 - i64toi32_i32$4 | 0) | 0) | 0 | (i64toi32_i32$0 << i64toi32_i32$4 | 0) | 0;
   $10_1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
  }
  $6$hi = i64toi32_i32$1;
  i64toi32_i32$1 = $3$hi;
  i64toi32_i32$0 = $3_1;
  i64toi32_i32$2 = $6$hi;
  i64toi32_i32$3 = $10_1;
  i64toi32_i32$2 = i64toi32_i32$1 | i64toi32_i32$2 | 0;
  return Math_fround(Math_fround($40(i64toi32_i32$0 | i64toi32_i32$3 | 0 | 0, i64toi32_i32$2 | 0)));
 }
 
 function legalstub$41($0_1, $1_1) {
  $0_1 = $0_1 | 0;
  $1_1 = $1_1 | 0;
  var i64toi32_i32$2 = 0, i64toi32_i32$0 = 0, i64toi32_i32$1 = 0, i64toi32_i32$4 = 0, i64toi32_i32$3 = 0, $10_1 = 0, $3_1 = 0, $3$hi = 0, $6$hi = 0;
  i64toi32_i32$0 = 0;
  $3_1 = $0_1;
  $3$hi = i64toi32_i32$0;
  i64toi32_i32$0 = 0;
  i64toi32_i32$2 = $1_1;
  i64toi32_i32$1 = 0;
  i64toi32_i32$3 = 32;
  i64toi32_i32$4 = i64toi32_i32$3 & 31 | 0;
  if (32 >>> 0 <= (i64toi32_i32$3 & 63 | 0) >>> 0) {
   i64toi32_i32$1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
   $10_1 = 0;
  } else {
   i64toi32_i32$1 = ((1 << i64toi32_i32$4 | 0) - 1 | 0) & (i64toi32_i32$2 >>> (32 - i64toi32_i32$4 | 0) | 0) | 0 | (i64toi32_i32$0 << i64toi32_i32$4 | 0) | 0;
   $10_1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
  }
  $6$hi = i64toi32_i32$1;
  i64toi32_i32$1 = $3$hi;
  i64toi32_i32$0 = $3_1;
  i64toi32_i32$2 = $6$hi;
  i64toi32_i32$3 = $10_1;
  i64toi32_i32$2 = i64toi32_i32$1 | i64toi32_i32$2 | 0;
  return +(+$41(i64toi32_i32$0 | i64toi32_i32$3 | 0 | 0, i64toi32_i32$2 | 0));
 }
 
 function legalstub$42($0_1, $1_1) {
  $0_1 = $0_1 | 0;
  $1_1 = $1_1 | 0;
  var i64toi32_i32$2 = 0, i64toi32_i32$0 = 0, i64toi32_i32$1 = 0, i64toi32_i32$4 = 0, i64toi32_i32$3 = 0, $10_1 = 0, $3_1 = 0, $3$hi = 0, $6$hi = 0;
  i64toi32_i32$0 = 0;
  $3_1 = $0_1;
  $3$hi = i64toi32_i32$0;
  i64toi32_i32$0 = 0;
  i64toi32_i32$2 = $1_1;
  i64toi32_i32$1 = 0;
  i64toi32_i32$3 = 32;
  i64toi32_i32$4 = i64toi32_i32$3 & 31 | 0;
  if (32 >>> 0 <= (i64toi32_i32$3 & 63 | 0) >>> 0) {
   i64toi32_i32$1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
   $10_1 = 0;
  } else {
   i64toi32_i32$1 = ((1 << i64toi32_i32$4 | 0) - 1 | 0) & (i64toi32_i32$2 >>> (32 - i64toi32_i32$4 | 0) | 0) | 0 | (i64toi32_i32$0 << i64toi32_i32$4 | 0) | 0;
   $10_1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
  }
  $6$hi = i64toi32_i32$1;
  i64toi32_i32$1 = $3$hi;
  i64toi32_i32$0 = $3_1;
  i64toi32_i32$2 = $6$hi;
  i64toi32_i32$3 = $10_1;
  i64toi32_i32$2 = i64toi32_i32$1 | i64toi32_i32$2 | 0;
  return Math_fround(Math_fround($42(i64toi32_i32$0 | i64toi32_i32$3 | 0 | 0, i64toi32_i32$2 | 0)));
 }
 
 function legalstub$43($0_1, $1_1) {
  $0_1 = $0_1 | 0;
  $1_1 = $1_1 | 0;
  var i64toi32_i32$2 = 0, i64toi32_i32$0 = 0, i64toi32_i32$1 = 0, i64toi32_i32$4 = 0, i64toi32_i32$3 = 0, $10_1 = 0, $3_1 = 0, $3$hi = 0, $6$hi = 0;
  i64toi32_i32$0 = 0;
  $3_1 = $0_1;
  $3$hi = i64toi32_i32$0;
  i64toi32_i32$0 = 0;
  i64toi32_i32$2 = $1_1;
  i64toi32_i32$1 = 0;
  i64toi32_i32$3 = 32;
  i64toi32_i32$4 = i64toi32_i32$3 & 31 | 0;
  if (32 >>> 0 <= (i64toi32_i32$3 & 63 | 0) >>> 0) {
   i64toi32_i32$1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
   $10_1 = 0;
  } else {
   i64toi32_i32$1 = ((1 << i64toi32_i32$4 | 0) - 1 | 0) & (i64toi32_i32$2 >>> (32 - i64toi32_i32$4 | 0) | 0) | 0 | (i64toi32_i32$0 << i64toi32_i32$4 | 0) | 0;
   $10_1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
  }
  $6$hi = i64toi32_i32$1;
  i64toi32_i32$1 = $3$hi;
  i64toi32_i32$0 = $3_1;
  i64toi32_i32$2 = $6$hi;
  i64toi32_i32$3 = $10_1;
  i64toi32_i32$2 = i64toi32_i32$1 | i64toi32_i32$2 | 0;
  return +(+$43(i64toi32_i32$0 | i64toi32_i32$3 | 0 | 0, i64toi32_i32$2 | 0));
 }
 
 return {
  "f32_add": $0, 
  "f32_sub": $1, 
  "f32_mul": $2, 
  "f32_div": $3, 
  "f64_add": $4, 
  "f64_sub": $5, 
  "f64_mul": $6, 
  "f64_div": $7, 
  "f32_eq": $8, 
  "f32_ne": $9, 
  "f32_ge": $10, 
  "f32_gt": $11, 
  "f32_le": $12, 
  "f32_lt": $13, 
  "f64_eq": $14, 
  "f64_ne": $15, 
  "f64_ge": $16, 
  "f64_gt": $17, 
  "f64_le": $18, 
  "f64_lt": $19, 
  "f32_min": $20, 
  "f32_max": $21, 
  "f64_min": $22, 
  "f64_max": $23, 
  "f64_promote": $24, 
  "f32_demote": $25, 
  "f32_floor": $26, 
  "f32_ceil": $27, 
  "f64_floor": $28, 
  "f64_ceil": $29, 
  "f32_sqrt": $30, 
  "f64_sqrt": $31, 
  "i32_to_f32": $32, 
  "i32_to_f64": $33, 
  "u32_to_f32": $34, 
  "u32_to_f64": $35, 
  "f32_to_i32": $36, 
  "f64_to_i32": $37, 
  "f32_to_u32": $38, 
  "f64_to_u32": $39, 
  "i64_to_f32": legalstub$40, 
  "i64_to_f64": legalstub$41, 
  "u64_to_f32": legalstub$42, 
  "u64_to_f64": legalstub$43, 
  "f32_to_i64": $44, 
  "f64_to_i64": $45, 
  "f32_to_u64": $46, 
  "f64_to_u64": $47
 };
}

var retasmFunc = asmFunc({
});
export var f32_add = retasmFunc.f32_add;
export var f32_sub = retasmFunc.f32_sub;
export var f32_mul = retasmFunc.f32_mul;
export var f32_div = retasmFunc.f32_div;
export var f64_add = retasmFunc.f64_add;
export var f64_sub = retasmFunc.f64_sub;
export var f64_mul = retasmFunc.f64_mul;
export var f64_div = retasmFunc.f64_div;
export var f32_eq = retasmFunc.f32_eq;
export var f32_ne = retasmFunc.f32_ne;
export var f32_ge = retasmFunc.f32_ge;
export var f32_gt = retasmFunc.f32_gt;
export var f32_le = retasmFunc.f32_le;
export var f32_lt = retasmFunc.f32_lt;
export var f64_eq = retasmFunc.f64_eq;
export var f64_ne = retasmFunc.f64_ne;
export var f64_ge = retasmFunc.f64_ge;
export var f64_gt = retasmFunc.f64_gt;
export var f64_le = retasmFunc.f64_le;
export var f64_lt = retasmFunc.f64_lt;
export var f32_min = retasmFunc.f32_min;
export var f32_max = retasmFunc.f32_max;
export var f64_min = retasmFunc.f64_min;
export var f64_max = retasmFunc.f64_max;
export var f64_promote = retasmFunc.f64_promote;
export var f32_demote = retasmFunc.f32_demote;
export var f32_floor = retasmFunc.f32_floor;
export var f32_ceil = retasmFunc.f32_ceil;
export var f64_floor = retasmFunc.f64_floor;
export var f64_ceil = retasmFunc.f64_ceil;
export var f32_sqrt = retasmFunc.f32_sqrt;
export var f64_sqrt = retasmFunc.f64_sqrt;
export var i32_to_f32 = retasmFunc.i32_to_f32;
export var i32_to_f64 = retasmFunc.i32_to_f64;
export var u32_to_f32 = retasmFunc.u32_to_f32;
export var u32_to_f64 = retasmFunc.u32_to_f64;
export var f32_to_i32 = retasmFunc.f32_to_i32;
export var f64_to_i32 = retasmFunc.f64_to_i32;
export var f32_to_u32 = retasmFunc.f32_to_u32;
export var f64_to_u32 = retasmFunc.f64_to_u32;
export var i64_to_f32 = retasmFunc.i64_to_f32;
export var i64_to_f64 = retasmFunc.i64_to_f64;
export var u64_to_f32 = retasmFunc.u64_to_f32;
export var u64_to_f64 = retasmFunc.u64_to_f64;
export var f32_to_i64 = retasmFunc.f32_to_i64;
export var f64_to_i64 = retasmFunc.f64_to_i64;
export var f32_to_u64 = retasmFunc.f32_to_u64;
export var f64_to_u64 = retasmFunc.f64_to_u64;
