; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"logistic"(i64 %r, i64 %x) nounwind {
entry:
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t9 = load i64, ptr %local.r
  %t10 = load i64, ptr %local.x
  %t11 = call i64 @"sx_f64_mul"(i64 %t9, i64 %t10)
  %t12 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.2)
  %t13 = load i64, ptr %local.x
  %t14 = call i64 @"sx_f64_sub"(i64 %t12, i64 %t13)
  %t15 = call i64 @"sx_f64_mul"(i64 %t11, i64 %t14)
  ret i64 %t15
}

define i64 @"logistic_deriv"(i64 %r, i64 %x) nounwind {
entry:
  %local.r = alloca i64
  store i64 %r, ptr %local.r
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t16 = load i64, ptr %local.r
  %t17 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.3)
  %t18 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.4)
  %t19 = load i64, ptr %local.x
  %t20 = call i64 @"sx_f64_mul"(i64 %t18, i64 %t19)
  %t21 = call i64 @"sx_f64_sub"(i64 %t17, i64 %t20)
  %t22 = call i64 @"sx_f64_mul"(i64 %t16, i64 %t21)
  ret i64 %t22
}

define i64 @"run_exp1"() nounwind {
entry:
  %local.ri.23 = alloca i64
  %local.r.24 = alloca i64
  %local.x.25 = alloca i64
  %local.prev_x.26 = alloca i64
  %local.step.27 = alloca i64
  %local.drift_sum.28 = alloca i64
  %local.drift_avg.29 = alloca i64
  %local.v_num.30 = alloca i64
  %local.v_den.31 = alloca i64
  %local.v_ratio.32 = alloca i64
  %local.early_drift.33 = alloca i64
  %local.late_drift.34 = alloca i64
  %local.score.35 = alloca i64
  %local.diff.36 = alloca i64
  %t37 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.5)
  %t38 = ptrtoint ptr %t37 to i64
  %t39 = inttoptr i64 %t38 to ptr
  call void @intrinsic_println(ptr %t39)
  %t40 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.6)
  %t41 = ptrtoint ptr %t40 to i64
  %t42 = inttoptr i64 %t41 to ptr
  call void @intrinsic_println(ptr %t42)
  %t43 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.7)
  %t44 = ptrtoint ptr %t43 to i64
  %t45 = inttoptr i64 %t44 to ptr
  call void @intrinsic_println(ptr %t45)
  %t46 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.8)
  %t47 = ptrtoint ptr %t46 to i64
  %t48 = inttoptr i64 %t47 to ptr
  call void @intrinsic_println(ptr %t48)
  %t49 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.9)
  %t50 = ptrtoint ptr %t49 to i64
  %t51 = inttoptr i64 %t50 to ptr
  call void @intrinsic_println(ptr %t51)
  %t52 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.10)
  %t53 = ptrtoint ptr %t52 to i64
  %t54 = inttoptr i64 %t53 to ptr
  call void @intrinsic_println(ptr %t54)
  %t55 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.11)
  %t56 = ptrtoint ptr %t55 to i64
  %t57 = inttoptr i64 %t56 to ptr
  call void @intrinsic_println(ptr %t57)
  %t58 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.12)
  %t59 = ptrtoint ptr %t58 to i64
  %t60 = inttoptr i64 %t59 to ptr
  call void @intrinsic_println(ptr %t60)
  %t61 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.13)
  %t62 = ptrtoint ptr %t61 to i64
  %t63 = inttoptr i64 %t62 to ptr
  call void @intrinsic_println(ptr %t63)
  %t64 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.14)
  %t65 = ptrtoint ptr %t64 to i64
  %t66 = inttoptr i64 %t65 to ptr
  call void @intrinsic_println(ptr %t66)
  store i64 0, ptr %local.ri.23
  %t67 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.15)
  store i64 %t67, ptr %local.r.24
  %t68 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.16)
  store i64 %t68, ptr %local.x.25
  %t69 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.17)
  store i64 %t69, ptr %local.prev_x.26
  store i64 0, ptr %local.step.27
  %t70 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.18)
  store i64 %t70, ptr %local.drift_sum.28
  %t71 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.19)
  store i64 %t71, ptr %local.drift_avg.29
  %t72 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.20)
  store i64 %t72, ptr %local.v_num.30
  %t73 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.21)
  store i64 %t73, ptr %local.v_den.31
  %t74 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.22)
  store i64 %t74, ptr %local.v_ratio.32
  %t75 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.23)
  store i64 %t75, ptr %local.early_drift.33
  %t76 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.24)
  store i64 %t76, ptr %local.late_drift.34
  %t77 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.25)
  store i64 %t77, ptr %local.score.35
  %t78 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.26)
  store i64 %t78, ptr %local.diff.36
  br label %loop1
loop1:
  %t79 = load i64, ptr %local.ri.23
  %t80 = icmp sle i64 %t79, 30
  %t81 = zext i1 %t80 to i64
  %t82 = icmp ne i64 %t81, 0
  br i1 %t82, label %body1, label %endloop1
body1:
  %t83 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.27)
  %t84 = load i64, ptr %local.ri.23
  %t85 = call i64 @"sx_int_to_f64"(i64 %t84)
  %t86 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.28)
  %t87 = call i64 @"sx_f64_mul"(i64 %t85, i64 %t86)
  %t88 = call i64 @"sx_f64_add"(i64 %t83, i64 %t87)
  store i64 %t88, ptr %local.r.24
  %t89 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.29)
  store i64 %t89, ptr %local.x.25
  %t90 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.30)
  store i64 %t90, ptr %local.prev_x.26
  %t91 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.31)
  store i64 %t91, ptr %local.drift_sum.28
  %t92 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.32)
  store i64 %t92, ptr %local.v_num.30
  %t93 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.33)
  store i64 %t93, ptr %local.v_den.31
  %t94 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.34)
  store i64 %t94, ptr %local.early_drift.33
  %t95 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.35)
  store i64 %t95, ptr %local.late_drift.34
  store i64 0, ptr %local.step.27
  br label %loop2
loop2:
  %t96 = load i64, ptr %local.step.27
  %t97 = icmp slt i64 %t96, 1000
  %t98 = zext i1 %t97 to i64
  %t99 = icmp ne i64 %t98, 0
  br i1 %t99, label %body2, label %endloop2
body2:
  %t100 = load i64, ptr %local.x.25
  store i64 %t100, ptr %local.prev_x.26
  %t101 = load i64, ptr %local.r.24
  %t102 = load i64, ptr %local.x.25
  %t103 = call i64 @"logistic"(i64 %t101, i64 %t102)
  store i64 %t103, ptr %local.x.25
  %t104 = load i64, ptr %local.x.25
  %t105 = load i64, ptr %local.prev_x.26
  %t106 = call i64 @"sx_f64_sub"(i64 %t104, i64 %t105)
  %t107 = call i64 @"abs_f64"(i64 %t106)
  store i64 %t107, ptr %local.diff.36
  %t108 = load i64, ptr %local.step.27
  %t109 = icmp eq i64 %t108, 0
  %t110 = zext i1 %t109 to i64
  %t111 = icmp ne i64 %t110, 0
  br i1 %t111, label %then3, label %else3
then3:
  %t112 = load i64, ptr %local.diff.36
  %t113 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.36)
  %t114 = call i64 @"sx_f64_add"(i64 %t112, i64 %t113)
  store i64 %t114, ptr %local.v_den.31
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t115 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t116 = load i64, ptr %local.v_num.30
  %t117 = load i64, ptr %local.diff.36
  %t118 = call i64 @"sx_f64_add"(i64 %t116, i64 %t117)
  store i64 %t118, ptr %local.v_num.30
  %t119 = load i64, ptr %local.step.27
  %t120 = icmp sge i64 %t119, 500
  %t121 = zext i1 %t120 to i64
  %t122 = icmp ne i64 %t121, 0
  br i1 %t122, label %then4, label %else4
then4:
  %t123 = load i64, ptr %local.drift_sum.28
  %t124 = load i64, ptr %local.diff.36
  %t125 = call i64 @"sx_f64_add"(i64 %t123, i64 %t124)
  store i64 %t125, ptr %local.drift_sum.28
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t126 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t127 = load i64, ptr %local.step.27
  %t128 = icmp sge i64 %t127, 100
  %t129 = zext i1 %t128 to i64
  %t130 = icmp ne i64 %t129, 0
  br i1 %t130, label %then5, label %else5
then5:
  %t131 = load i64, ptr %local.step.27
  %t132 = icmp slt i64 %t131, 200
  %t133 = zext i1 %t132 to i64
  %t134 = icmp ne i64 %t133, 0
  br i1 %t134, label %then6, label %else6
then6:
  %t135 = load i64, ptr %local.early_drift.33
  %t136 = load i64, ptr %local.diff.36
  %t137 = call i64 @"sx_f64_add"(i64 %t135, i64 %t136)
  store i64 %t137, ptr %local.early_drift.33
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t138 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t139 = phi i64 [ %t138, %then5_end ], [ 0, %else5_end ]
  %t140 = load i64, ptr %local.step.27
  %t141 = icmp sge i64 %t140, 900
  %t142 = zext i1 %t141 to i64
  %t143 = icmp ne i64 %t142, 0
  br i1 %t143, label %then7, label %else7
then7:
  %t144 = load i64, ptr %local.late_drift.34
  %t145 = load i64, ptr %local.diff.36
  %t146 = call i64 @"sx_f64_add"(i64 %t144, i64 %t145)
  store i64 %t146, ptr %local.late_drift.34
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t147 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t148 = load i64, ptr %local.step.27
  %t149 = add i64 %t148, 1
  store i64 %t149, ptr %local.step.27
  br label %loop2
endloop2:
  %t150 = load i64, ptr %local.drift_sum.28
  %t151 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.37)
  %t152 = call i64 @"sx_f64_div"(i64 %t150, i64 %t151)
  store i64 %t152, ptr %local.drift_avg.29
  %t153 = load i64, ptr %local.v_num.30
  %t154 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.38)
  %t155 = load i64, ptr %local.v_den.31
  %t156 = call i64 @"sx_f64_mul"(i64 %t154, i64 %t155)
  %t157 = call i64 @"sx_f64_div"(i64 %t153, i64 %t156)
  store i64 %t157, ptr %local.v_ratio.32
  %t158 = load i64, ptr %local.early_drift.33
  %t159 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.39)
  %t160 = call i64 @"sx_f64_gt"(i64 %t158, i64 %t159)
  %t161 = icmp ne i64 %t160, 0
  br i1 %t161, label %then8, label %else8
then8:
  %t162 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.40)
  %t163 = load i64, ptr %local.late_drift.34
  %t164 = load i64, ptr %local.early_drift.33
  %t165 = call i64 @"sx_f64_div"(i64 %t163, i64 %t164)
  %t166 = call i64 @"sx_f64_sub"(i64 %t162, i64 %t165)
  store i64 %t166, ptr %local.score.35
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t167 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.41)
  store i64 %t167, ptr %local.score.35
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t168 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t169 = load i64, ptr %local.score.35
  %t170 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.42)
  %t171 = call i64 @"sx_f64_gt"(i64 %t169, i64 %t170)
  %t172 = icmp ne i64 %t171, 0
  br i1 %t172, label %then9, label %else9
then9:
  %t173 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.43)
  store i64 %t173, ptr %local.score.35
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t174 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t175 = load i64, ptr %local.score.35
  %t176 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.44)
  %t177 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.45)
  %t178 = call i64 @"sx_f64_sub"(i64 %t176, i64 %t177)
  %t179 = call i64 @"sx_f64_lt"(i64 %t175, i64 %t178)
  %t180 = icmp ne i64 %t179, 0
  br i1 %t180, label %then10, label %else10
