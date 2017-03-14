/*---------------------------------------------------------------------------
Spanish language file - Fichero de Idioma en Español (España)
---------------------------------------------------------------------------

This is the spanish language file. The things on the left side of the equals sign are the things you should leave alone
The parts between the quotes are the parts you should translate. You can also copy this file and create a new language.

Este es el fichero de idioma en español. Las cosas del lado izquierdo son las que debe dejar como estan.
Las partes que se encuentran entre comillas son las partes que debe traducir. También puede copiar este archivo y crear un nuevo lenguaje.

= Atención =
A veces cuando se actualiza DarkRP, nuevas frases son añadidas.
Si no traduce esas frases a su idioma, se usará por defecto las que son en Inglés.
Para corregir eso, entre en su servidor, abra su consola e introduzca "darkp_getphrases su_idioma" sin las comillas
Para el Ingles, use:
	darkrp_getphrases "en"
porque "en" es el codigo de idioma para Inglés.

Puede copiar las frases que faltan para este archivo y traducirlas.

= Nota =
Asegúrese de que el código de idioma se encuentra al final de este archivo.

= Usando un idioma =
Asegúrese de que la convar gmod_language esta ajustada en el codigo de idioma. Usted puede hacer eso en el fichero CFG del servidor.
---------------------------------------------------------------------------*/

