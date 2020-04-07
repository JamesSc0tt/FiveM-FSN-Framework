-- Motorcycles
return {
	CHandlingData {

		HandlingName = "AKUMA",
		-- Physical
		Mass               = 250, 
		InitialDragCoeff   = 2.45,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    0.01, -0.15 },
		InertiaMultiplier  = { 1, 1,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.34,
		DriveInertia                   = 1.3,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.65,
		BrakeBiasFront = 0.72,
		HandBrakeForce = 0.011,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.76,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 2.0,

		-- Suspension
		SuspensionForce       = 7.6,
		SuspensionCompDamp    = 2.5,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.12,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.184,
		RollCentreHeightRear  = 0.184,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 20000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 13.8,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 12.8,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.019,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.6,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 85.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "AVARUS",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 3.8,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.12, -0.25 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.41,
		DriveInertia                   = 1.2,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 162,
		SteeringLock                   = 43.0,

		-- Brake
		BrakeForce     = 0.60,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.01,

		-- Traction
		TractionCurveMax         = 0.79,
		TractionCurveMin         = 0.65,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.5,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 1.28,

		-- Suspension
		SuspensionForce       = 7.3,
		SuspensionCompDamp    = 2.0,
		SuspensionReboundDamp = 0.7,
		SuspensionUpperLimit  = 0.1,
		SuspensionLowerLimit  = -0.05,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.24,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.135,
		RollCentreHeightRear  = 0.135,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.35,
		MonetaryValue   = 20000,
		ModelFlags		= '440010',
		HandlingFlags   = "20101",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 5.25,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 9.6,
				fMaxBankAngle			= 35.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.09,
				fStickLeanMult			= 1.4,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.6,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 75.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -10.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "BAGGER",
		-- Physical
		Mass               = 420, 
		InitialDragCoeff   = 1.85,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    0.0, -0.05 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.278,
		DriveInertia                   = 1.2,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 153,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.71,
		HandBrakeForce = 0.01,

		-- Traction
		TractionCurveMax         = 1.77,
		TractionCurveMin         = 1.62,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.55,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 1.56,

		-- Suspension
		SuspensionForce       = 6.5,
		SuspensionCompDamp    = 1.7,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.06,
		SuspensionLowerLimit  = -0.06,
		SuspensionRaise		  = 0.01,
		SuspensionBiasFront   = 0.46,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.32,
		RollCentreHeightRear  = 0.32,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20101",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 4.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 11.1,
				fMaxBankAngle			= 39.0,
				fFullAnimAngle			= 37.0,
				fDesLeanReturnFrac		= 0.08,
				fStickLeanMult			= 2.3,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.6,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 65.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -10.0,
				fBikeOnStandSteerAngle			= 0.45,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "BATI",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "BATI2", -- No Handling
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "BF400", --Start here
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "CARBONRS",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "CLIFFHANGER",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "DAEMON",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "DOUBLE",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "ENDURO",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "FAGGIO2",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "GARGOYLE",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "HAKUCHOU",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "HEXER",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "INNOVATION",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "LECTRO",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "NEMESIS",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "NIGHTBLADE",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "PCJ",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "RATBIKE",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "RUFFIAN",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "SANCHEZ",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "SANCTUS",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "SOVEREIGN",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "THRUST",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "VADER",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "VINDICATOR",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "WOLFSBANE",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 2.1,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "ZOMBIEB",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 1.0,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 225,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {

		HandlingName = "ZOMBIEA",
		-- Physical
		Mass               = 230, 
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 95,
		CentreOfMassOffset = { 0,    -0.01, -0.1 },
		InertiaMultiplier  = { 1, 1,    0.8 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.38,
		DriveInertia                   = 1.1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 42.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.77,
		HandBrakeForce = 0.013,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 26.0,
		TractionSpringDeltaMax   = 0.05,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.7,
		TractionBiasFront        = 0.35,
		TractionLossMult         = 4.62,

		-- Suspension
		SuspensionForce       = 7.8,
		SuspensionCompDamp    = 2.3,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.04,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.07,
		RollCentreHeightRear  = 0.07,

		-- Damage
		CollisionDamageMult         = 0.01,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "20100",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.0,
				fLeanFwdForceMult		= 11.0,
				fLeanBakCOMMult			= 0.0,
				fLeanBakForceMult		= 10.2,
				fMaxBankAngle			= 43.0,
				fFullAnimAngle			= 38.0,
				fDesLeanReturnFrac		= 0.02,
				fStickLeanMult			= 3.1,
				fBrakingStabilityMult	= -0.01,
				fInAirSteerMult			= -0.8,
				fWheelieBalancePoint	= 10.0,
				fStoppieBalancePoint	= -10.0,
				fWheelieSteerMult		= -0.5,
				fRearBalanceMult		= 50.0,
				fFrontBalanceMult		= 80.0,
				fBikeGroundSideFrictionMult		= 0.01,
				fBikeWheelGroundSideFrictionMult= 0.01,
				fBikeOnStandLeanAngle			= -15.0,
				fBikeOnStandSteerAngle			= 0.3,
				fJumpForce						= 0.0
			}
		}
	},
}