then10:
  %t181 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.46)
  %t182 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.47)
  %t183 = call i64 @"sx_f64_sub"(i64 %t181, i64 %t182)
  store i64 %t183, ptr %local.score.35
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t184 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t185 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.48)
  %t186 = ptrtoint ptr %t185 to i64
  %t187 = inttoptr i64 %t186 to ptr
  call void @intrinsic_print(ptr %t187)
  %t188 = load i64, ptr %local.r.24
  %t189 = call i64 @"print_f64"(i64 %t188)
  %t190 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.49)
  %t191 = ptrtoint ptr %t190 to i64
  %t192 = inttoptr i64 %t191 to ptr
  call void @intrinsic_print(ptr %t192)
  %t193 = load i64, ptr %local.drift_avg.29
  %t194 = call i64 @"print_f64"(i64 %t193)
  %t195 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.50)
  %t196 = ptrtoint ptr %t195 to i64
  %t197 = inttoptr i64 %t196 to ptr
  call void @intrinsic_print(ptr %t197)
  %t198 = load i64, ptr %local.v_ratio.32
  %t199 = call i64 @"print_f64"(i64 %t198)
  %t200 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.51)
  %t201 = ptrtoint ptr %t200 to i64
  %t202 = inttoptr i64 %t201 to ptr
  call void @intrinsic_print(ptr %t202)
  %t203 = load i64, ptr %local.score.35
  %t204 = call i64 @"print_f64"(i64 %t203)
  %t205 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.52)
  %t206 = ptrtoint ptr %t205 to i64
  %t207 = inttoptr i64 %t206 to ptr
  call void @intrinsic_print(ptr %t207)
  %t208 = load i64, ptr %local.drift_avg.29
  %t209 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.53)
  %t210 = call i64 @"sx_f64_lt"(i64 %t208, i64 %t209)
  %t211 = icmp ne i64 %t210, 0
  br i1 %t211, label %then11, label %else11
then11:
  %t212 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.54)
  %t213 = ptrtoint ptr %t212 to i64
  %t214 = inttoptr i64 %t213 to ptr
  call void @intrinsic_println(ptr %t214)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  %t215 = load i64, ptr %local.score.35
  %t216 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.55)
  %t217 = call i64 @"sx_f64_gt"(i64 %t215, i64 %t216)
  %t218 = icmp ne i64 %t217, 0
  br i1 %t218, label %then12, label %else12
then12:
  %t219 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.56)
  %t220 = ptrtoint ptr %t219 to i64
  %t221 = inttoptr i64 %t220 to ptr
  call void @intrinsic_println(ptr %t221)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  %t222 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.57)
  %t223 = ptrtoint ptr %t222 to i64
  %t224 = inttoptr i64 %t223 to ptr
  call void @intrinsic_println(ptr %t224)
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t225 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t226 = phi i64 [ 0, %then11_end ], [ %t225, %else11_end ]
  %t227 = load i64, ptr %local.ri.23
  %t228 = add i64 %t227, 1
  store i64 %t228, ptr %local.ri.23
  br label %loop1
endloop1:
  %t229 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.58)
  %t230 = ptrtoint ptr %t229 to i64
  %t231 = inttoptr i64 %t230 to ptr
  call void @intrinsic_println(ptr %t231)
  %t232 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.59)
  %t233 = ptrtoint ptr %t232 to i64
  %t234 = inttoptr i64 %t233 to ptr
  call void @intrinsic_println(ptr %t234)
  %t235 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.60)
  %t236 = ptrtoint ptr %t235 to i64
  %t237 = inttoptr i64 %t236 to ptr
  call void @intrinsic_println(ptr %t237)
  %t238 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.61)
  %t239 = ptrtoint ptr %t238 to i64
  %t240 = inttoptr i64 %t239 to ptr
  call void @intrinsic_println(ptr %t240)
  %t241 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.62)
  %t242 = ptrtoint ptr %t241 to i64
  %t243 = inttoptr i64 %t242 to ptr
  call void @intrinsic_println(ptr %t243)
  %t244 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.63)
  %t245 = ptrtoint ptr %t244 to i64
  %t246 = inttoptr i64 %t245 to ptr
  call void @intrinsic_println(ptr %t246)
  ret i64 0
}

define i64 @"run_exp2"() nounwind {
entry:
  %local.ri.247 = alloca i64
  %local.r.248 = alloca i64
  %local.x.249 = alloca i64
  %local.prev_x.250 = alloca i64
  %local.step.251 = alloca i64
  %local.le_sum.252 = alloca i64
  %local.le.253 = alloca i64
  %local.deriv.254 = alloca i64
  %local.diff.255 = alloca i64
  %local.early_drift.256 = alloca i64
  %local.late_drift.257 = alloca i64
  %local.score.258 = alloca i64
  %local.drift_avg.259 = alloca i64
  %local.drift_sum.260 = alloca i64
  %local.agree.261 = alloca i64
  %local.total.262 = alloca i64
  %local.le_class.263 = alloca i64
  %local.s_class.264 = alloca i64
  %t265 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.64)
  %t266 = ptrtoint ptr %t265 to i64
  %t267 = inttoptr i64 %t266 to ptr
  call void @intrinsic_println(ptr %t267)
  %t268 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.65)
  %t269 = ptrtoint ptr %t268 to i64
  %t270 = inttoptr i64 %t269 to ptr
  call void @intrinsic_println(ptr %t270)
  %t271 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.66)
  %t272 = ptrtoint ptr %t271 to i64
  %t273 = inttoptr i64 %t272 to ptr
  call void @intrinsic_println(ptr %t273)
  %t274 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.67)
  %t275 = ptrtoint ptr %t274 to i64
  %t276 = inttoptr i64 %t275 to ptr
  call void @intrinsic_println(ptr %t276)
  %t277 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.68)
  %t278 = ptrtoint ptr %t277 to i64
  %t279 = inttoptr i64 %t278 to ptr
  call void @intrinsic_println(ptr %t279)
  %t280 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.69)
  %t281 = ptrtoint ptr %t280 to i64
  %t282 = inttoptr i64 %t281 to ptr
  call void @intrinsic_println(ptr %t282)
  %t283 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.70)
  %t284 = ptrtoint ptr %t283 to i64
  %t285 = inttoptr i64 %t284 to ptr
  call void @intrinsic_println(ptr %t285)
  %t286 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.71)
  %t287 = ptrtoint ptr %t286 to i64
  %t288 = inttoptr i64 %t287 to ptr
  call void @intrinsic_println(ptr %t288)
  %t289 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.72)
  %t290 = ptrtoint ptr %t289 to i64
  %t291 = inttoptr i64 %t290 to ptr
  call void @intrinsic_println(ptr %t291)
  store i64 0, ptr %local.ri.247
  %t292 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.73)
  store i64 %t292, ptr %local.r.248
  %t293 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.74)
  store i64 %t293, ptr %local.x.249
  %t294 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.75)
  store i64 %t294, ptr %local.prev_x.250
  store i64 0, ptr %local.step.251
  %t295 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.76)
  store i64 %t295, ptr %local.le_sum.252
  %t296 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.77)
  store i64 %t296, ptr %local.le.253
  %t297 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.78)
  store i64 %t297, ptr %local.deriv.254
  %t298 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.79)
  store i64 %t298, ptr %local.diff.255
  %t299 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.80)
  store i64 %t299, ptr %local.early_drift.256
  %t300 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.81)
  store i64 %t300, ptr %local.late_drift.257
  %t301 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.82)
  store i64 %t301, ptr %local.score.258
  %t302 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.83)
  store i64 %t302, ptr %local.drift_avg.259
  %t303 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.84)
  store i64 %t303, ptr %local.drift_sum.260
  store i64 0, ptr %local.agree.261
  store i64 0, ptr %local.total.262
  br label %loop13
loop13:
  %t304 = load i64, ptr %local.ri.247
  %t305 = icmp sle i64 %t304, 30
  %t306 = zext i1 %t305 to i64
  %t307 = icmp ne i64 %t306, 0
  br i1 %t307, label %body13, label %endloop13
body13:
  %t308 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.85)
  %t309 = load i64, ptr %local.ri.247
  %t310 = call i64 @"sx_int_to_f64"(i64 %t309)
  %t311 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.86)
  %t312 = call i64 @"sx_f64_mul"(i64 %t310, i64 %t311)
  %t313 = call i64 @"sx_f64_add"(i64 %t308, i64 %t312)
  store i64 %t313, ptr %local.r.248
  %t314 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.87)
  store i64 %t314, ptr %local.x.249
  %t315 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.88)
  store i64 %t315, ptr %local.le_sum.252
  %t316 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.89)
  store i64 %t316, ptr %local.early_drift.256
  %t317 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.90)
  store i64 %t317, ptr %local.late_drift.257
  %t318 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.91)
  store i64 %t318, ptr %local.drift_sum.260
  store i64 0, ptr %local.step.251
  br label %loop14
loop14:
  %t319 = load i64, ptr %local.step.251
  %t320 = icmp slt i64 %t319, 500
  %t321 = zext i1 %t320 to i64
  %t322 = icmp ne i64 %t321, 0
  br i1 %t322, label %body14, label %endloop14
body14:
  %t323 = load i64, ptr %local.r.248
  %t324 = load i64, ptr %local.x.249
  %t325 = call i64 @"logistic"(i64 %t323, i64 %t324)
  store i64 %t325, ptr %local.x.249
  %t326 = load i64, ptr %local.step.251
  %t327 = add i64 %t326, 1
  store i64 %t327, ptr %local.step.251
  br label %loop14
endloop14:
  %t328 = load i64, ptr %local.x.249
  store i64 %t328, ptr %local.prev_x.250
  store i64 0, ptr %local.step.251
  br label %loop15
loop15:
  %t329 = load i64, ptr %local.step.251
  %t330 = icmp slt i64 %t329, 5000
  %t331 = zext i1 %t330 to i64
  %t332 = icmp ne i64 %t331, 0
  br i1 %t332, label %body15, label %endloop15
body15:
  %t333 = load i64, ptr %local.r.248
  %t334 = load i64, ptr %local.x.249
  %t335 = call i64 @"logistic_deriv"(i64 %t333, i64 %t334)
  store i64 %t335, ptr %local.deriv.254
  %t336 = load i64, ptr %local.deriv.254
  %t337 = call i64 @"abs_f64"(i64 %t336)
  %t338 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.92)
  %t339 = call i64 @"sx_f64_gt"(i64 %t337, i64 %t338)
  %t340 = icmp ne i64 %t339, 0
  br i1 %t340, label %then16, label %else16
then16:
  %t341 = load i64, ptr %local.le_sum.252
  %t342 = load i64, ptr %local.deriv.254
  %t343 = call i64 @"abs_f64"(i64 %t342)
  %t344 = call i64 @"ln_f64"(i64 %t343)
  %t345 = call i64 @"sx_f64_add"(i64 %t341, i64 %t344)
  store i64 %t345, ptr %local.le_sum.252
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t346 = load i64, ptr %local.le_sum.252
  %t347 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.93)
  %t348 = call i64 @"sx_f64_add"(i64 %t346, i64 %t347)
  %t349 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.94)
  %t350 = call i64 @"sx_f64_sub"(i64 %t348, i64 %t349)
  store i64 %t350, ptr %local.le_sum.252
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t351 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t352 = load i64, ptr %local.x.249
  store i64 %t352, ptr %local.prev_x.250
  %t353 = load i64, ptr %local.r.248
  %t354 = load i64, ptr %local.x.249
  %t355 = call i64 @"logistic"(i64 %t353, i64 %t354)
  store i64 %t355, ptr %local.x.249
  %t356 = load i64, ptr %local.x.249
  %t357 = load i64, ptr %local.prev_x.250
  %t358 = call i64 @"sx_f64_sub"(i64 %t356, i64 %t357)
  %t359 = call i64 @"abs_f64"(i64 %t358)
  store i64 %t359, ptr %local.diff.255
  %t360 = load i64, ptr %local.drift_sum.260
  %t361 = load i64, ptr %local.diff.255
  %t362 = call i64 @"sx_f64_add"(i64 %t360, i64 %t361)
  store i64 %t362, ptr %local.drift_sum.260
  %t363 = load i64, ptr %local.step.251
  %t364 = icmp sge i64 %t363, 100
  %t365 = zext i1 %t364 to i64
  %t366 = icmp ne i64 %t365, 0
  br i1 %t366, label %then17, label %else17
