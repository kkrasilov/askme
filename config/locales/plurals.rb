{:ru =>
   { :i18n =>
       { :plural =>
           { :keys => [:one, :few, :other],
             :rule => lambda { |n|
               second_last_digit = (n / 10) % 10
               exclusions = (second_last_digit == 1)

               last_number = n % 10

               return :other if last_number.zero? || last_number.between?(5, 9) || exclusions
               return :few if last_number.between?(2, 4)

               :one
             }
           }
       }
   }
}
