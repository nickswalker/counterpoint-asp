% Species one violations
#const e_voice_crossing = "Voice crossing".
reason(e_voice_crossing).
#const e_voice_unison = "Voice unison".
reason(e_voice_unison).
#const e_static_motion = "Static motion".
reason(e_static_motion).
#const e_repeated_pitch ="Repeated pitch".
reason(e_repeated_pitch).
#const e_excessive_range = "Excessive range".
reason(e_excessive_range).
#const e_improper_cadence = "Improper cadence".
reason(e_improper_cadence).

#const e_too_many_leaps = "Too many leaps".
reason(e_too_many_leaps).

#const e_unresolved_seven = "Unresolved leading tone".
reason(e_unresolved_seven).

#const e_improper_harmonic_i2 = "Improper harmonic second".
reason(e_improper_harmonic_i2).
#const e_improper_harmonic_iP4 = "Improper harmonic perfect fourth".
reason(e_improper_harmonic_iP4).
#const e_improper_harmonic_i7 = "Improper harmonic seventh".
reason(e_improper_harmonic_i7).

% Usage assumptions
#const e_no_first_scale_degree = "No first scale degree".
reason(e_no_first_scale_degree).
#const e_cf_out_of_domain = "A note in the cantus firmus isn't in the domain".
reason(e_cf_out_of_domain).
#const e_cv_out_of_domain = "A note in the contrapuntal voice isn't in the domain".
reason(e_cv_out_of_domain).