then17:
  %t367 = load i64, ptr %local.step.251
  %t368 = icmp slt i64 %t367, 300
  %t369 = zext i1 %t368 to i64
  %t370 = icmp ne i64 %t369, 0
  br i1 %t370, label %then18, label %else18
then18:
  %t371 = load i64, ptr %local.early_drift.256
  %t372 = load i64, ptr %local.diff.255
  %t373 = call i64 @"sx_f64_add"(i64 %t371, i64 %t372)
  store i64 %t373, ptr %local.early_drift.256
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t374 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t375 = phi i64 [ %t374, %then17_end ], [ 0, %else17_end ]
  %t376 = load i64, ptr %local.step.251
  %t377 = icmp sge i64 %t376, 4800
  %t378 = zext i1 %t377 to i64
  %t379 = icmp ne i64 %t378, 0
  br i1 %t379, label %then19, label %else19
then19:
  %t380 = load i64, ptr %local.late_drift.257
  %t381 = load i64, ptr %local.diff.255
  %t382 = call i64 @"sx_f64_add"(i64 %t380, i64 %t381)
  store i64 %t382, ptr %local.late_drift.257
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t383 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t384 = load i64, ptr %local.step.251
  %t385 = add i64 %t384, 1
  store i64 %t385, ptr %local.step.251
  br label %loop15
endloop15:
  %t386 = load i64, ptr %local.le_sum.252
  %t387 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.95)
  %t388 = call i64 @"sx_f64_div"(i64 %t386, i64 %t387)
  store i64 %t388, ptr %local.le.253
  %t389 = load i64, ptr %local.drift_sum.260
  %t390 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.96)
  %t391 = call i64 @"sx_f64_div"(i64 %t389, i64 %t390)
  store i64 %t391, ptr %local.drift_avg.259
  %t392 = load i64, ptr %local.early_drift.256
  %t393 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.97)
  %t394 = call i64 @"sx_f64_gt"(i64 %t392, i64 %t393)
  %t395 = icmp ne i64 %t394, 0
  br i1 %t395, label %then20, label %else20
then20:
  %t396 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.98)
  %t397 = load i64, ptr %local.late_drift.257
  %t398 = load i64, ptr %local.early_drift.256
  %t399 = call i64 @"sx_f64_div"(i64 %t397, i64 %t398)
  %t400 = call i64 @"sx_f64_sub"(i64 %t396, i64 %t399)
  store i64 %t400, ptr %local.score.258
  br label %then20_end
then20_end:
  br label %endif20
else20:
  %t401 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.99)
  store i64 %t401, ptr %local.score.258
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t402 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t403 = load i64, ptr %local.score.258
  %t404 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.100)
  %t405 = call i64 @"sx_f64_gt"(i64 %t403, i64 %t404)
  %t406 = icmp ne i64 %t405, 0
  br i1 %t406, label %then21, label %else21
then21:
  %t407 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.101)
  store i64 %t407, ptr %local.score.258
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t408 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t409 = load i64, ptr %local.score.258
  %t410 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.102)
  %t411 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.103)
  %t412 = call i64 @"sx_f64_sub"(i64 %t410, i64 %t411)
  %t413 = call i64 @"sx_f64_lt"(i64 %t409, i64 %t412)
  %t414 = icmp ne i64 %t413, 0
  br i1 %t414, label %then22, label %else22
then22:
  %t415 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.104)
  %t416 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.105)
  %t417 = call i64 @"sx_f64_sub"(i64 %t415, i64 %t416)
  store i64 %t417, ptr %local.score.258
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t418 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t419 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.106)
  %t420 = ptrtoint ptr %t419 to i64
  %t421 = inttoptr i64 %t420 to ptr
  call void @intrinsic_print(ptr %t421)
  %t422 = load i64, ptr %local.r.248
  %t423 = call i64 @"print_f64"(i64 %t422)
  %t424 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.107)
  %t425 = ptrtoint ptr %t424 to i64
  %t426 = inttoptr i64 %t425 to ptr
  call void @intrinsic_print(ptr %t426)
  %t427 = load i64, ptr %local.le.253
  %t428 = call i64 @"print_f64"(i64 %t427)
  %t429 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.108)
  %t430 = ptrtoint ptr %t429 to i64
  %t431 = inttoptr i64 %t430 to ptr
  call void @intrinsic_print(ptr %t431)
  store i64 0, ptr %local.le_class.263
  store i64 0, ptr %local.s_class.264
  %t432 = load i64, ptr %local.le.253
  %t433 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.109)
  %t434 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.110)
  %t435 = call i64 @"sx_f64_sub"(i64 %t433, i64 %t434)
  %t436 = call i64 @"sx_f64_lt"(i64 %t432, i64 %t435)
  %t437 = icmp ne i64 %t436, 0
  br i1 %t437, label %then23, label %else23
then23:
  %t438 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.111)
  %t439 = ptrtoint ptr %t438 to i64
  %t440 = inttoptr i64 %t439 to ptr
  call void @intrinsic_print(ptr %t440)
  store i64 0, ptr %local.le_class.263
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t441 = load i64, ptr %local.le.253
  %t442 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.112)
  %t443 = call i64 @"sx_f64_lt"(i64 %t441, i64 %t442)
  %t444 = icmp ne i64 %t443, 0
  br i1 %t444, label %then24, label %else24
then24:
  %t445 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.113)
  %t446 = ptrtoint ptr %t445 to i64
  %t447 = inttoptr i64 %t446 to ptr
  call void @intrinsic_print(ptr %t447)
  store i64 1, ptr %local.le_class.263
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t448 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.114)
  %t449 = ptrtoint ptr %t448 to i64
  %t450 = inttoptr i64 %t449 to ptr
  call void @intrinsic_print(ptr %t450)
  store i64 2, ptr %local.le_class.263
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t451 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t452 = phi i64 [ 0, %then23_end ], [ %t451, %else23_end ]
  %t453 = load i64, ptr %local.drift_avg.259
  %t454 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.115)
  %t455 = call i64 @"sx_f64_lt"(i64 %t453, i64 %t454)
  %t456 = icmp ne i64 %t455, 0
  br i1 %t456, label %then25, label %else25
then25:
  %t457 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.116)
  %t458 = ptrtoint ptr %t457 to i64
  %t459 = inttoptr i64 %t458 to ptr
  call void @intrinsic_println(ptr %t459)
  store i64 0, ptr %local.s_class.264
  br label %then25_end
then25_end:
  br label %endif25
else25:
  %t460 = load i64, ptr %local.score.258
  %t461 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.117)
  %t462 = call i64 @"sx_f64_gt"(i64 %t460, i64 %t461)
  %t463 = icmp ne i64 %t462, 0
  br i1 %t463, label %then26, label %else26
then26:
  %t464 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.118)
  %t465 = ptrtoint ptr %t464 to i64
  %t466 = inttoptr i64 %t465 to ptr
  call void @intrinsic_println(ptr %t466)
  store i64 1, ptr %local.s_class.264
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t467 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.119)
  %t468 = ptrtoint ptr %t467 to i64
  %t469 = inttoptr i64 %t468 to ptr
  call void @intrinsic_println(ptr %t469)
  store i64 2, ptr %local.s_class.264
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t470 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t471 = phi i64 [ 0, %then25_end ], [ %t470, %else25_end ]
  %t472 = load i64, ptr %local.total.262
  %t473 = add i64 %t472, 1
  store i64 %t473, ptr %local.total.262
  %t474 = load i64, ptr %local.le_class.263
  %t475 = icmp eq i64 %t474, 0
  %t476 = zext i1 %t475 to i64
  %t477 = icmp ne i64 %t476, 0
  br i1 %t477, label %then27, label %else27
then27:
  %t478 = load i64, ptr %local.s_class.264
  %t479 = icmp eq i64 %t478, 0
  %t480 = zext i1 %t479 to i64
  %t481 = icmp ne i64 %t480, 0
  br i1 %t481, label %then28, label %else28
then28:
  %t482 = load i64, ptr %local.agree.261
  %t483 = add i64 %t482, 1
  store i64 %t483, ptr %local.agree.261
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t484 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t485 = phi i64 [ %t484, %then27_end ], [ 0, %else27_end ]
  %t486 = load i64, ptr %local.le_class.263
  %t487 = icmp eq i64 %t486, 2
  %t488 = zext i1 %t487 to i64
  %t489 = icmp ne i64 %t488, 0
  br i1 %t489, label %then29, label %else29
then29:
  %t490 = load i64, ptr %local.s_class.264
  %t491 = icmp eq i64 %t490, 2
  %t492 = zext i1 %t491 to i64
  %t493 = icmp ne i64 %t492, 0
  br i1 %t493, label %then30, label %else30
then30:
  %t494 = load i64, ptr %local.agree.261
  %t495 = add i64 %t494, 1
  store i64 %t495, ptr %local.agree.261
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t496 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t497 = phi i64 [ %t496, %then29_end ], [ 0, %else29_end ]
  %t498 = load i64, ptr %local.le_class.263
  %t499 = icmp eq i64 %t498, 1
  %t500 = zext i1 %t499 to i64
  %t501 = icmp ne i64 %t500, 0
  br i1 %t501, label %then31, label %else31
then31:
  %t502 = load i64, ptr %local.agree.261
  %t503 = add i64 %t502, 1
  store i64 %t503, ptr %local.agree.261
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t504 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t505 = load i64, ptr %local.s_class.264
  %t506 = icmp eq i64 %t505, 1
  %t507 = zext i1 %t506 to i64
  %t508 = icmp ne i64 %t507, 0
  br i1 %t508, label %then32, label %else32
then32:
  %t509 = load i64, ptr %local.le_class.263
  %t510 = icmp ne i64 %t509, 1
  %t511 = zext i1 %t510 to i64
  %t512 = icmp ne i64 %t511, 0
  br i1 %t512, label %then33, label %else33
then33:
  %t513 = load i64, ptr %local.agree.261
  %t514 = add i64 %t513, 1
  store i64 %t514, ptr %local.agree.261
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t515 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t516 = phi i64 [ %t515, %then32_end ], [ 0, %else32_end ]
  %t517 = load i64, ptr %local.ri.247
  %t518 = add i64 %t517, 1
  store i64 %t518, ptr %local.ri.247
  br label %loop13
endloop13:
  %t519 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.120)
  %t520 = ptrtoint ptr %t519 to i64
  %t521 = inttoptr i64 %t520 to ptr
  call void @intrinsic_println(ptr %t521)
  %t522 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.121)
  %t523 = ptrtoint ptr %t522 to i64
  %t524 = inttoptr i64 %t523 to ptr
  call void @intrinsic_print(ptr %t524)
  %t525 = load i64, ptr %local.agree.261
  call void @print_i64(i64 %t525)
  %t526 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.122)
  %t527 = ptrtoint ptr %t526 to i64
  %t528 = inttoptr i64 %t527 to ptr
  call void @intrinsic_print(ptr %t528)
  %t529 = load i64, ptr %local.total.262
  call void @print_i64(i64 %t529)
  %t530 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.123)
  %t531 = ptrtoint ptr %t530 to i64
  %t532 = inttoptr i64 %t531 to ptr
  call void @intrinsic_println(ptr %t532)
  ret i64 0
}

