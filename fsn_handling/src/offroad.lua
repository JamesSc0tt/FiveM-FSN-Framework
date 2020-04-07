-- Off Road
return {
	CHandlingData {
		HandlingName = "BIFTA",
		-- Physical
		Mass               = 920,
		InitialDragCoeff   = 2.75,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.014, -0.081 },
		InertiaMultiplier  = { 0.97, 0.93,    1.51 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.261,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 2.0,
		ClutchChangeRateScaleDownShift = 2.4,
		InitialDriveMaxFlatVel         = 146,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.52,
		BrakeBiasFront = 0.6183,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 2.07,
		TractionCurveMin         = 1.9,
		TractionCurveLateral	 = 15.3,
		TractionSpringDeltaMax   = 0.11,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4763,
		TractionLossMult         = 0.89,

		-- Suspension
		SuspensionForce       = 3.55,
		SuspensionCompDamp    = 2.0,
		SuspensionReboundDamp = 0.8,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.11,
		SuspensionRaise		  = 0.03,
		SuspensionBiasFront   = 0.526,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.27,
		RollCentreHeightRear  = 0.29,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.5,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = -0.05,
		MonetaryValue   = 50000,
		ModelFlags		= '440010',
		HandlingFlags   = "282000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",
		
		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BLAZER", -- Bike Need more info
		-- Physical
		Mass               = 550,
		InitialDragCoeff   = 2.0,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, -0.1 },
		InertiaMultiplier  = { 1.1, 1.1,    1.1 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.25,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.3,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 125,
		SteeringLock                   = 35,

		-- Brake
		BrakeForce     = 0.823,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 1.22,
		TractionCurveMin         = 1.0,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.11,
		LowSpeedTractionLossMult = 0.09,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.454,
		TractionLossMult         = 0.45,

		-- Suspension
		SuspensionForce       = 2.8,
		SuspensionCompDamp    = 2.0,
		SuspensionReboundDamp = 1.5,
		SuspensionUpperLimit  = 0.15,
		SuspensionLowerLimit  = -0.08,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0.5,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.2,
		RollCentreHeightRear  = 0.2,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 10.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '040010',
		HandlingFlags   = "1000000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.15,
				fLeanFwdForceMult		= 1.0,
				fLeanBakCOMMult			= 0.2,
				fLeanBakForceMult		= 1.0,
				fMaxBankAngle			= 25.0,
				fFullAnimAngle			= 0.0,
				fDesLeanReturnFrac		= 0.11,
				fStickLeanMult			= 0.5,
				fBrakingStabilityMult	= 0.0,
				fInAirSteerMult			= -1.2,
				fWheelieBalancePoint	= 0.0,
				fStoppieBalancePoint	= 0.0,
				fWheelieSteerMult		= 0.0,
				fRearBalanceMult		= 0.0,
				fFrontBalanceMult		= 0.0,
				fBikeGroundSideFrictionMult		= 1.4,
				fBikeWheelGroundSideFrictionMult= 1.1,
				fBikeOnStandLeanAngle			= 0.0,
				fBikeOnStandSteerAngle			= 0.0,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BLAZER3", -- No Handling
		-- Physical
		Mass               = 550,
		InitialDragCoeff   = 2.0,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, -0.1 },
		InertiaMultiplier  = { 1.1, 1.1,    1.1 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.25,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.3,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 125,
		SteeringLock                   = 35,

		-- Brake
		BrakeForce     = 0.823,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 2.7,
		TractionCurveMin         = 2.5,
		TractionCurveLateral	 = 20.5,
		TractionSpringDeltaMax   = 0.09,
		LowSpeedTractionLossMult = 1.0,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.43,
		TractionLossMult         = 0.1,

		-- Suspension
		SuspensionForce       = 3.8,
		SuspensionCompDamp    = 2.0,
		SuspensionReboundDamp = 2.5,
		SuspensionUpperLimit  = 0.12,
		SuspensionLowerLimit  = -0.13,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0,
		RollCentreHeightRear  = 0,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 10.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '040010',
		HandlingFlags   = "1000000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CBikeHandlingData {
				fLeanFwdCOMMult			= 0.15,
				fLeanFwdForceMult		= 1.0,
				fLeanBakCOMMult			= 0.2,
				fLeanBakForceMult		= 1.0,
				fMaxBankAngle			= 25.0,
				fFullAnimAngle			= 0.0,
				fDesLeanReturnFrac		= 0.11,
				fStickLeanMult			= 0.5,
				fBrakingStabilityMult	= 0.0,
				fInAirSteerMult			= -1.2,
				fWheelieBalancePoint	= 0.0,
				fStoppieBalancePoint	= 0.0,
				fWheelieSteerMult		= 0.0,
				fRearBalanceMult		= 0.0,
				fFrontBalanceMult		= 0.0,
				fBikeGroundSideFrictionMult		= 1.4,
				fBikeWheelGroundSideFrictionMult= 1.1,
				fBikeOnStandLeanAngle			= 0.0,
				fBikeOnStandSteerAngle			= 0.0,
				fJumpForce						= 0.0
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BRAWLER",
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 2.2,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.12, -0.235 },
		InertiaMultiplier  = { 1, 1,    1.4 },

		-- Transmission
		DriveBiasFront                 = 0.037,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.2401,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.8,
		InitialDriveMaxFlatVel         = 144,
		SteeringLock                   = 36.0,

		-- Brake
		BrakeForce     = 0.491,
		BrakeBiasFront = 0.6281,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.86,
		TractionCurveLateral	 = 15.6,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4798,
		TractionLossMult         = 0.57,

		-- Suspension
		SuspensionForce       = 1.92,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.42,
		SuspensionUpperLimit  = 0.191,
		SuspensionLowerLimit  = -0.24,
		SuspensionRaise		  = -0.03,
		SuspensionBiasFront   = 0.535,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.65,
		RollCentreHeightFront = 0.29,
		RollCentreHeightRear  = 0.26,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.5,
		EngineDamageMult			= 1.4,
		PetrolTankVolume			= 45.0,
		OilVolume					= 4.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.25,
		MonetaryValue   = 50000,
		ModelFlags		= '110040',
		HandlingFlags   = "200000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.06,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "CONTENDER",
		-- Physical
		Mass               = 2750,
		InitialDragCoeff   = 2.5,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0, -0.36 },
		InertiaMultiplier  = { 1.15, 1,    1.45 },

		-- Transmission
		DriveBiasFront                 = 0.31,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.265,
		DriveInertia                   = 0.88,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 131,
		SteeringLock                   = 35.6,

		-- Brake
		BrakeForce     = 0.401,
		BrakeBiasFront = 0.5035,
		HandBrakeForce = 0.65,

		-- Traction
		TractionCurveMax         = 1.31,
		TractionCurveMin         = 1.08,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.135,
		LowSpeedTractionLossMult = 0.21,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4875,
		TractionLossMult         = 0.85,

		-- Suspension
		SuspensionForce       = 1.95,
		SuspensionCompDamp    = 1.75,
		SuspensionReboundDamp = 0.46,
		SuspensionUpperLimit  = 0.24,
		SuspensionLowerLimit  = -0.22,
		SuspensionRaise		  = -0.03,
		SuspensionBiasFront   = 0.478,
		AntiRollBarBiasFront  = 0.4,
		RollCentreHeightFront = 0.536,
		RollCentreHeightRear  = 0.536,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 70.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = -0.05,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 25000,
		ModelFlags		= '240010',
		HandlingFlags   = "800000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
	CHandlingData {
		
		HandlingName = "DUBSTA3",
		-- Physical
		Mass               = 3900,
		InitialDragCoeff   = 2.01,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.035, 0.024 },
		InertiaMultiplier  = { 0.38, 0.39,    0.52 },

		-- Transmission
		DriveBiasFront                 = 0.42,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.265,
		DriveInertia                   = 0.7,
		ClutchChangeRateScaleUpShift   = 2.1,
		ClutchChangeRateScaleDownShift = 2.6,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.588,
		BrakeBiasFront = 0.628,
		HandBrakeForce = 0.55,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.86,
		TractionCurveLateral	 = 17.2,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4315,
		TractionLossMult         = 0.58,

		-- Suspension
		SuspensionForce       = 1.47,
		SuspensionCompDamp    = 1.8,
		SuspensionReboundDamp = 1.1,
		SuspensionUpperLimit  = 0.3,
		SuspensionLowerLimit  = -0.18,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.76,
		AntiRollBarBiasFront  = 0,
		AntiRollBarBiasFront  = 0.4,
		RollCentreHeightFront = 0.5,
		RollCentreHeightRear  = 0.43,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 50000,
		ModelFlags		= '220010',
		HandlingFlags   = "420000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
	CHandlingData {
		
		HandlingName = "DUNE",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 2.61,
		PercentSubmerged   = 102,
		CentreOfMassOffset = { 0,    0, -0.15 },
		InertiaMultiplier  = { 1, 1,    1 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.27,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 136,
		SteeringLock                   = 36.3,

		-- Brake
		BrakeForce     = 0.63,
		BrakeBiasFront = 0.4625,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.76,
		TractionCurveLateral	 = 22.5,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.05,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4755,
		TractionLossMult         = 0.47,

		-- Suspension
		SuspensionForce       = 3.7,
		SuspensionCompDamp    = 2.12,
		SuspensionReboundDamp = 1.05,
		SuspensionUpperLimit  = 0.2,
		SuspensionLowerLimit  = -0.2,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.47,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.65,
		RollCentreHeightFront = 0.08,
		RollCentreHeightRear  = 0.09,

		-- Damage
		CollisionDamageMult         = 1.1,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.6,
		PetrolTankVolume			= 45.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 50000,
		ModelFlags		= '110040',
		HandlingFlags   = "200000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.08,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "GUARDIAN",
		-- Physical
		Mass               = 4100,
		InitialDragCoeff   = 2.23,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.19, -0.215 },
		InertiaMultiplier  = { 1.03, 1.08,    1.24 },

		-- Transmission
		DriveBiasFront                 = 0.24,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.1961,
		DriveInertia                   = 0.6,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 141,
		SteeringLock                   = 36.4,

		-- Brake
		BrakeForce     = 0.162,
		BrakeBiasFront = 0.5624,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.74,
		TractionCurveLateral	 = 16.1,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4892,
		TractionLossMult         = 0.95,

		-- Suspension
		SuspensionForce       = 1.68,
		SuspensionCompDamp    = 1.8,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.39,
		SuspensionLowerLimit  = -0.18,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.54,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.4,
		RollCentreHeightFront = 0.75,
		RollCentreHeightRear  = 0.63,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 50000,
		ModelFlags		= '220010',
		HandlingFlags   = "420000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
	CHandlingData {
		
		HandlingName = "KALAHARI",
		-- Physical
		Mass               = 790,
		InitialDragCoeff   = 2.8,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.06, 0.01 },
		InertiaMultiplier  = { 0.9, 0.9,    1.26 },

		-- Transmission
		DriveBiasFront                 = 0.55,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.238,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 120,
		SteeringLock                   = 36.1,

		-- Brake
		BrakeForce     = 0.59,
		BrakeBiasFront = 0.5745,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 1.99,
		TractionCurveMin         = 1.7,
		TractionCurveLateral	 = 15.5,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.1,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.485,
		TractionLossMult         = 1.09,

		-- Suspension
		SuspensionForce       = 2.85,
		SuspensionCompDamp    = 2,
		SuspensionReboundDamp = 1.1,
		SuspensionUpperLimit  = 0.16,
		SuspensionLowerLimit  = -0.15,
		SuspensionRaise		  = 0.03,
		SuspensionBiasFront   = 0.53,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.95,
		RollCentreHeightFront = 0.32,
		RollCentreHeightRear  = 0.32,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 70.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 50000,
		ModelFlags		= '220010',
		HandlingFlags   = "100000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
	CHandlingData {
		
		HandlingName = "REBEL2",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.73,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.255, -0.05 },
		InertiaMultiplier  = { 0.83, 0.83,    0.88 },

		-- Transmission
		DriveBiasFront                 = 0.27,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.225,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 128,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.491,
		BrakeBiasFront = 0.6601,
		HandBrakeForce = 0.55,

		-- Traction
		TractionCurveMax         = 2.12,
		TractionCurveMin         = 1.85,
		TractionCurveLateral	 = 16.0,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.22,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4837,
		TractionLossMult         = 0.79,

		-- Suspension
		SuspensionForce       = 2.47,
		SuspensionCompDamp    = 2.26,
		SuspensionReboundDamp = 1.25,
		SuspensionUpperLimit  = 0.2,
		SuspensionLowerLimit  = -0.2,
		SuspensionRaise		  = 0.038,
		SuspensionBiasFront   = 0.57,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.25,
		RollCentreHeightRear  = 0.26,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 8.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 50000,
		ModelFlags		= '440010',
		HandlingFlags   = "82000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
	CHandlingData {
		
		HandlingName = "SANDKING",
		-- Physical
		Mass               = 3700,
		InitialDragCoeff   = 2.7,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.175, 0.072 },
		InertiaMultiplier  = { 0.45, 0.45,    0.58 },

		-- Transmission
		DriveBiasFront                 = 0.298,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.224,
		DriveInertia                   = 0.88,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 128,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.475,
		BrakeBiasFront = 0.5625,
		HandBrakeForce = 0.45,

		-- Traction
		TractionCurveMax         = 2.12,
		TractionCurveMin         = 1.89,
		TractionCurveLateral	 = 16.0,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.2,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4844,
		TractionLossMult         = 0.76,

		-- Suspension
		SuspensionForce       = 1.28,
		SuspensionCompDamp    = 2.12,
		SuspensionReboundDamp = 0.45,
		SuspensionUpperLimit  = 0.3,
		SuspensionLowerLimit  = -0.205,
		SuspensionRaise		  = -0.05,
		SuspensionBiasFront   = 0.575,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.5,
		RollCentreHeightRear  = 0.43,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 8.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 50000,
		ModelFlags		= '220010',
		HandlingFlags   = "420000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
	CHandlingData {
		
		HandlingName = "SADLER",
		-- Physical
		Mass               = 3400,
		InitialDragCoeff   = 2.73,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.32, -0.099 },
		InertiaMultiplier  = { 0.89, 0.91,    1.09 },

		-- Transmission
		DriveBiasFront                 = 0.445,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.2305,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 144,
		SteeringLock                   = 36,

		-- Brake
		BrakeForce     = 0.475,
		BrakeBiasFront = 0.5719,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 2.04,
		TractionCurveMin         = 1.72,
		TractionCurveLateral	 = 16.0,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.486,
		TractionLossMult         = 0.76,

		-- Suspension
		SuspensionForce       = 1.58,
		SuspensionCompDamp    = 2.0,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.175,
		SuspensionLowerLimit  = -0.197,
		SuspensionRaise		  = -0.018,
		SuspensionBiasFront   = 0.572,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.31,
		RollCentreHeightRear  = 0.31,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 70.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0.2,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
	CHandlingData {
		
		HandlingName = "TROPHYTRUCK",
		-- Physical
		Mass               = 1450,
		InitialDragCoeff   = 2.12,
		DownforceModifier  = 1.16,
		PercentSubmerged   = 83,
		CentreOfMassOffset = { 0,    -0.191, 0.02 },
		InertiaMultiplier  = { 1.13, 0.97,    1.61 },

		-- Transmission
		DriveBiasFront                 = 0.28,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.339,
		DriveInertia                   = 0.95,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 159,
		SteeringLock                   = 35.7,

		-- Brake
		BrakeForce     = 0.539,
		BrakeBiasFront = 0.4915,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.31,
		TractionCurveMin         = 1.081,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.144,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4911,
		TractionLossMult         = 0.25,

		-- Suspension
		SuspensionForce       = 2.78,
		SuspensionCompDamp    = 1.34,
		SuspensionReboundDamp = 0.82,
		SuspensionUpperLimit  = 0.226,
		SuspensionLowerLimit  = -0.181,
		SuspensionRaise		  = -0.13,
		SuspensionBiasFront   = 0.511,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.3,
		RollCentreHeightFront = 0.342,
		RollCentreHeightRear  = 0.341,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.25,
		SeatOffsetDistZ = -0.4,
		MonetaryValue   = 50000,
		ModelFlags		= '240010',
		HandlingFlags   = "800008",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "MESA3",
		-- Physical
		Mass               = 2100,
		InitialDragCoeff   = 1.4,
		PercentSubmerged   = 82,
		CentreOfMassOffset = { 0,    0.065, 0.01 },
		InertiaMultiplier  = { 1.15, 1,    1.51 },

		-- Transmission
		DriveBiasFront                 = 0.45,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.243,
		DriveInertia                   = 0.94,
		ClutchChangeRateScaleUpShift   = 1.35,
		ClutchChangeRateScaleDownShift = 1.4,
		InitialDriveMaxFlatVel         = 134,
		SteeringLock                   = 34.8,

		-- Brake
		BrakeForce     = 0.505,
		BrakeBiasFront = 0.5691,
		HandBrakeForce = 0.45,

		-- Traction
		TractionCurveMax         = 1.97,
		TractionCurveMin         = 1.77,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.132,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4831,
		TractionLossMult         = 0.65,

		-- Suspension
		SuspensionForce       = 1.91,
		SuspensionCompDamp    = 1.75,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.17,
		SuspensionLowerLimit  = -0.165,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.525,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.35,
		RollCentreHeightRear  = 0.35,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 50000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
}