local my_language = {
	-- Admin things
	need_admin = "Necesitas privilegios de Admin para poder usar %s",
	need_sadmin = "Necesitas privilegios de SuperAdmin para poder usar %s",
	no_privilege = "No tienes los privilegios adecuados para realizar esa accion",
	no_jail_pos = "No hay ubicaciones de Jail",
	invalid_x = "Invalido %s! %s",

	-- F1 menu
	f1ChatCommandTitle = "Comandos de chat",
	f1Search = "Buscar...",

	-- Money things:
	price = "Precio: %s%d",
	priceTag = "Precio: %s",
	reset_money = "%s ha reiniciado todo el dinero de los jugadores!",
	has_given = "%s te ha dado %s",
	you_gave = "Diste a %s %s",
	npc_killpay = "%s por matar a un NPC!",
	profit = "beneficio",
	loss = "perdida",

	-- backwards compatibility
	deducted_x = "Deducido %s%d",
	need_x = "Necesita %s%d",

	deducted_money = "Deducido %s",
	need_money = "Necesita %s",

	payday_message = "Dia de Paga! Has recibido %s!",
	payday_unemployed = "No has recibido salario porque no tienes empleo!",
	payday_missed = "Dia de paga perdido! (Estas arrestado)",

	property_tax = "Impuesto sobre la propiedad! %s",
	property_tax_cant_afford = "No has podido pagar los impuestos! Su propiedad ha sido desahuciada!",
	taxday = "Dia de Impuestos! %s%% de tus ingresos fueron para pagar impuestos!",

	found_cheque = "Has encontrado %s%s en un cheque para usted de %s.",
	cheque_details = "El cheque esta hecho para %s.",
	cheque_torn = "Usted ha roto el cheque.",
	cheque_pay = "Pagar: %s",
	signed = "Firmado: %s",

	found_cash = "Has encontrado %s%d!", -- backwards compatibility
	found_money = "Has encontrado %s!",

	owner_poor = "El propietario %s es demasiado pobre para Subvencionar esta venta!",

	-- Police
	Wanted_text = "Se Busca!",
	wanted = "Buscado por la policia!\nRazon: %s",
	youre_arrested = "Has sido arrestado durante %d segundos!",
	youre_arrested_by = "Has sido arrestado por %s.",
	youre_unarrested_by = "Has sido puesto en libertad por %s.",
	hes_arrested = "%s ha sido arrestado durante %d segundos!",
	hes_unarrested = "%s ha sido liberado de la carcel!",
	warrant_ordered = "%s ha ordenado una orden de registro contra %s. Razon: %s",
	warrant_request = "%s ha pedido una orden de registro contra %s\nRazon: %s",
	warrant_request2 = "Solicitud de Orden de Registro enviada al Presidente: %s!",
	warrant_approved = "Su orden de registro ha sido aprobada para %s!\nRazon: %s\nOrdenada por: %s",
	warrant_approved2 = "Ahora puedes buscar en la casa.",
	warrant_denied = "El Presidente %s ha denegado su orden de registro.",
	warrant_expired = "La orden de registro contra %s ha expirado!",
	warrant_required = "Necesita una Orden de Registro para poder abrir la puerta.",
	warrant_required_unfreeze = "Necesita una Orden de Registro para poder descongelar el prop.",
	warrant_required_unweld = "Necesita una Orden de Registro para poder Desoldar ese prop.",
	wanted_by_police = "%s esta buscado por la Policia!\nRazon: %s\nOrdenada por: %s",
	wanted_by_police_print = "%s ha hecho a %s Buscado por la Policia, Razon: %s",
	wanted_expired = "%s ya no esta buscado por la policia.",
	wanted_revoked = "%s ya no esta buscado por la policia.\nRevocada por: %s",
	cant_arrest_other_cp = "No puede arrestar a otros policias!",
	must_be_wanted_for_arrest = "El jugador debe estar buscado por la policia para poder arrestarlo.",
	cant_arrest_fadmin_jailed = "No puede arrestar al jugador que esta encarcelado por un Admin.",
	cant_arrest_no_jail_pos = "No puede arrestar gente porque no hay posiciones de carcel!!",
	cant_arrest_spawning_players = "No puede arrestar gente que esta reapareciendo.",

	suspect_doesnt_exist = "El Sospechoso no existe.",
	actor_doesnt_exist = "El Actor no existe.",
	get_a_warrant = "conseguir una orden",
	make_someone_wanted = "poner a alguien el busca y captura",
	remove_wanted_status = "eliminar el estado de busca y captura",
	already_a_warrant = "Ya existe una orden de registro para este sospechoso.",
	already_wanted = "El sospechoso ya esta en busca y captura.",
	not_wanted = "El sospechoso no esta en busca y captura.",
	need_to_be_cp = "Debes de ser miembro de las fuerzas de seguridad y orden publico.",
	suspect_must_be_alive_to_do_x = "El sospechoso debe de estar vivo para poder %s.",
	suspect_already_arrested = "El sospechoso ya esta encarcelado.",

	-- Players
	health = "Salud: %s",
	job = "Trabajo: %s",
	salary = "Salario: %s%s",
	wallet = "Cartera: %s%s",
	weapon = "Arma: %s",
	kills = "Asesinatos: %s",
	deaths = "Muertes: %s",
	rpname_changed = "%s ha cambiado su Nombre Roleplay a: %s",
	disconnected_player = "Jugador desconectado",

	-- Teams
	need_to_be_before = "Necesitas ser primero %s para poder convertirte en %s",
	need_to_make_vote = "Necesitas hacer una votacion para ser: %s",
	team_limit_reached = "No puedes convertirte en %s porque el limite se ha superado",
	wants_to_be = "%s\nquiere ser...\n%s",
	has_not_been_made_team = "%s no se ha podido hacer %s!",
	job_has_become = "%s se ha cambiado a %s!",

	-- Disasters
	meteor_approaching = "ADVERTENCIA: Se aproxima una tormenta de Meteoros! (WTF!!)",
	meteor_passing = "La tormenta de meteoros ha pasado.",
	meteor_enabled = "Tormenta de Meteoros Habilitada.",
	meteor_disabled = "Tormenta de Meteoros Deshabilitada.",
	earthquake_report = "Se informa de Terremoto de Magnitud: %sMw",
	earthtremor_report = "Se informa de Temblores de Tierra de Magnitud: %sMw",

	-- Keys, vehicles and doors
	keys_allowed_to_coown = "Se le permite ser Co-Propietario\n(Pulse su tecla Recargar o Pulse F2 para ser Co-Propietario)\n",
	keys_other_allowed = "Permitido ser Co-Propietario:",
	keys_allow_ownership = "(Pulse la tecla Recargar o F2 para permitir la propiedad)",
	keys_disallow_ownership = "(Pulse la tecla Recargar o F2 para denegar la propiedad)",
	keys_owned_by = "Propiedad de:",
	keys_unowned = "Sin Propietario\n(Pulse su tecla RECARGAR o pulse F2 para comprar)",
	keys_everyone = "(Pulse su tecla RECARGAR o pulse F2 para permitir a todo el mundo)",
	door_unown_arrested = "Usted no puede comprar o vender cosas mientras esta arrestado!",
	door_unownable = "Esta puerta no se puede comprar ni vender!",
	door_sold = "Ha vendido esta puerta por: %s",
	door_already_owned = "Esta ya es la propiedad de alguien!",
	door_cannot_afford = "No puedes permitirte esta propiedad!",
	door_hobo_unable = "No puedes comprarte una propiedad mientras eres Vagabundo!",
	vehicle_cannot_afford = "No puedes permitirte este vehiculo!",
	door_bought = "Usted ha comprado esta propiedad por %s%s",
	vehicle_bought = "Usted ha comprado este vehiculo por %s%s",
	door_need_to_own = "Usted necesita ser propietario de la puerta para poder %s",
	door_rem_owners_unownable = "Usted no puede eliminar dueños si usted no es el propietario!",
	door_add_owners_unownable = "Usted no puede añadir dueños si usted no es el propietario!",
	rp_addowner_already_owns_door = "%s ya posee (o se le permite ser propietario) esta puerta!",
	add_owner = "Añadir Propietario",
	remove_owner = "Eliminar Propietario",
	coown_x = "Co-Propietario %s",
	allow_ownership = "Permitir Propiedad",
	disallow_ownership = "No Permitir Propiedad",
	edit_door_group = "Editar Grupo de la Propiedad",
	door_groups = "Grupos de Propiedades",
	door_group_doesnt_exist = "El grupo no existe!",
	door_group_set = "El grupo ha sido establecido correctamente en la propiedad.",
	sold_x_doors_for_y = "Has vendido %d propiedades por %s%d!", -- backwards compatibility
	sold_x_doors = "Has vendido %d propiedades por %s!",

	-- Entities
	drugs = "Drogas",
	drug_lab = "Laboratorio de Drogas",
	gun_lab = "Laboratorio de Armas",
	gun = "Arma",
	microwave = "Microhondas",
	food = "Comida",
	money_printer = "Impresora de Dinero",

	sign_this_letter = "Firmar esta carta",
	signed_yours = "Tuyo,",

	money_printer_exploded = "Su Impresora de Dinero ha explotado!!",
	money_printer_overheating = "Su Impresora de Dinero se ha sobrecalentado!!",

	contents = "Contenido: ",
	amount = "Cantidad: ",

	picking_lock = "Picking lock",

	cannot_pocket_x = "No puedes guardar esto en tu bolsillo!",
	object_too_heavy = "Ese objeto es demasiado pesado.",
	pocket_full = "Tu bolsillo esta lleno!",
	pocket_no_items = "Tu bolsillo esta vacio.",
	drop_item = "Soltar objeto",

	bonus_destroying_entity = "destruyendo esta entidad ilegal.",

	switched_burst = "Switched to burst-fire mode.",
	switched_fully_auto = "Cambiado a modo disparo automatico.",
	switched_semi_auto = "Cambiado a modo disparo semi-automatico.",

	keypad_checker_shoot_keypad = "Dispara a un teclado para ver que controla.",
	keypad_checker_shoot_entity = "Dispara a una entidad para ver que teclado esta conectado a el",
	keypad_checker_click_to_clear = "Click Derecho para eliminar.",
	keypad_checker_entering_right_pass = "Introduciendo la contraseña correcta",
	keypad_checker_entering_wrong_pass = "Introduciendo contraseña incorrecta",
	keypad_checker_after_right_pass = "despues de haber introducido la contraseña correcta",
	keypad_checker_after_wrong_pass = "despues de haber introducido la contraseña incorrecta",
	keypad_checker_right_pass_entered = "Introducida Contraseña Correcta",
	keypad_checker_wrong_pass_entered = "Introducida Contraseña Incorrecta",
	keypad_checker_controls_x_entities = "Este teclado controla %d entidades",
	keypad_checker_controlled_by_x_keypads = "Esta entidad esta controlada por %d teclado(s)",
	keypad_on = "ON",
	keypad_off = "OFF",
	seconds = "segundos",

	persons_weapons = "Armas Ilegales de %s:",
	returned_persons_weapons = "Devueltas las armas confiscadas a %s.",
	no_weapons_confiscated = "%s no tiene armas confiscadas!",
	no_illegal_weapons = "%s no tienes armas ilegales.",
	confiscated_these_weapons = "Confiscadas las siguientes armas:",
	checking_weapons = "Comprobando Armas",

	shipment_antispam_wait = "Por favor, espere antes de reaparecer otro envio.",

	-- Talking
	hear_noone = "Nadie puede escucharte %s!",
	hear_everyone = "Todos te escuchan!",
	hear_certain_persons = "Jugadores que pueden escucharte %s: ",

	whisper = "susurro",
	yell = "gritar",
	advert = "[Aviso]",
	broadcast = "[Difusion!]",
	radio = "radio",
	request = "(SOLICITUD!)",
	group = "(grupo)",
	demote = "(DEGRADAR)",
	ooc = "OOC",
	radio_x = "Radio %d",

	talk = "charlar",
	speak = "hablar",

	speak_in_ooc = "hablar en OOC",
	perform_your_action = "realizar accion",
	talk_to_your_group = "hablar con tu grupo",

	channel_set_to_x = "Canal ajustado a %s!",

	-- Notifies
	disabled = "%s ha sido desactivado! %s",
	gm_spawnvehicle = "El reaparecimiento de Vehiculos",
	gm_spawnsent = "El reaparecimiento de entidades con script (SENTs)",
	gm_spawnnpc = "El reaparecimiento de Personajes No-Jugadores (NPCs)",
	see_settings = "Por favor, mire la configuracion del TrollRP.",
	limit = "Has superado el limite de %s!",
	have_to_wait = "Debes esperar otros %d segundos antes de usar %s!",
	must_be_looking_at = "Tienes que estar mirando a %s!",
	incorrect_job = "Usted no tiene el trabajo adecuado para %s",
	unavailable = "Este %s no esta disponible",
	unable = "Usted es incapaz de %s. %s",
	cant_afford = "Usted no puede permitirse %s",
	created_x = "%s ha creado %s",
	cleaned_up = "Tu %s ha sido limpiado.",
	you_bought_x = "Has comprado %s por %s%d.", -- backwards compatibility
	you_bought = "Has comprado %s por %s.",
	you_received_x = "Has recibido %s por %s.",

	created_first_jailpos = "Has creado la primera posicion de Jail!",
	added_jailpos = "Ha agregado una posicion de carcel adicional!",
	reset_add_jailpos = "Has quitado toda las posiciones de Carcel y has añadido una nueva aqui.",
	created_spawnpos = "%s's spawn position created.",
	updated_spawnpos = "%s's spawn position updated.",
	do_not_own_ent = "No puedes ser propietario de esta entidad!",
	cannot_drop_weapon = "No puedes soltar esta arma!",
	job_switch = "Trabajos cambiados con exito!",
	job_switch_question = "Cambiar trabajos con %s?",
	job_switch_requested = "Solicitado cambio de Trabajo.",

	cooks_only = "Solo cocineros.",

	-- Misc
	unknown = "Desconocido",
	arguments = "argumentos",
	no_one = "ninguno",
	door = "puerta",
	vehicle = "vehiculo",
	door_or_vehicle = "puerta/vehiculo",
	driver = "Conductor: %s",
	name = "Nombre: %s",
	locked = "Bloqueado.",
	unlocked = "Desbloqueado.",
	player_doesnt_exist = "El jugador no existe.",
	job_doesnt_exist = "El trabajo no existe!",
	must_be_alive_to_do_x = "Usted debe estar vivo para poder %s.",
	banned_or_demoted = "Baneado/Degradado",
	wait_with_that = "Espere con ese.",
	could_not_find = "No se ha podido encontrar %s",
	f3tovote = "Pulse F3 para Votar",
	listen_up = "Escuchen:", -- In rp_tell or rp_tellall
	nlr = "Nueva regla de la Vida: No venganza al Ser Arrestado/Asesinado.",
	reset_settings = "Has reiniciado todos los ajustes!",
	must_be_x = "Debes ser %s para poder %s.",
	agenda_updated = "El Orden del Dia ha sido actualizado",
	job_set = "%s ha ajustado su trabajo a '%s'",
	demoted = "%s ha sido degradado",
	demoted_not = "%s NO ha sido degradado",
	demote_vote_started = "%s ha iniciado una votacion para degradar a %s",
	demote_vote_text = "Nominado ser Degradado:\n%s", -- '%s' is the reason here
	cant_demote_self = "No puedes degradarte a ti mismo.",
	i_want_to_demote_you = "Quiero degradarte a ti. Razon: %s",
	tried_to_avoid_demotion = "Has intentado burlar la degradacion. Has fallado y has sido degradado.", -- naughty boy!
	lockdown_started = "El Presidente ha iniciado el Toque de Queda, por favor, vuelvan a sus casas!",
	lockdown_ended = "Toque de queda FINALIZADO",
	gunlicense_requested = "%s ha solicitado una licencia de armas: %s",
	gunlicense_granted = "%s le ha autorizado una licencia de armas: %s",
	gunlicense_denied = "%s ha denegado la licencia de armas: %s",
	gunlicense_question_text = "Autorizar a %s una licencia de armas?",
	gunlicense_remove_vote_text = "%s ha iniciado una votacion para revocar la licencia de armas de %s",
	gunlicense_remove_vote_text2 = "Revocar licencia de Armas:\n%s", -- Where %s is the reason
	gunlicense_removed = "Licencia de Armas de: %s Eliminada!!",
	gunlicense_not_removed = "La Licencia de Armas de %s no ha sido eliminada!",
	vote_specify_reason = "Debes de especificar una razon!",
	vote_started = "La votacion esta creada",
	vote_alone = "Has ganado el voto porque estas solo en el servidor.",
	you_cannot_vote = "No puedes votar!",
	x_cancelled_vote = "%s ha cancelado la votacion.",
	cant_cancel_vote = "No puedes cancelar la ultima votacion, porque no hay ninguna!",
	jail_punishment = "Penalizacion por desconectarse! Enjaulado durante: %d segundos.",
	admin_only = "Solo Admins!!", -- When doing /addjailpos
	chief_or = "Jefe o ",-- When doing /addjailpos
	frozen = "Congelado.",

	dead_in_jail = "Estas muerto hasta que finalice tu tiempo en la carcel!",
	died_in_jail = "%s ha muerto en la carcel!",

	credits_for = "Creditos por %s\n",
	credits_see_console = "Los creditos se han imprimido en la consola.",

	rp_getvehicles = "Vehiculos disponibles:",

	data_not_loaded_one = "Sus datos no han cargado todavia. Por favor, espere.",
	data_not_loaded_two = "Si el problema persiste, intentelo de nuevo o contacte con un administrador.",

	cant_spawn_weapons = "No puede generar Armas.",
	drive_disabled = "Conduccion des-habilitada por ahora.",
	property_disabled = "Propiedad des-habilitada por ahora.",

	not_allowed_to_purchase = "No puede comprar este articulo.",

	rp_teamban_hint = "rp_teamban [nombre jugador/ID] [profesion/id]. Utilice esta opcion para prohibirle a un jugador una profesion.",
	rp_teamunban_hint = "rp_teamunban [nombre jugador/ID] [profesion/id]. Utilice esta opcion para quitar la prohibicion de un jugador una profesion.",
	x_teambanned_y = "%s ha prohibido a %s ser %s.",
	x_teamunbanned_y = "%s le ha quitado la prohibicion a %s para ser %s.",

	-- Backwards compatibility:
	you_set_x_salary_to_y = "Has ajustado el salario de %s a %s%d.",
	x_set_your_salary_to_y = "%s ha ajustado tu salario a %s%d.",
	you_set_x_money_to_y = "Has ajustado el salario de %s a %s%d.",
	x_set_your_money_to_y = "%s ha ajustado tu salario a %s%d.",

	you_set_x_salary = "Has ajustado el salario de %s a %s.",
	x_set_your_salary = "%s ajusto tu salario a %s.",
	you_set_x_money = "Has ajustado el dinero de %s a %s.",
	x_set_your_money = "%s ajusto tu dinero a %s.",
	you_set_x_name = "Has ajustado el nombre de %s a %s",
	x_set_your_name = "%s te ha cambiado el nombre a %s",

	someone_stole_steam_name = "Alguien esta usando ya tu nombre en Steam y tu Nombre en RP asi que se ha puesto un '1' despues de tu nombre.", -- Uh oh
	already_taken = "Ya esta cogido!",

	job_doesnt_require_vote_currently = "Este trabajo no requiere votacion por el momento!",

	x_made_you_a_y = "%s te ha hecho %s!",

	cmd_cant_be_run_server_console = "Este comando no puede ser ejecutado desde la consola.",

	-- The lottery
	lottery_started = "Esta es la Loteria! Participar por %s%d?", -- backwards compatibility
	lottery_has_started = "Esta es la Loteria! Participar por %s?",
	lottery_entered = "Has participado en la loteria por %s",
	lottery_not_entered = "%s no ha participado en la loteria",
	lottery_noone_entered = "Nadie ha participado en la loteria",
	lottery_won = "%s ha ganado la loteria! Ha ganado %s",

	-- Animations
	custom_animation = "Animaciones Personalizadas!",
	bow = "Reverencia",
	dance = "Bailar",
	follow_me = "Sigueme!",
	laugh = "Reirse",
	lion_pose = "Postura de Leon",
	nonverbal_no = "No",
	thumbs_up = "Pulgares hacia Arriba",
	wave = "Ola",

	-- Hungermod
	starving = "Hambriento!",

	-- AFK
	afk_mode = "Modo AFK",
	salary_frozen = "Su salario se ha congelado.",
	salary_restored = "Bienvenido de nuevo, su salario ha sido restablecido.",
	no_auto_demote = "Usted no sera automaticamente degradado.",
	youre_afk_demoted = "Sera Degradado por estar AFK demasiado tiempo. Si va a estar AFK, la proxima vez escriba: /afk.",
	hes_afk_demoted = "%s ha sido degradado por estar AFK Demasiado tiempo.",
	afk_cmd_to_exit = "Escribe /afk de nuevo para salir del Modo AFK.",
	player_now_afk = "%s esta ahora AFK.",
	player_no_longer_afk = "%s ya no esta AFK.",

	-- Hitmenu
	hit = "Trabajo",
	hitman = "Sicario",
	current_hit = "Trabajo: %s",
	cannot_request_hit = "No puedes solicitar un trabajito! %s",
	hitmenu_request = "Solicitud",
	player_not_hitman = "Ese jugador no es un Sicario!",
	distance_too_big = "Distancia demasiado grande.",
	hitman_no_suicide = "El sicario no puede matarse a si mismo.",
	hitman_no_self_order = "El sicario no puede Solicitar un trabajo de Asesinato.",
	hitman_already_has_hit = "El Sicario ya tiene un trabajo en curso.",
	price_too_low = "Precio demasiado bajo!",
	hit_target_recently_killed_by_hit = "El Objetivo fue asesinado recientemente por un sicario,",
	customer_recently_bought_hit = "El Cliente ya ha solicitado un trabajo recientemente.",
	accept_hit_question = "Aceptar Asesinato de %s\nCon respecto a %s por %s%d?", -- backwards compatibility
	accept_hit_request = "Aceptar Asesinato de %s\nCon respecto a %s por %s?",
	hit_requested = "Asesinato solicitado!",
	hit_aborted = "Asesinato Abortado! %s",
	hit_accepted = "Asesinato aceptado!",
	hit_declined = "El Sicario ha rechazado el trabajo!",
	hitman_left_server = "El Sicario se ha desconectado del servidor!",
	customer_left_server = "El Cliente se ha desconectado del servidor!",
	target_left_server = "El objetivo ha abandonado el servidor!",
	hit_price_set_to_x = "Precio de Asesinato ajustado a %s%d.", -- backwards compatibility
	hit_price_set = "Precio de Asesinato ajustado a %s.",
	hit_complete = "Asesinato de %s completado!",
	hitman_died = "El Sicario ha muerto!",
	target_died = "El objetivo ha muerto!!",
	hitman_arrested = "El sicario ha sido arrestado!",
	hitman_changed_team = "El Sicario cambio su profesion!",
	x_had_hit_ordered_by_y = "%s tiene una orden activa de %s",

	-- Vote Restrictions
	hobos_no_rights = "Los Mendigos no pueden votar!",
	gangsters_cant_vote_for_government = "Los Gangsters no puede votar a los líderes del Gobierno!",
	government_cant_vote_for_gangsters = "Los miembros del gobierno no pueden votar los Jefes de la Mafia o Bandas!",

	-- VGUI and some more doors/vehicles
	vote = "Votar",
	time = "Tiempo: %d",
	yes = "Si",
	no = "No",
	ok = "Okey",
	cancel = "Cancelar",
	add = "Añadir",
	remove = "Eliminar",
	none = "Nada",

	x_options = "%s opciones",
	sell_x = "Vender %s",
	set_x_title = "Ajustar Nombre de %s",
	set_x_title_long = "Ajusta el nombre de %s a la que estas mirando.",
	jobs = "Trabajos",
	buy_x = "Comprar %s",

	-- F4menu
	no_extra_weapons = "Este trabajo no tiene Armas.",
	become_job = "Convertir Empleo",
	create_vote_for_job = "Crear votacion",
	shipments = "Mercancia",
	F4guns = "Armas",
	F4entities = "Miscelaneo",
	F4ammo = "Municion",
	F4vehicles = "Vehiculos",

	-- Tab 1
	give_money = "Dar dinero al jugador que estas mirando",
	drop_money = "Soltar la pasta",
	change_name = "Cambiar tu nombre en Roleplay",
	go_to_sleep = "Ir a dormir/despertar",
	drop_weapon = "Soltar arma actual",
	buy_health = "Comprar Vida(%s)",
	request_gunlicense = "Pedir Licencia de Armas",
	demote_player_menu = "Degradar a un Jugador (Demote)",


	searchwarrantbutton = "Hacer buscado un jugador",
	unwarrantbutton = "Eliminar el estado de Buscado de un jugador",
	noone_available = "Nadie disponible",
	request_warrant = "Solicitar una Orden de registro para un Jugador",
	make_wanted = "Añadir a alguien a Los Mas buscados",
	make_unwanted = "Quitar alguien de los Mas Buscados",
	set_jailpos = "Ajustar la posicion de Jail",
	add_jailpos = "Añadir posicion de Jail",

	set_custom_job = "Establecer un trabajo personalizado (pulsa INTRO para activar)",

	set_agenda = "Establecer el Orden del dia (pulsa INTRO para activar)",

	initiate_lockdown = "Iniciar Toque de Queda",
	stop_lockdown = "Parar el Toque de Queda",
	start_lottery = "Iniciar la Loteria",
	give_license_lookingat = "Dar <lookingat> una licencia de armas",

	laws_of_the_land = "LEYES DE LA CIUDAD",
	law_added = "Ley añadida.",
	law_removed = "Ley Eliminada.",
	law_reset = "Leyes reiniciadas.",
	law_too_short = "Ley muy corta.",
	laws_full = "Las leyes estan completas.",
	default_law_change_denied = "No tienes permitido cambiar las leyes por defecto.",

	-- Second tab
	job_name = "Nombre: ",
	job_description = "Descripcion: ",
	job_weapons = "Armas: ",

	-- Entities tab
	buy_a = "Comprar %s: %s",

	-- Licenseweaponstab
	license_tab = [[Licencia de Armas

	Tick the weapons people should be able to get WITHOUT a license!
	]],
	license_tab_other_weapons = "Otras Armas:",
	zombie_spawn_removed = "Has eliminado el punto de aparición de zombies.",
	zombie_spawn = "Punto de Aparición de Zombies",
	zombie_disabled = "Los Zombies estan ahora desactivados.",
	zombie_enabled = "Los Zombies estan ahora activados.",
	zombie_maxset = "La cantidad maxima de zombies es ahora %s",
	zombie_spawn_added = "Has añadido un punto de aparición de zombies.",
	zombie_spawn_not_exist = "Zombie Spawn %s does not exist.",
	zombie_leaving = "Los zombies se están abandonando el lugar.",
	zombie_approaching = "ADVERTENCIA: Loz zombies se aproximan!",
	zombie_toggled = "Zombies toggled.",
}

-- El código de idioma es normalmente (aunque no siempre) un código de dos letras. El idioma predeterminado es "en" (Inglés).
-- Otros ejemplos son "nl" (Holandés), "de" (Alemán), "es-ES" (Español de España)
-- Si quieres saber cual es el código de su idioma, abra GMOD, seleccione su idioma en el botón de abajo a la derecha
-- luego escriba gmod_language en la consola. Y ahí podrá ver el código.
-- Asegúrese de que el código de idioma es una entrada válida en la convar gmod_language.
-- gmod_language "es-ES"  en el server.cfg
DarkRP.addLanguage("es-ES", my_language)