define i64 @"run_exp3"() nounwind {
entry:
  %local.ai.533 = alloca i64
  %local.a.534 = alloca i64
  %local.b.535 = alloca i64
  %local.x.536 = alloca i64
  %local.y.537 = alloca i64
  %local.nx.538 = alloca i64
  %local.ny.539 = alloca i64
  %local.step.540 = alloca i64
  %local.le_sum.541 = alloca i64
  %local.le.542 = alloca i64
  %local.drift_sum.543 = alloca i64
  %local.drift_avg.544 = alloca i64
  %local.early_drift.545 = alloca i64
  %local.late_drift.546 = alloca i64
  %local.score.547 = alloca i64
  %local.diff.548 = alloca i64
  %local.escaped.549 = alloca i64
  %t550 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.124)
  %t551 = ptrtoint ptr %t550 to i64
  %t552 = inttoptr i64 %t551 to ptr
  call void @intrinsic_println(ptr %t552)
  %t553 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.125)
  %t554 = ptrtoint ptr %t553 to i64
  %t555 = inttoptr i64 %t554 to ptr
  call void @intrinsic_println(ptr %t555)
  %t556 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.126)
  %t557 = ptrtoint ptr %t556 to i64
  %t558 = inttoptr i64 %t557 to ptr
  call void @intrinsic_println(ptr %t558)
  %t559 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.127)
  %t560 = ptrtoint ptr %t559 to i64
  %t561 = inttoptr i64 %t560 to ptr
  call void @intrinsic_println(ptr %t561)
  %t562 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.128)
  %t563 = ptrtoint ptr %t562 to i64
  %t564 = inttoptr i64 %t563 to ptr
  call void @intrinsic_println(ptr %t564)
  %t565 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.129)
  %t566 = ptrtoint ptr %t565 to i64
  %t567 = inttoptr i64 %t566 to ptr
  call void @intrinsic_println(ptr %t567)
  %t568 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.130)
  %t569 = ptrtoint ptr %t568 to i64
  %t570 = inttoptr i64 %t569 to ptr
  call void @intrinsic_println(ptr %t570)
  %t571 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.131)
  %t572 = ptrtoint ptr %t571 to i64
  %t573 = inttoptr i64 %t572 to ptr
  call void @intrinsic_println(ptr %t573)
  %t574 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.132)
  %t575 = ptrtoint ptr %t574 to i64
  %t576 = inttoptr i64 %t575 to ptr
  call void @intrinsic_println(ptr %t576)
  store i64 0, ptr %local.ai.533
  %t577 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.133)
  store i64 %t577, ptr %local.a.534
  %t578 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.134)
  store i64 %t578, ptr %local.b.535
  %t579 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.135)
  store i64 %t579, ptr %local.x.536
  %t580 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.136)
  store i64 %t580, ptr %local.y.537
  %t581 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.137)
  store i64 %t581, ptr %local.nx.538
  %t582 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.138)
  store i64 %t582, ptr %local.ny.539
  store i64 0, ptr %local.step.540
  %t583 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.139)
  store i64 %t583, ptr %local.le_sum.541
  %t584 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.140)
  store i64 %t584, ptr %local.le.542
  %t585 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.141)
  store i64 %t585, ptr %local.drift_sum.543
  %t586 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.142)
  store i64 %t586, ptr %local.drift_avg.544
  %t587 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.143)
  store i64 %t587, ptr %local.early_drift.545
  %t588 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.144)
  store i64 %t588, ptr %local.late_drift.546
  %t589 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.145)
  store i64 %t589, ptr %local.score.547
  %t590 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.146)
  store i64 %t590, ptr %local.diff.548
  store i64 0, ptr %local.escaped.549
  br label %loop34
loop34:
  %t591 = load i64, ptr %local.ai.533
  %t592 = icmp sle i64 %t591, 20
  %t593 = zext i1 %t592 to i64
  %t594 = icmp ne i64 %t593, 0
  br i1 %t594, label %body34, label %endloop34
body34:
  %t595 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.147)
  %t596 = load i64, ptr %local.ai.533
  %t597 = call i64 @"sx_int_to_f64"(i64 %t596)
  %t598 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.148)
  %t599 = call i64 @"sx_f64_mul"(i64 %t597, i64 %t598)
  %t600 = call i64 @"sx_f64_add"(i64 %t595, i64 %t599)
  store i64 %t600, ptr %local.a.534
  %t601 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.149)
  store i64 %t601, ptr %local.x.536
  %t602 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.150)
  store i64 %t602, ptr %local.y.537
  %t603 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.151)
  store i64 %t603, ptr %local.le_sum.541
  %t604 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.152)
  store i64 %t604, ptr %local.drift_sum.543
  %t605 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.153)
  store i64 %t605, ptr %local.early_drift.545
  %t606 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.154)
  store i64 %t606, ptr %local.late_drift.546
  store i64 0, ptr %local.escaped.549
  store i64 0, ptr %local.step.540
  br label %loop35
loop35:
  %t607 = load i64, ptr %local.step.540
  %t608 = icmp slt i64 %t607, 200
  %t609 = zext i1 %t608 to i64
  %t610 = icmp ne i64 %t609, 0
  br i1 %t610, label %body35, label %endloop35
body35:
  %t611 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.155)
  %t612 = load i64, ptr %local.a.534
  %t613 = load i64, ptr %local.x.536
  %t614 = call i64 @"sx_f64_mul"(i64 %t612, i64 %t613)
  %t615 = load i64, ptr %local.x.536
  %t616 = call i64 @"sx_f64_mul"(i64 %t614, i64 %t615)
  %t617 = call i64 @"sx_f64_sub"(i64 %t611, i64 %t616)
  %t618 = load i64, ptr %local.y.537
  %t619 = call i64 @"sx_f64_add"(i64 %t617, i64 %t618)
  store i64 %t619, ptr %local.nx.538
  %t620 = load i64, ptr %local.b.535
  %t621 = load i64, ptr %local.x.536
  %t622 = call i64 @"sx_f64_mul"(i64 %t620, i64 %t621)
  store i64 %t622, ptr %local.ny.539
  %t623 = load i64, ptr %local.nx.538
  store i64 %t623, ptr %local.x.536
  %t624 = load i64, ptr %local.ny.539
  store i64 %t624, ptr %local.y.537
  %t625 = load i64, ptr %local.x.536
  %t626 = call i64 @"abs_f64"(i64 %t625)
  %t627 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.156)
  %t628 = call i64 @"sx_f64_gt"(i64 %t626, i64 %t627)
  %t629 = icmp ne i64 %t628, 0
  br i1 %t629, label %then36, label %else36
then36:
  store i64 1, ptr %local.escaped.549
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t630 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t631 = load i64, ptr %local.step.540
  %t632 = add i64 %t631, 1
  store i64 %t632, ptr %local.step.540
  br label %loop35
endloop35:
  store i64 0, ptr %local.step.540
  br label %loop37
loop37:
  %t633 = load i64, ptr %local.step.540
  %t634 = icmp slt i64 %t633, 5000
  %t635 = zext i1 %t634 to i64
  %t636 = icmp ne i64 %t635, 0
  br i1 %t636, label %body37, label %endloop37
body37:
  %t637 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.157)
  %t638 = load i64, ptr %local.a.534
  %t639 = call i64 @"sx_f64_mul"(i64 %t637, i64 %t638)
  %t640 = load i64, ptr %local.x.536
  %t641 = call i64 @"sx_f64_mul"(i64 %t639, i64 %t640)
  %t642 = call i64 @"abs_f64"(i64 %t641)
  %t643 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.158)
  %t644 = call i64 @"sx_f64_gt"(i64 %t642, i64 %t643)
  %t645 = icmp ne i64 %t644, 0
  br i1 %t645, label %then38, label %else38
then38:
  %t646 = load i64, ptr %local.le_sum.541
  %t647 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.159)
  %t648 = load i64, ptr %local.a.534
  %t649 = call i64 @"sx_f64_mul"(i64 %t647, i64 %t648)
  %t650 = load i64, ptr %local.x.536
  %t651 = call i64 @"sx_f64_mul"(i64 %t649, i64 %t650)
  %t652 = call i64 @"abs_f64"(i64 %t651)
  %t653 = call i64 @"ln_f64"(i64 %t652)
  %t654 = call i64 @"sx_f64_add"(i64 %t646, i64 %t653)
  store i64 %t654, ptr %local.le_sum.541
  br label %then38_end
then38_end:
  br label %endif38
else38:
  %t655 = load i64, ptr %local.le_sum.541
  %t656 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.160)
  %t657 = call i64 @"sx_f64_add"(i64 %t655, i64 %t656)
  %t658 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.161)
  %t659 = call i64 @"sx_f64_sub"(i64 %t657, i64 %t658)
  store i64 %t659, ptr %local.le_sum.541
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t660 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t661 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.162)
  %t662 = load i64, ptr %local.a.534
  %t663 = load i64, ptr %local.x.536
  %t664 = call i64 @"sx_f64_mul"(i64 %t662, i64 %t663)
  %t665 = load i64, ptr %local.x.536
  %t666 = call i64 @"sx_f64_mul"(i64 %t664, i64 %t665)
  %t667 = call i64 @"sx_f64_sub"(i64 %t661, i64 %t666)
  %t668 = load i64, ptr %local.y.537
  %t669 = call i64 @"sx_f64_add"(i64 %t667, i64 %t668)
  store i64 %t669, ptr %local.nx.538
  %t670 = load i64, ptr %local.b.535
  %t671 = load i64, ptr %local.x.536
  %t672 = call i64 @"sx_f64_mul"(i64 %t670, i64 %t671)
  store i64 %t672, ptr %local.ny.539
  %t673 = load i64, ptr %local.nx.538
  %t674 = load i64, ptr %local.x.536
  %t675 = call i64 @"sx_f64_sub"(i64 %t673, i64 %t674)
  %t676 = call i64 @"abs_f64"(i64 %t675)
  %t677 = load i64, ptr %local.ny.539
  %t678 = load i64, ptr %local.y.537
  %t679 = call i64 @"sx_f64_sub"(i64 %t677, i64 %t678)
  %t680 = call i64 @"abs_f64"(i64 %t679)
  %t681 = call i64 @"sx_f64_add"(i64 %t676, i64 %t680)
  store i64 %t681, ptr %local.diff.548
  %t682 = load i64, ptr %local.drift_sum.543
  %t683 = load i64, ptr %local.diff.548
  %t684 = call i64 @"sx_f64_add"(i64 %t682, i64 %t683)
  store i64 %t684, ptr %local.drift_sum.543
  %t685 = load i64, ptr %local.step.540
  %t686 = icmp sge i64 %t685, 100
  %t687 = zext i1 %t686 to i64
  %t688 = icmp ne i64 %t687, 0
  br i1 %t688, label %then39, label %else39
then39:
  %t689 = load i64, ptr %local.step.540
  %t690 = icmp slt i64 %t689, 300
  %t691 = zext i1 %t690 to i64
  %t692 = icmp ne i64 %t691, 0
  br i1 %t692, label %then40, label %else40
then40:
  %t693 = load i64, ptr %local.early_drift.545
  %t694 = load i64, ptr %local.diff.548
  %t695 = call i64 @"sx_f64_add"(i64 %t693, i64 %t694)
  store i64 %t695, ptr %local.early_drift.545
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t696 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t697 = phi i64 [ %t696, %then39_end ], [ 0, %else39_end ]
  %t698 = load i64, ptr %local.step.540
  %t699 = icmp sge i64 %t698, 4800
  %t700 = zext i1 %t699 to i64
  %t701 = icmp ne i64 %t700, 0
  br i1 %t701, label %then41, label %else41
then41:
  %t702 = load i64, ptr %local.late_drift.546
  %t703 = load i64, ptr %local.diff.548
  %t704 = call i64 @"sx_f64_add"(i64 %t702, i64 %t703)
  store i64 %t704, ptr %local.late_drift.546
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t705 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t706 = load i64, ptr %local.nx.538
  store i64 %t706, ptr %local.x.536
  %t707 = load i64, ptr %local.ny.539
  store i64 %t707, ptr %local.y.537
  %t708 = load i64, ptr %local.x.536
  %t709 = call i64 @"abs_f64"(i64 %t708)
  %t710 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.163)
  %t711 = call i64 @"sx_f64_gt"(i64 %t709, i64 %t710)
  %t712 = icmp ne i64 %t711, 0
  br i1 %t712, label %then42, label %else42
then42:
  store i64 1, ptr %local.escaped.549
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t713 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t714 = load i64, ptr %local.step.540
  %t715 = add i64 %t714, 1
  store i64 %t715, ptr %local.step.540
  br label %loop37
endloop37:
  %t716 = load i64, ptr %local.le_sum.541
  %t717 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.164)
  %t718 = call i64 @"sx_f64_div"(i64 %t716, i64 %t717)
  store i64 %t718, ptr %local.le.542
  %t719 = load i64, ptr %local.drift_sum.543
  %t720 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.165)
  %t721 = call i64 @"sx_f64_div"(i64 %t719, i64 %t720)
  store i64 %t721, ptr %local.drift_avg.544
  %t722 = load i64, ptr %local.early_drift.545
  %t723 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.166)
  %t724 = call i64 @"sx_f64_gt"(i64 %t722, i64 %t723)
  %t725 = icmp ne i64 %t724, 0
  br i1 %t725, label %then43, label %else43
