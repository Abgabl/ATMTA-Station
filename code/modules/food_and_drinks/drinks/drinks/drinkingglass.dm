

/obj/item/weapon/reagent_containers/food/drinks/drinkingglass
	name = "glass"
	desc = "Your standard drinking glass."
	icon_state = "glass_empty"
	item_state = "drinking_glass"
	amount_per_transfer_from_this = 10
	volume = 50
	lefthand_file = 'icons/goonstation/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/goonstation/mob/inhands/items_righthand.dmi'
	materials = list(MAT_GLASS=500)
	burn_state = FLAMMABLE
	burntime = 5

	ex_act(severity)
		src.smash()

	proc/smash(var/turf/T)
		if (!T)
			T = src.loc
		src.reagents.reaction(T)
		if (ismob(T))
			T = get_turf(T)
		if (!T)
			qdel(src)
			return

		T.visible_message("<span style=\"color:red\">[src] shatters!</span>")
		playsound(T, pick("sound/effects/Glassbr1.ogg","sound/effects/Glassbr2.ogg","sound/effects/Glassbr3.ogg"), 100, 1)
		new /obj/item/weapon/shard(T)
		qdel(src)

	throw_impact(var/turf/T)
		..()
		src.smash(T)

/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/reagent_containers/food/snacks/egg)) //breaking eggs
		var/obj/item/weapon/reagent_containers/food/snacks/egg/E = I
		if(reagents)
			if(reagents.total_volume >= reagents.maximum_volume)
				to_chat(user, "<span class='notice'>[src] is full.</span>")
			else
				to_chat(user, "<span class='notice'>You break [E] in [src].</span>")
				E.reagents.trans_to(src, E.reagents.total_volume)
				qdel(E)
			return
	else
		..()

/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/fire_act()
	if(!reagents.total_volume)
		return
	..()

/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/burn()
	reagents.clear_reagents()
	extinguish()

/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/on_reagent_change()
	if(reagents.reagent_list.len)
		var/datum/reagent/R = reagents.get_master_reagent()
		icon_state = R.drink_icon
		name = R.drink_name
		desc = R.drink_desc
	else
		icon_state = "glass_empty"
		name = "glass"
		desc = "Your standard drinking glass."

// for /obj/machinery/vending/sovietsoda
/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/soda
	list_reagents = list("sodawater" = 50)


/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/cola
	list_reagents = list("cola" = 50)

/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/devilskiss
	list_reagents = list("devilskiss" = 50)