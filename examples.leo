program reward_system.aleo {
    
    // Mapping to store user balances on-chain
    mapping user_balances: address => u64;

    // Transition function to add reward points for a user
    async transition add_points(
        public user: address,
        public points: u64,
        public is_special: bool,
    ) -> Future {
        // Update the user's points asynchronously
        return update_user_balance(user, points, is_special);
    }

    // Async function to update the user's balance
    async function update_user_balance(
        user: address,
        points: u64,
        is_special: bool,
    ) {
        // Retrieve the current balance or initialize to 0
        let current_balance: u64 = Mapping::get_or_use(user_balances, user, 0u64);

        // Calculate the bonus and double points if eligible
        let bonus_points = calculate_bonus(points);
        let total_points = double_points_if_special(points + bonus_points, is_special);

        // Update the mapping with the new balance
        Mapping::set(user_balances, user, current_balance + total_points);
    }

    // Helper function to calculate a 10% bonus on points
    function calculate_bonus(
        points: u64,
    ) -> u64 {
        let bonus_rate: u32 = 10; // 10% bonus
        return (points * bonus_rate as u64) / 100;
    }

    // Inline function to double the points if a special condition is met
    inline double_points_if_special(
        points: u64,
        is_special: bool,
    ) -> u64 {
        return if is_special { points * 2 } else { points };
    }
}