then43:
  %t726 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.167)
  %t727 = load i64, ptr %local.late_drift.546
  %t728 = load i64, ptr %local.early_drift.545
  %t729 = call i64 @"sx_f64_div"(i64 %t727, i64 %t728)
  %t730 = call i64 @"sx_f64_sub"(i64 %t726, i64 %t729)
  store i64 %t730, ptr %local.score.547
  br label %then43_end
then43_end:
  br label %endif43
else43:
  %t731 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.168)
  store i64 %t731, ptr %local.score.547
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t732 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t733 = load i64, ptr %local.score.547
  %t734 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.169)
  %t735 = call i64 @"sx_f64_gt"(i64 %t733, i64 %t734)
  %t736 = icmp ne i64 %t735, 0
  br i1 %t736, label %then44, label %else44
then44:
  %t737 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.170)
  store i64 %t737, ptr %local.score.547
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t738 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t739 = load i64, ptr %local.score.547
  %t740 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.171)
  %t741 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.172)
  %t742 = call i64 @"sx_f64_sub"(i64 %t740, i64 %t741)
  %t743 = call i64 @"sx_f64_lt"(i64 %t739, i64 %t742)
  %t744 = icmp ne i64 %t743, 0
  br i1 %t744, label %then45, label %else45
then45:
  %t745 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.173)
  %t746 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.174)
  %t747 = call i64 @"sx_f64_sub"(i64 %t745, i64 %t746)
  store i64 %t747, ptr %local.score.547
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t748 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t749 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.175)
  %t750 = ptrtoint ptr %t749 to i64
  %t751 = inttoptr i64 %t750 to ptr
  call void @intrinsic_print(ptr %t751)
  %t752 = load i64, ptr %local.a.534
  %t753 = call i64 @"print_f64"(i64 %t752)
  %t754 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.176)
  %t755 = ptrtoint ptr %t754 to i64
  %t756 = inttoptr i64 %t755 to ptr
  call void @intrinsic_print(ptr %t756)
  %t757 = load i64, ptr %local.escaped.549
  %t758 = icmp eq i64 %t757, 1
  %t759 = zext i1 %t758 to i64
  %t760 = icmp ne i64 %t759, 0
  br i1 %t760, label %then46, label %else46
then46:
  %t761 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.177)
  %t762 = ptrtoint ptr %t761 to i64
  %t763 = inttoptr i64 %t762 to ptr
  call void @intrinsic_println(ptr %t763)
  br label %then46_end
then46_end:
  br label %endif46
else46:
  %t764 = load i64, ptr %local.le.542
  %t765 = call i64 @"print_f64"(i64 %t764)
  %t766 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.178)
  %t767 = ptrtoint ptr %t766 to i64
  %t768 = inttoptr i64 %t767 to ptr
  call void @intrinsic_print(ptr %t768)
  %t769 = load i64, ptr %local.drift_avg.544
  %t770 = call i64 @"print_f64"(i64 %t769)
  %t771 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.179)
  %t772 = ptrtoint ptr %t771 to i64
  %t773 = inttoptr i64 %t772 to ptr
  call void @intrinsic_print(ptr %t773)
  %t774 = load i64, ptr %local.score.547
  %t775 = call i64 @"print_f64"(i64 %t774)
  %t776 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.180)
  %t777 = ptrtoint ptr %t776 to i64
  %t778 = inttoptr i64 %t777 to ptr
  call void @intrinsic_print(ptr %t778)
  %t779 = load i64, ptr %local.drift_avg.544
  %t780 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.181)
  %t781 = call i64 @"sx_f64_lt"(i64 %t779, i64 %t780)
  %t782 = icmp ne i64 %t781, 0
  br i1 %t782, label %then47, label %else47
then47:
  %t783 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.182)
  %t784 = ptrtoint ptr %t783 to i64
  %t785 = inttoptr i64 %t784 to ptr
  call void @intrinsic_println(ptr %t785)
  br label %then47_end
then47_end:
  br label %endif47
else47:
  %t786 = load i64, ptr %local.le.542
  %t787 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.183)
  %t788 = call i64 @"sx_f64_lt"(i64 %t786, i64 %t787)
  %t789 = icmp ne i64 %t788, 0
  br i1 %t789, label %then48, label %else48
then48:
  %t790 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.184)
  %t791 = ptrtoint ptr %t790 to i64
  %t792 = inttoptr i64 %t791 to ptr
  call void @intrinsic_println(ptr %t792)
  br label %then48_end
then48_end:
  br label %endif48
else48:
  %t793 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.185)
  %t794 = ptrtoint ptr %t793 to i64
  %t795 = inttoptr i64 %t794 to ptr
  call void @intrinsic_println(ptr %t795)
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t796 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t797 = phi i64 [ 0, %then47_end ], [ %t796, %else47_end ]
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t798 = phi i64 [ 0, %then46_end ], [ %t797, %else46_end ]
  %t799 = load i64, ptr %local.ai.533
  %t800 = add i64 %t799, 1
  store i64 %t800, ptr %local.ai.533
  br label %loop34
endloop34:
  %t801 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.186)
  %t802 = ptrtoint ptr %t801 to i64
  %t803 = inttoptr i64 %t802 to ptr
  call void @intrinsic_println(ptr %t803)
  %t804 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.187)
  %t805 = ptrtoint ptr %t804 to i64
  %t806 = inttoptr i64 %t805 to ptr
  call void @intrinsic_println(ptr %t806)
  %t807 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.188)
  %t808 = ptrtoint ptr %t807 to i64
  %t809 = inttoptr i64 %t808 to ptr
  call void @intrinsic_println(ptr %t809)
  ret i64 0
}

define i64 @"run_exp4"() nounwind {
entry:
  %local.ri.810 = alloca i64
  %local.r.811 = alloca i64
  %local.x.812 = alloca i64
  %local.prev_x.813 = alloca i64
  %local.step.814 = alloca i64
  %local.drift_sum.815 = alloca i64
  %local.drift_avg.816 = alloca i64
  %local.le_sum.817 = alloca i64
  %local.le.818 = alloca i64
  %local.deriv.819 = alloca i64
  %local.diff.820 = alloca i64
  %local.early_drift.821 = alloca i64
  %local.late_drift.822 = alloca i64
  %local.score.823 = alloca i64
  %local.prev_score.824 = alloca i64
  %local.max_ds.825 = alloca i64
  %local.max_ds_r.826 = alloca i64
  %local.min_score.827 = alloca i64
  %local.min_score_r.828 = alloca i64
  %local.ds.829 = alloca i64
  %t830 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.189)
  %t831 = ptrtoint ptr %t830 to i64
  %t832 = inttoptr i64 %t831 to ptr
  call void @intrinsic_println(ptr %t832)
  %t833 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.190)
  %t834 = ptrtoint ptr %t833 to i64
  %t835 = inttoptr i64 %t834 to ptr
  call void @intrinsic_println(ptr %t835)
  %t836 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.191)
  %t837 = ptrtoint ptr %t836 to i64
  %t838 = inttoptr i64 %t837 to ptr
  call void @intrinsic_println(ptr %t838)
  %t839 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.192)
  %t840 = ptrtoint ptr %t839 to i64
  %t841 = inttoptr i64 %t840 to ptr
  call void @intrinsic_println(ptr %t841)
  %t842 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.193)
  %t843 = ptrtoint ptr %t842 to i64
  %t844 = inttoptr i64 %t843 to ptr
  call void @intrinsic_println(ptr %t844)
  %t845 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.194)
  %t846 = ptrtoint ptr %t845 to i64
  %t847 = inttoptr i64 %t846 to ptr
  call void @intrinsic_println(ptr %t847)
  %t848 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.195)
  %t849 = ptrtoint ptr %t848 to i64
  %t850 = inttoptr i64 %t849 to ptr
  call void @intrinsic_println(ptr %t850)
  %t851 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.196)
  %t852 = ptrtoint ptr %t851 to i64
  %t853 = inttoptr i64 %t852 to ptr
  call void @intrinsic_println(ptr %t853)
  %t854 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.197)
  %t855 = ptrtoint ptr %t854 to i64
  %t856 = inttoptr i64 %t855 to ptr
  call void @intrinsic_println(ptr %t856)
  store i64 0, ptr %local.ri.810
  %t857 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.198)
  store i64 %t857, ptr %local.r.811
  %t858 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.199)
  store i64 %t858, ptr %local.x.812
  %t859 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.200)
  store i64 %t859, ptr %local.prev_x.813
  store i64 0, ptr %local.step.814
  %t860 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.201)
  store i64 %t860, ptr %local.drift_sum.815
  %t861 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.202)
  store i64 %t861, ptr %local.drift_avg.816
  %t862 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.203)
  store i64 %t862, ptr %local.le_sum.817
  %t863 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.204)
  store i64 %t863, ptr %local.le.818
  %t864 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.205)
  store i64 %t864, ptr %local.deriv.819
  %t865 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.206)
  store i64 %t865, ptr %local.diff.820
  %t866 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.207)
  store i64 %t866, ptr %local.early_drift.821
  %t867 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.208)
  store i64 %t867, ptr %local.late_drift.822
  %t868 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.209)
  store i64 %t868, ptr %local.score.823
  %t869 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.210)
  store i64 %t869, ptr %local.prev_score.824
  %t870 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.211)
  store i64 %t870, ptr %local.max_ds.825
  %t871 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.212)
  store i64 %t871, ptr %local.max_ds_r.826
  %t872 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.213)
  store i64 %t872, ptr %local.min_score.827
  %t873 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.214)
  store i64 %t873, ptr %local.min_score_r.828
  br label %loop49
loop49:
  %t874 = load i64, ptr %local.ri.810
  %t875 = icmp sle i64 %t874, 20
  %t876 = zext i1 %t875 to i64
  %t877 = icmp ne i64 %t876, 0
  br i1 %t877, label %body49, label %endloop49
body49:
  %t878 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.215)
  %t879 = load i64, ptr %local.ri.810
  %t880 = call i64 @"sx_int_to_f64"(i64 %t879)
  %t881 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.216)
  %t882 = call i64 @"sx_f64_mul"(i64 %t880, i64 %t881)
  %t883 = call i64 @"sx_f64_add"(i64 %t878, i64 %t882)
  store i64 %t883, ptr %local.r.811
  %t884 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.217)
  store i64 %t884, ptr %local.x.812
  %t885 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.218)
  store i64 %t885, ptr %local.le_sum.817
  %t886 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.219)
  store i64 %t886, ptr %local.drift_sum.815
  %t887 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.220)
  store i64 %t887, ptr %local.early_drift.821
  %t888 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.221)
  store i64 %t888, ptr %local.late_drift.822
  store i64 0, ptr %local.step.814
  br label %loop50
loop50:
  %t889 = load i64, ptr %local.step.814
  %t890 = icmp slt i64 %t889, 1000
  %t891 = zext i1 %t890 to i64
  %t892 = icmp ne i64 %t891, 0
  br i1 %t892, label %body50, label %endloop50
body50:
  %t893 = load i64, ptr %local.r.811
  %t894 = load i64, ptr %local.x.812
  %t895 = call i64 @"logistic"(i64 %t893, i64 %t894)
  store i64 %t895, ptr %local.x.812
  %t896 = load i64, ptr %local.step.814
  %t897 = add i64 %t896, 1
  store i64 %t897, ptr %local.step.814
  br label %loop50
endloop50:
  %t898 = load i64, ptr %local.x.812
  store i64 %t898, ptr %local.prev_x.813
  store i64 0, ptr %local.step.814
  br label %loop51
loop51:
  %t899 = load i64, ptr %local.step.814
  %t900 = icmp slt i64 %t899, 10000
  %t901 = zext i1 %t900 to i64
  %t902 = icmp ne i64 %t901, 0
  br i1 %t902, label %body51, label %endloop51
body51:
  %t903 = load i64, ptr %local.r.811
  %t904 = load i64, ptr %local.x.812
  %t905 = call i64 @"logistic_deriv"(i64 %t903, i64 %t904)
  store i64 %t905, ptr %local.deriv.819
  %t906 = load i64, ptr %local.deriv.819
  %t907 = call i64 @"abs_f64"(i64 %t906)
  %t908 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.222)
  %t909 = call i64 @"sx_f64_gt"(i64 %t907, i64 %t908)
  %t910 = icmp ne i64 %t909, 0
  br i1 %t910, label %then52, label %else52
then52:
  %t911 = load i64, ptr %local.le_sum.817
  %t912 = load i64, ptr %local.deriv.819
  %t913 = call i64 @"abs_f64"(i64 %t912)
  %t914 = call i64 @"ln_f64"(i64 %t913)
  %t915 = call i64 @"sx_f64_add"(i64 %t911, i64 %t914)
  store i64 %t915, ptr %local.le_sum.817
  br label %then52_end
then52_end:
  br label %endif52
else52:
  %t916 = load i64, ptr %local.le_sum.817
  %t917 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.223)
  %t918 = call i64 @"sx_f64_add"(i64 %t916, i64 %t917)
  %t919 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.224)
  %t920 = call i64 @"sx_f64_sub"(i64 %t918, i64 %t919)
  store i64 %t920, ptr %local.le_sum.817
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t921 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t922 = load i64, ptr %local.x.812
  store i64 %t922, ptr %local.prev_x.813
  %t923 = load i64, ptr %local.r.811
  %t924 = load i64, ptr %local.x.812
  %t925 = call i64 @"logistic"(i64 %t923, i64 %t924)
  store i64 %t925, ptr %local.x.812
  %t926 = load i64, ptr %local.x.812
  %t927 = load i64, ptr %local.prev_x.813
  %t928 = call i64 @"sx_f64_sub"(i64 %t926, i64 %t927)
  %t929 = call i64 @"abs_f64"(i64 %t928)
  store i64 %t929, ptr %local.diff.820
  %t930 = load i64, ptr %local.drift_sum.815
  %t931 = load i64, ptr %local.diff.820
  %t932 = call i64 @"sx_f64_add"(i64 %t930, i64 %t931)
  store i64 %t932, ptr %local.drift_sum.815
  %t933 = load i64, ptr %local.step.814
  %t934 = icmp sge i64 %t933, 500
  %t935 = zext i1 %t934 to i64
  %t936 = icmp ne i64 %t935, 0
  br i1 %t936, label %then53, label %else53
then53:
  %t937 = load i64, ptr %local.step.814
  %t938 = icmp slt i64 %t937, 1500
  %t939 = zext i1 %t938 to i64
  %t940 = icmp ne i64 %t939, 0
  br i1 %t940, label %then54, label %else54
then54:
  %t941 = load i64, ptr %local.early_drift.821
  %t942 = load i64, ptr %local.diff.820
  %t943 = call i64 @"sx_f64_add"(i64 %t941, i64 %t942)
  store i64 %t943, ptr %local.early_drift.821
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t944 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t945 = phi i64 [ %t944, %then53_end ], [ 0, %else53_end ]
  %t946 = load i64, ptr %local.step.814
  %t947 = icmp sge i64 %t946, 9000
  %t948 = zext i1 %t947 to i64
  %t949 = icmp ne i64 %t948, 0
  br i1 %t949, label %then55, label %else55
then55:
  %t950 = load i64, ptr %local.late_drift.822
  %t951 = load i64, ptr %local.diff.820
  %t952 = call i64 @"sx_f64_add"(i64 %t950, i64 %t951)
  store i64 %t952, ptr %local.late_drift.822
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t953 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t954 = load i64, ptr %local.step.814
  %t955 = add i64 %t954, 1
  store i64 %t955, ptr %local.step.814
  br label %loop51
endloop51:
  %t956 = load i64, ptr %local.le_sum.817
  %t957 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.225)
  %t958 = call i64 @"sx_f64_div"(i64 %t956, i64 %t957)
  store i64 %t958, ptr %local.le.818
  %t959 = load i64, ptr %local.drift_sum.815
  %t960 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.226)
  %t961 = call i64 @"sx_f64_div"(i64 %t959, i64 %t960)
  store i64 %t961, ptr %local.drift_avg.816
  %t962 = load i64, ptr %local.early_drift.821
  %t963 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.227)
  %t964 = call i64 @"sx_f64_gt"(i64 %t962, i64 %t963)
  %t965 = icmp ne i64 %t964, 0
  br i1 %t965, label %then56, label %else56
then56:
  %t966 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.228)
  %t967 = load i64, ptr %local.late_drift.822
  %t968 = load i64, ptr %local.early_drift.821
  %t969 = call i64 @"sx_f64_div"(i64 %t967, i64 %t968)
  %t970 = call i64 @"sx_f64_sub"(i64 %t966, i64 %t969)
  store i64 %t970, ptr %local.score.823
  br label %then56_end
then56_end:
  br label %endif56
else56:
  %t971 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.229)
  store i64 %t971, ptr %local.score.823
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t972 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t973 = load i64, ptr %local.score.823
  %t974 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.230)
  %t975 = call i64 @"sx_f64_gt"(i64 %t973, i64 %t974)
  %t976 = icmp ne i64 %t975, 0
  br i1 %t976, label %then57, label %else57
then57:
  %t977 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.231)
  store i64 %t977, ptr %local.score.823
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t978 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t979 = load i64, ptr %local.score.823
  %t980 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.232)
  %t981 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.233)
  %t982 = call i64 @"sx_f64_sub"(i64 %t980, i64 %t981)
  %t983 = call i64 @"sx_f64_lt"(i64 %t979, i64 %t982)
  %t984 = icmp ne i64 %t983, 0
  br i1 %t984, label %then58, label %else58
then58:
  %t985 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.234)
  %t986 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.235)
  %t987 = call i64 @"sx_f64_sub"(i64 %t985, i64 %t986)
  store i64 %t987, ptr %local.score.823
  br label %then58_end
then58_end:
  br label %endif58
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t988 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t989 = load i64, ptr %local.ri.810
  %t990 = icmp sgt i64 %t989, 0
  %t991 = zext i1 %t990 to i64
  %t992 = icmp ne i64 %t991, 0
  br i1 %t992, label %then59, label %else59
then59:
  %t993 = load i64, ptr %local.score.823
  %t994 = load i64, ptr %local.prev_score.824
  %t995 = call i64 @"sx_f64_sub"(i64 %t993, i64 %t994)
  %t996 = call i64 @"abs_f64"(i64 %t995)
  store i64 %t996, ptr %local.ds.829
  %t997 = load i64, ptr %local.ds.829
  %t998 = load i64, ptr %local.max_ds.825
  %t999 = call i64 @"sx_f64_gt"(i64 %t997, i64 %t998)
  %t1000 = icmp ne i64 %t999, 0
  br i1 %t1000, label %then60, label %else60
then60:
  %t1001 = load i64, ptr %local.ds.829
  store i64 %t1001, ptr %local.max_ds.825
  %t1002 = load i64, ptr %local.r.811
  store i64 %t1002, ptr %local.max_ds_r.826
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t1003 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t1004 = phi i64 [ %t1003, %then59_end ], [ 0, %else59_end ]
  %t1005 = load i64, ptr %local.score.823
  %t1006 = load i64, ptr %local.min_score.827
  %t1007 = call i64 @"sx_f64_lt"(i64 %t1005, i64 %t1006)
  %t1008 = icmp ne i64 %t1007, 0
  br i1 %t1008, label %then61, label %else61
then61:
  %t1009 = load i64, ptr %local.score.823
  store i64 %t1009, ptr %local.min_score.827
  %t1010 = load i64, ptr %local.r.811
  store i64 %t1010, ptr %local.min_score_r.828
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t1011 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t1012 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.236)
  %t1013 = ptrtoint ptr %t1012 to i64
  %t1014 = inttoptr i64 %t1013 to ptr
  call void @intrinsic_print(ptr %t1014)
  %t1015 = load i64, ptr %local.r.811
  %t1016 = call i64 @"print_f64"(i64 %t1015)
  %t1017 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.237)
  %t1018 = ptrtoint ptr %t1017 to i64
  %t1019 = inttoptr i64 %t1018 to ptr
  call void @intrinsic_print(ptr %t1019)
  %t1020 = load i64, ptr %local.drift_avg.816
  %t1021 = call i64 @"print_f64"(i64 %t1020)
  %t1022 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.238)
  %t1023 = ptrtoint ptr %t1022 to i64
  %t1024 = inttoptr i64 %t1023 to ptr
  call void @intrinsic_print(ptr %t1024)
  %t1025 = load i64, ptr %local.le.818
  %t1026 = call i64 @"print_f64"(i64 %t1025)
  %t1027 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.239)
  %t1028 = ptrtoint ptr %t1027 to i64
  %t1029 = inttoptr i64 %t1028 to ptr
  call void @intrinsic_print(ptr %t1029)
  %t1030 = load i64, ptr %local.score.823
  %t1031 = call i64 @"print_f64"(i64 %t1030)
  %t1032 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.240)
  %t1033 = ptrtoint ptr %t1032 to i64
  %t1034 = inttoptr i64 %t1033 to ptr
  call void @intrinsic_print(ptr %t1034)
  %t1035 = load i64, ptr %local.le.818
  %t1036 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.241)
  %t1037 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.242)
  %t1038 = call i64 @"sx_f64_sub"(i64 %t1036, i64 %t1037)
  %t1039 = call i64 @"sx_f64_lt"(i64 %t1035, i64 %t1038)
  %t1040 = icmp ne i64 %t1039, 0
  br i1 %t1040, label %then62, label %else62
then62:
  %t1041 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.243)
  %t1042 = ptrtoint ptr %t1041 to i64
  %t1043 = inttoptr i64 %t1042 to ptr
  call void @intrinsic_println(ptr %t1043)
  br label %then62_end
then62_end:
  br label %endif62
else62:
  %t1044 = load i64, ptr %local.le.818
  %t1045 = call i64 @f64_parse(ptr @.str.exp_chaos_boundary.244)
  %t1046 = call i64 @"sx_f64_lt"(i64 %t1044, i64 %t1045)
  %t1047 = icmp ne i64 %t1046, 0
  br i1 %t1047, label %then63, label %else63
then63:
  %t1048 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.245)
  %t1049 = ptrtoint ptr %t1048 to i64
  %t1050 = inttoptr i64 %t1049 to ptr
  call void @intrinsic_println(ptr %t1050)
  br label %then63_end
then63_end:
  br label %endif63
else63:
  %t1051 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.246)
  %t1052 = ptrtoint ptr %t1051 to i64
  %t1053 = inttoptr i64 %t1052 to ptr
  call void @intrinsic_println(ptr %t1053)
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t1054 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t1055 = phi i64 [ 0, %then62_end ], [ %t1054, %else62_end ]
  %t1056 = load i64, ptr %local.score.823
  store i64 %t1056, ptr %local.prev_score.824
  %t1057 = load i64, ptr %local.ri.810
  %t1058 = add i64 %t1057, 1
  store i64 %t1058, ptr %local.ri.810
  br label %loop49
endloop49:
  %t1059 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.247)
  %t1060 = ptrtoint ptr %t1059 to i64
  %t1061 = inttoptr i64 %t1060 to ptr
  call void @intrinsic_println(ptr %t1061)
  %t1062 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.248)
  %t1063 = ptrtoint ptr %t1062 to i64
  %t1064 = inttoptr i64 %t1063 to ptr
  call void @intrinsic_println(ptr %t1064)
  %t1065 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.249)
  %t1066 = ptrtoint ptr %t1065 to i64
  %t1067 = inttoptr i64 %t1066 to ptr
  call void @intrinsic_print(ptr %t1067)
  %t1068 = load i64, ptr %local.max_ds_r.826
  %t1069 = call i64 @"print_f64"(i64 %t1068)
  %t1070 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.250)
  %t1071 = ptrtoint ptr %t1070 to i64
  %t1072 = inttoptr i64 %t1071 to ptr
  call void @intrinsic_print(ptr %t1072)
  %t1073 = load i64, ptr %local.max_ds.825
  %t1074 = call i64 @"print_f64"(i64 %t1073)
  %t1075 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.251)
  %t1076 = ptrtoint ptr %t1075 to i64
  %t1077 = inttoptr i64 %t1076 to ptr
  call void @intrinsic_println(ptr %t1077)
  %t1078 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.252)
  %t1079 = ptrtoint ptr %t1078 to i64
  %t1080 = inttoptr i64 %t1079 to ptr
  call void @intrinsic_print(ptr %t1080)
  %t1081 = load i64, ptr %local.min_score_r.828
  %t1082 = call i64 @"print_f64"(i64 %t1081)
  %t1083 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.253)
  %t1084 = ptrtoint ptr %t1083 to i64
  %t1085 = inttoptr i64 %t1084 to ptr
  call void @intrinsic_print(ptr %t1085)
  %t1086 = load i64, ptr %local.min_score.827
  %t1087 = call i64 @"print_f64"(i64 %t1086)
  %t1088 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.254)
  %t1089 = ptrtoint ptr %t1088 to i64
  %t1090 = inttoptr i64 %t1089 to ptr
  call void @intrinsic_println(ptr %t1090)
  %t1091 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.255)
  %t1092 = ptrtoint ptr %t1091 to i64
  %t1093 = inttoptr i64 %t1092 to ptr
  call void @intrinsic_println(ptr %t1093)
  %t1094 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.256)
  %t1095 = ptrtoint ptr %t1094 to i64
  %t1096 = inttoptr i64 %t1095 to ptr
  call void @intrinsic_println(ptr %t1096)
  %t1097 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.257)
  %t1098 = ptrtoint ptr %t1097 to i64
  %t1099 = inttoptr i64 %t1098 to ptr
  call void @intrinsic_println(ptr %t1099)
  %t1100 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.258)
  %t1101 = ptrtoint ptr %t1100 to i64
  %t1102 = inttoptr i64 %t1101 to ptr
  call void @intrinsic_println(ptr %t1102)
  %t1103 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.259)
  %t1104 = ptrtoint ptr %t1103 to i64
  %t1105 = inttoptr i64 %t1104 to ptr
  call void @intrinsic_println(ptr %t1105)
  %t1106 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.260)
  %t1107 = ptrtoint ptr %t1106 to i64
  %t1108 = inttoptr i64 %t1107 to ptr
  call void @intrinsic_println(ptr %t1108)
  %t1109 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.261)
  %t1110 = ptrtoint ptr %t1109 to i64
  %t1111 = inttoptr i64 %t1110 to ptr
  call void @intrinsic_println(ptr %t1111)
  %t1112 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.262)
  %t1113 = ptrtoint ptr %t1112 to i64
  %t1114 = inttoptr i64 %t1113 to ptr
  call void @intrinsic_println(ptr %t1114)
  %t1115 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.263)
  %t1116 = ptrtoint ptr %t1115 to i64
  %t1117 = inttoptr i64 %t1116 to ptr
  call void @intrinsic_println(ptr %t1117)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.r1.1118 = alloca i64
  %local.r2.1119 = alloca i64
  %local.r3.1120 = alloca i64
  %local.r4.1121 = alloca i64
  %t1122 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.264)
  %t1123 = ptrtoint ptr %t1122 to i64
  %t1124 = inttoptr i64 %t1123 to ptr
  call void @intrinsic_println(ptr %t1124)
  %t1125 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.265)
  %t1126 = ptrtoint ptr %t1125 to i64
  %t1127 = inttoptr i64 %t1126 to ptr
  call void @intrinsic_println(ptr %t1127)
  %t1128 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.266)
  %t1129 = ptrtoint ptr %t1128 to i64
  %t1130 = inttoptr i64 %t1129 to ptr
  call void @intrinsic_println(ptr %t1130)
  %t1131 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.267)
  %t1132 = ptrtoint ptr %t1131 to i64
  %t1133 = inttoptr i64 %t1132 to ptr
  call void @intrinsic_println(ptr %t1133)
  %t1134 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.268)
  %t1135 = ptrtoint ptr %t1134 to i64
  %t1136 = inttoptr i64 %t1135 to ptr
  call void @intrinsic_println(ptr %t1136)
  %t1137 = call i64 @"run_exp1"()
  store i64 %t1137, ptr %local.r1.1118
  %t1138 = call i64 @"run_exp2"()
  store i64 %t1138, ptr %local.r2.1119
  %t1139 = call i64 @"run_exp3"()
  store i64 %t1139, ptr %local.r3.1120
  %t1140 = call i64 @"run_exp4"()
  store i64 %t1140, ptr %local.r4.1121
  %t1141 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.269)
  %t1142 = ptrtoint ptr %t1141 to i64
  %t1143 = inttoptr i64 %t1142 to ptr
  call void @intrinsic_println(ptr %t1143)
  %t1144 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.270)
  %t1145 = ptrtoint ptr %t1144 to i64
  %t1146 = inttoptr i64 %t1145 to ptr
  call void @intrinsic_println(ptr %t1146)
  %t1147 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.271)
  %t1148 = ptrtoint ptr %t1147 to i64
  %t1149 = inttoptr i64 %t1148 to ptr
  call void @intrinsic_println(ptr %t1149)
  %t1150 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.272)
  %t1151 = ptrtoint ptr %t1150 to i64
  %t1152 = inttoptr i64 %t1151 to ptr
  call void @intrinsic_println(ptr %t1152)
  %t1153 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.273)
  %t1154 = ptrtoint ptr %t1153 to i64
  %t1155 = inttoptr i64 %t1154 to ptr
  call void @intrinsic_println(ptr %t1155)
  %t1156 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.274)
  %t1157 = ptrtoint ptr %t1156 to i64
  %t1158 = inttoptr i64 %t1157 to ptr
  call void @intrinsic_println(ptr %t1158)
  %t1159 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.275)
  %t1160 = ptrtoint ptr %t1159 to i64
  %t1161 = inttoptr i64 %t1160 to ptr
  call void @intrinsic_println(ptr %t1161)
  %t1162 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.276)
  %t1163 = ptrtoint ptr %t1162 to i64
  %t1164 = inttoptr i64 %t1163 to ptr
  call void @intrinsic_println(ptr %t1164)
  %t1165 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.277)
  %t1166 = ptrtoint ptr %t1165 to i64
  %t1167 = inttoptr i64 %t1166 to ptr
  call void @intrinsic_println(ptr %t1167)
  %t1168 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.278)
  %t1169 = ptrtoint ptr %t1168 to i64
  %t1170 = inttoptr i64 %t1169 to ptr
  call void @intrinsic_println(ptr %t1170)
  %t1171 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.279)
  %t1172 = ptrtoint ptr %t1171 to i64
  %t1173 = inttoptr i64 %t1172 to ptr
  call void @intrinsic_println(ptr %t1173)
  %t1174 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.280)
  %t1175 = ptrtoint ptr %t1174 to i64
  %t1176 = inttoptr i64 %t1175 to ptr
  call void @intrinsic_println(ptr %t1176)
  %t1177 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.281)
  %t1178 = ptrtoint ptr %t1177 to i64
  %t1179 = inttoptr i64 %t1178 to ptr
  call void @intrinsic_println(ptr %t1179)
  %t1180 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.282)
  %t1181 = ptrtoint ptr %t1180 to i64
  %t1182 = inttoptr i64 %t1181 to ptr
  call void @intrinsic_println(ptr %t1182)
  %t1183 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.283)
  %t1184 = ptrtoint ptr %t1183 to i64
  %t1185 = inttoptr i64 %t1184 to ptr
  call void @intrinsic_println(ptr %t1185)
  %t1186 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.284)
  %t1187 = ptrtoint ptr %t1186 to i64
  %t1188 = inttoptr i64 %t1187 to ptr
  call void @intrinsic_println(ptr %t1188)
  %t1189 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.285)
  %t1190 = ptrtoint ptr %t1189 to i64
  %t1191 = inttoptr i64 %t1190 to ptr
  call void @intrinsic_println(ptr %t1191)
  %t1192 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.286)
  %t1193 = ptrtoint ptr %t1192 to i64
  %t1194 = inttoptr i64 %t1193 to ptr
  call void @intrinsic_println(ptr %t1194)
  %t1195 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.287)
  %t1196 = ptrtoint ptr %t1195 to i64
  %t1197 = inttoptr i64 %t1196 to ptr
  call void @intrinsic_println(ptr %t1197)
  %t1198 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.288)
  %t1199 = ptrtoint ptr %t1198 to i64
  %t1200 = inttoptr i64 %t1199 to ptr
  call void @intrinsic_println(ptr %t1200)
  %t1201 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.289)
  %t1202 = ptrtoint ptr %t1201 to i64
  %t1203 = inttoptr i64 %t1202 to ptr
  call void @intrinsic_println(ptr %t1203)
  %t1204 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_boundary.290)
  %t1205 = ptrtoint ptr %t1204 to i64
  %t1206 = inttoptr i64 %t1205 to ptr
  call void @intrinsic_println(ptr %t1206)
  ret i64 0
}


; String constants
@.str.exp_chaos_boundary.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.2 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.3 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_boundary.5 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_chaos_boundary.6 = private unnamed_addr constant [40 x i8] c"  EXP 1: LOGISTIC MAP BIFURCATION SWEEP\00"
@.str.exp_chaos_boundary.7 = private unnamed_addr constant [47 x i8] c"  x_{n+1} = r * x * (1 - x),  r = 2.50 to 4.00\00"
@.str.exp_chaos_boundary.8 = private unnamed_addr constant [46 x i8] c"  D = avg |x_{n+1} - x_n| over last 500 steps\00"
@.str.exp_chaos_boundary.9 = private unnamed_addr constant [32 x i8] c"  V = normalised Lyapunov proxy\00"
@.str.exp_chaos_boundary.10 = private unnamed_addr constant [42 x i8] c"  S = convergence score from drift series\00"
@.str.exp_chaos_boundary.11 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_chaos_boundary.12 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.13 = private unnamed_addr constant [51 x i8] c"  r      D(drift)     V(lyap)      S(conv)   Class\00"
@.str.exp_chaos_boundary.14 = private unnamed_addr constant [57 x i8] c"  ----   ----------   ----------   --------   ----------\00"
@.str.exp_chaos_boundary.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.19 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.27 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_chaos_boundary.28 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_chaos_boundary.29 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_chaos_boundary.30 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_chaos_boundary.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.36 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_chaos_boundary.37 = private unnamed_addr constant [6 x i8] c"500.0\00"
@.str.exp_chaos_boundary.38 = private unnamed_addr constant [7 x i8] c"1000.0\00"
@.str.exp_chaos_boundary.39 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_chaos_boundary.40 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.41 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.42 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.43 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.45 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_chaos_boundary.46 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.47 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_chaos_boundary.48 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.49 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.50 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.51 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.52 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_chaos_boundary.53 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_chaos_boundary.54 = private unnamed_addr constant [6 x i8] c"ORDER\00"
@.str.exp_chaos_boundary.55 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_chaos_boundary.56 = private unnamed_addr constant [11 x i8] c"TRANSITION\00"
@.str.exp_chaos_boundary.57 = private unnamed_addr constant [6 x i8] c"CHAOS\00"
@.str.exp_chaos_boundary.58 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.59 = private unnamed_addr constant [28 x i8] c"  Known bifurcation points:\00"
@.str.exp_chaos_boundary.60 = private unnamed_addr constant [44 x i8] c"    r = 3.0:  onset of period-2 oscillation\00"
@.str.exp_chaos_boundary.61 = private unnamed_addr constant [33 x i8] c"    r = 3.449: onset of period-4\00"
@.str.exp_chaos_boundary.62 = private unnamed_addr constant [42 x i8] c"    r = 3.57: onset of chaos (Feigenbaum)\00"
@.str.exp_chaos_boundary.63 = private unnamed_addr constant [45 x i8] c"  Question: does S detect these transitions?\00"
@.str.exp_chaos_boundary.64 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.65 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_chaos_boundary.66 = private unnamed_addr constant [42 x i8] c"  EXP 2: LYAPUNOV EXPONENT (GROUND TRUTH)\00"
@.str.exp_chaos_boundary.67 = private unnamed_addr constant [36 x i8] c"  lambda = (1/n) * sum(ln|f'(x_i)|)\00"
@.str.exp_chaos_boundary.68 = private unnamed_addr constant [51 x i8] c"  lambda < 0: stable, = 0: bifurcation, > 0: chaos\00"
@.str.exp_chaos_boundary.69 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_chaos_boundary.70 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.71 = private unnamed_addr constant [44 x i8] c"  r      lambda       Class(LE)    Class(S)\00"
@.str.exp_chaos_boundary.72 = private unnamed_addr constant [46 x i8] c"  ----   ----------   ----------   ----------\00"
@.str.exp_chaos_boundary.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.74 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.76 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.78 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.79 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.80 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.81 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.82 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.83 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.85 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_chaos_boundary.86 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_chaos_boundary.87 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_chaos_boundary.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.89 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.92 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_chaos_boundary.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.94 = private unnamed_addr constant [5 x i8] c"23.0\00"
@.str.exp_chaos_boundary.95 = private unnamed_addr constant [7 x i8] c"5000.0\00"
@.str.exp_chaos_boundary.96 = private unnamed_addr constant [7 x i8] c"5000.0\00"
@.str.exp_chaos_boundary.97 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_chaos_boundary.98 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.99 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.100 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.101 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.102 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.103 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_chaos_boundary.104 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.105 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_chaos_boundary.106 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.107 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.108 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_chaos_boundary.109 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.110 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_chaos_boundary.111 = private unnamed_addr constant [12 x i8] c"STABLE     \00"
@.str.exp_chaos_boundary.112 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_chaos_boundary.113 = private unnamed_addr constant [12 x i8] c"BIFURC     \00"
@.str.exp_chaos_boundary.114 = private unnamed_addr constant [12 x i8] c"CHAOS      \00"
@.str.exp_chaos_boundary.115 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_chaos_boundary.116 = private unnamed_addr constant [6 x i8] c"ORDER\00"
@.str.exp_chaos_boundary.117 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_chaos_boundary.118 = private unnamed_addr constant [11 x i8] c"TRANSITION\00"
@.str.exp_chaos_boundary.119 = private unnamed_addr constant [6 x i8] c"CHAOS\00"
@.str.exp_chaos_boundary.120 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.121 = private unnamed_addr constant [31 x i8] c"  Agreement between LE and S: \00"
@.str.exp_chaos_boundary.122 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.exp_chaos_boundary.123 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.124 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.125 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_chaos_boundary.126 = private unnamed_addr constant [34 x i8] c"  EXP 3: HENON MAP CHAOS BOUNDARY\00"
@.str.exp_chaos_boundary.127 = private unnamed_addr constant [32 x i8] c"  x' = 1 - a*x^2 + y,  y' = b*x\00"
@.str.exp_chaos_boundary.128 = private unnamed_addr constant [40 x i8] c"  b = 0.3 fixed, sweep a = 0.50 to 1.50\00"
@.str.exp_chaos_boundary.129 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_chaos_boundary.130 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.131 = private unnamed_addr constant [51 x i8] c"  a      LE_approx    D(drift)     S(conv)   Class\00"
@.str.exp_chaos_boundary.132 = private unnamed_addr constant [57 x i8] c"  ----   ----------   ----------   --------   ----------\00"
@.str.exp_chaos_boundary.133 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.134 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_chaos_boundary.135 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.136 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.137 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.138 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.139 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.140 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.141 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.142 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.143 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.144 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.145 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.146 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.147 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_chaos_boundary.148 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_chaos_boundary.149 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_chaos_boundary.150 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_chaos_boundary.151 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.152 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.153 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.154 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.155 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.156 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_chaos_boundary.157 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_boundary.158 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_chaos_boundary.159 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_boundary.160 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.161 = private unnamed_addr constant [5 x i8] c"23.0\00"
@.str.exp_chaos_boundary.162 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.163 = private unnamed_addr constant [10 x i8] c"1000000.0\00"
@.str.exp_chaos_boundary.164 = private unnamed_addr constant [7 x i8] c"5000.0\00"
@.str.exp_chaos_boundary.165 = private unnamed_addr constant [7 x i8] c"5000.0\00"
@.str.exp_chaos_boundary.166 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_chaos_boundary.167 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.168 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.169 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.170 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.171 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.172 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_chaos_boundary.173 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.174 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_chaos_boundary.175 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.176 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.177 = private unnamed_addr constant [45 x i8] c"  ESCAPED    --           --        DIVERGED\00"
@.str.exp_chaos_boundary.178 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.179 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.180 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_chaos_boundary.181 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_chaos_boundary.182 = private unnamed_addr constant [6 x i8] c"ORDER\00"
@.str.exp_chaos_boundary.183 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.184 = private unnamed_addr constant [9 x i8] c"PERIODIC\00"
@.str.exp_chaos_boundary.185 = private unnamed_addr constant [6 x i8] c"CHAOS\00"
@.str.exp_chaos_boundary.186 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.187 = private unnamed_addr constant [50 x i8] c"  Classic Henon attractor: a=1.4, b=0.3 (chaotic)\00"
@.str.exp_chaos_boundary.188 = private unnamed_addr constant [34 x i8] c"  Chaos boundary is near a ~ 1.06\00"
@.str.exp_chaos_boundary.189 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.190 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_chaos_boundary.191 = private unnamed_addr constant [49 x i8] c"  EXP 4: EDGE OF CHAOS ZOOM (r = 3.500 to 3.600)\00"
@.str.exp_chaos_boundary.192 = private unnamed_addr constant [43 x i8] c"  The Feigenbaum point is at r ~ 3.5699...\00"
@.str.exp_chaos_boundary.193 = private unnamed_addr constant [55 x i8] c"  Looking for a critical S signature at the transition\00"
@.str.exp_chaos_boundary.194 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_chaos_boundary.195 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.196 = private unnamed_addr constant [55 x i8] c"  r        D(drift)     LE           S(conv)     Class\00"
@.str.exp_chaos_boundary.197 = private unnamed_addr constant [60 x i8] c"  ------   ----------   ----------   ---------   ----------\00"
@.str.exp_chaos_boundary.198 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.199 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.200 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.201 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.202 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.203 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.204 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.205 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.206 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.207 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.208 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.209 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.210 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.211 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.212 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.213 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_chaos_boundary.214 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.215 = private unnamed_addr constant [4 x i8] c"3.5\00"
@.str.exp_chaos_boundary.216 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_chaos_boundary.217 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_chaos_boundary.218 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.219 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.220 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.221 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.222 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_chaos_boundary.223 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.224 = private unnamed_addr constant [5 x i8] c"23.0\00"
@.str.exp_chaos_boundary.225 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_chaos_boundary.226 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_chaos_boundary.227 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_chaos_boundary.228 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.229 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.230 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.231 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_chaos_boundary.232 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.233 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_chaos_boundary.234 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.235 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_chaos_boundary.236 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.237 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.238 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.239 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_boundary.240 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_chaos_boundary.241 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_boundary.242 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_chaos_boundary.243 = private unnamed_addr constant [9 x i8] c"PERIODIC\00"
@.str.exp_chaos_boundary.244 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_chaos_boundary.245 = private unnamed_addr constant [9 x i8] c"CRITICAL\00"
@.str.exp_chaos_boundary.246 = private unnamed_addr constant [8 x i8] c"CHAOTIC\00"
@.str.exp_chaos_boundary.247 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.248 = private unnamed_addr constant [33 x i8] c"  --- Edge of Chaos Analysis ---\00"
@.str.exp_chaos_boundary.249 = private unnamed_addr constant [22 x i8] c"  Max |dS/dr| at r = \00"
@.str.exp_chaos_boundary.250 = private unnamed_addr constant [11 x i8] c"  (|dS| = \00"
@.str.exp_chaos_boundary.251 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_chaos_boundary.252 = private unnamed_addr constant [16 x i8] c"  Min S at r = \00"
@.str.exp_chaos_boundary.253 = private unnamed_addr constant [8 x i8] c"  (S = \00"
@.str.exp_chaos_boundary.254 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_chaos_boundary.255 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.256 = private unnamed_addr constant [46 x i8] c"  The Feigenbaum point (r ~ 3.5699) is where:\00"
@.str.exp_chaos_boundary.257 = private unnamed_addr constant [35 x i8] c"    - LE crosses zero (lambda = 0)\00"
@.str.exp_chaos_boundary.258 = private unnamed_addr constant [43 x i8] c"    - S should show maximum rate of change\00"
@.str.exp_chaos_boundary.259 = private unnamed_addr constant [53 x i8] c"    - Drift D transitions from periodic to aperiodic\00"
@.str.exp_chaos_boundary.260 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.261 = private unnamed_addr constant [52 x i8] c"  If max |dS/dr| occurs near r=3.57, then S detects\00"
@.str.exp_chaos_boundary.262 = private unnamed_addr constant [51 x i8] c"  the chaos boundary with a distinctive signature:\00"
@.str.exp_chaos_boundary.263 = private unnamed_addr constant [37 x i8] c"  a sharp drop in convergence score.\00"
@.str.exp_chaos_boundary.264 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_chaos_boundary.265 = private unnamed_addr constant [64 x i8] c"#  CHAOS BOUNDARY DETECTION EXPERIMENT                        #\00"
@.str.exp_chaos_boundary.266 = private unnamed_addr constant [64 x i8] c"#  Normalised Lyapunov + Convergence Score vs True LE         #\00"
@.str.exp_chaos_boundary.267 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_chaos_boundary.268 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.269 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.270 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_chaos_boundary.271 = private unnamed_addr constant [65 x i8] c"#  SUMMARY                                                     #\00"
@.str.exp_chaos_boundary.272 = private unnamed_addr constant [65 x i8] c"################################################################\00"
@.str.exp_chaos_boundary.273 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.274 = private unnamed_addr constant [59 x i8] c"  The convergence score S = 1 - (late_drift / early_drift)\00"
@.str.exp_chaos_boundary.275 = private unnamed_addr constant [39 x i8] c"  provides a practical chaos detector:\00"
@.str.exp_chaos_boundary.276 = private unnamed_addr constant [54 x i8] c"    S ~ 1.0 : system converges to fixed point (order)\00"
@.str.exp_chaos_boundary.277 = private unnamed_addr constant [64 x i8] c"    S ~ 0.0 : drift is constant = sustained oscillation (chaos)\00"
@.str.exp_chaos_boundary.278 = private unnamed_addr constant [53 x i8] c"    S < 0.0 : drift INCREASES over time (deep chaos)\00"
@.str.exp_chaos_boundary.279 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.280 = private unnamed_addr constant [16 x i8] c"  Key findings:\00"
@.str.exp_chaos_boundary.281 = private unnamed_addr constant [63 x i8] c"    1. S correctly identifies order (r<3.0) and chaos (r>3.57)\00"
@.str.exp_chaos_boundary.282 = private unnamed_addr constant [55 x i8] c"    2. The transition zone shows intermediate S values\00"
@.str.exp_chaos_boundary.283 = private unnamed_addr constant [63 x i8] c"    3. At the Feigenbaum point, S shows maximum rate of change\00"
@.str.exp_chaos_boundary.284 = private unnamed_addr constant [61 x i8] c"    4. S agrees with the Lyapunov exponent on classification\00"
@.str.exp_chaos_boundary.285 = private unnamed_addr constant [62 x i8] c"    5. For the Henon map, the same S metric identifies a~1.06\00"
@.str.exp_chaos_boundary.286 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_boundary.287 = private unnamed_addr constant [58 x i8] c"  The normalised Lyapunov proxy V and convergence score S\00"
@.str.exp_chaos_boundary.288 = private unnamed_addr constant [63 x i8] c"  together provide a dual characterisation of chaos boundaries\00"
@.str.exp_chaos_boundary.289 = private unnamed_addr constant [48 x i8] c"  without computing the true Lyapunov exponent.\00"
@.str.exp_chaos_boundary.290 = private unnamed_addr constant [65 x i8] c"################################################################\00"
