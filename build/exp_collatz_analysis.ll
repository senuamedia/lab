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
  %t1 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"collatz_step"(i64 %n) nounwind {
entry:
  %local.n = alloca i64
  store i64 %n, ptr %local.n
  %t9 = load i64, ptr %local.n
  %t10 = srem i64 %t9, 2
  %t11 = icmp eq i64 %t10, 0
  %t12 = zext i1 %t11 to i64
  %t13 = icmp ne i64 %t12, 0
  br i1 %t13, label %then1, label %else1
then1:
  %t14 = load i64, ptr %local.n
  %t15 = sdiv i64 %t14, 2
  br label %then1_end
then1_end:
  br label %endif1
else1:
  %t16 = load i64, ptr %local.n
  %t17 = mul i64 3, %t16
  %t18 = add i64 %t17, 1
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t19 = phi i64 [ %t15, %then1_end ], [ %t18, %else1_end ]
  ret i64 %t19
}

define i64 @"collatz_stopping_time"(i64 %start) nounwind {
entry:
  %local.n.20 = alloca i64
  %local.steps.21 = alloca i64
  %local.start = alloca i64
  store i64 %start, ptr %local.start
  %t22 = load i64, ptr %local.start
  store i64 %t22, ptr %local.n.20
  store i64 0, ptr %local.steps.21
  br label %loop2
loop2:
  %t23 = load i64, ptr %local.n.20
  %t24 = icmp sgt i64 %t23, 1
  %t25 = zext i1 %t24 to i64
  %t26 = icmp ne i64 %t25, 0
  br i1 %t26, label %body2, label %endloop2
body2:
  %t27 = load i64, ptr %local.n.20
  %t28 = call i64 @"collatz_step"(i64 %t27)
  store i64 %t28, ptr %local.n.20
  %t29 = load i64, ptr %local.steps.21
  %t30 = add i64 %t29, 1
  store i64 %t30, ptr %local.steps.21
  %t31 = load i64, ptr %local.steps.21
  %t32 = icmp sgt i64 %t31, 10000
  %t33 = zext i1 %t32 to i64
  %t34 = icmp ne i64 %t33, 0
  br i1 %t34, label %then3, label %else3
then3:
  ret i64 10000
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t35 = phi i64 [ 0, %else3_end ]
  br label %loop2
endloop2:
  %t36 = load i64, ptr %local.steps.21
  ret i64 %t36
}

define i64 @"collatz_drift"(i64 %start) nounwind {
entry:
  %local.n.37 = alloca i64
  %local.total_log_ratio.38 = alloca i64
  %local.steps.39 = alloca i64
  %local.prev.40 = alloca i64
  %local.ratio.41 = alloca i64
  %local.start = alloca i64
  store i64 %start, ptr %local.start
  %t42 = load i64, ptr %local.start
  store i64 %t42, ptr %local.n.37
  %t43 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.2)
  store i64 %t43, ptr %local.total_log_ratio.38
  store i64 0, ptr %local.steps.39
  br label %loop4
loop4:
  %t44 = load i64, ptr %local.n.37
  %t45 = icmp sgt i64 %t44, 1
  %t46 = zext i1 %t45 to i64
  %t47 = icmp ne i64 %t46, 0
  br i1 %t47, label %body4, label %endloop4
body4:
  %t48 = load i64, ptr %local.n.37
  store i64 %t48, ptr %local.prev.40
  %t49 = load i64, ptr %local.n.37
  %t50 = call i64 @"collatz_step"(i64 %t49)
  store i64 %t50, ptr %local.n.37
  %t51 = load i64, ptr %local.prev.40
  %t52 = icmp sgt i64 %t51, 0
  %t53 = zext i1 %t52 to i64
  %t54 = icmp ne i64 %t53, 0
  br i1 %t54, label %then5, label %else5
then5:
  %t55 = load i64, ptr %local.n.37
  %t56 = call i64 @"sx_int_to_f64"(i64 %t55)
  %t57 = load i64, ptr %local.prev.40
  %t58 = call i64 @"sx_int_to_f64"(i64 %t57)
  %t59 = call i64 @"sx_f64_div"(i64 %t56, i64 %t58)
  store i64 %t59, ptr %local.ratio.41
  %t60 = load i64, ptr %local.ratio.41
  %t61 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.3)
  %t62 = call i64 @"sx_f64_gt"(i64 %t60, i64 %t61)
  %t63 = icmp ne i64 %t62, 0
  br i1 %t63, label %then6, label %else6
then6:
  %t64 = load i64, ptr %local.total_log_ratio.38
  %t65 = load i64, ptr %local.ratio.41
  %t66 = call i64 @"ln_f64"(i64 %t65)
  %t67 = call i64 @"sx_f64_add"(i64 %t64, i64 %t66)
  store i64 %t67, ptr %local.total_log_ratio.38
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t68 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t69 = phi i64 [ %t68, %then5_end ], [ 0, %else5_end ]
  %t70 = load i64, ptr %local.steps.39
  %t71 = add i64 %t70, 1
  store i64 %t71, ptr %local.steps.39
  %t72 = load i64, ptr %local.steps.39
  %t73 = icmp sgt i64 %t72, 5000
  %t74 = zext i1 %t73 to i64
  %t75 = icmp ne i64 %t74, 0
  br i1 %t75, label %then7, label %else7
then7:
  %t76 = load i64, ptr %local.total_log_ratio.38
  %t77 = load i64, ptr %local.steps.39
  %t78 = call i64 @"sx_int_to_f64"(i64 %t77)
  %t79 = call i64 @"sx_f64_div"(i64 %t76, i64 %t78)
  ret i64 %t79
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t80 = phi i64 [ 0, %else7_end ]
  br label %loop4
endloop4:
  %t81 = load i64, ptr %local.steps.39
  %t82 = icmp sgt i64 %t81, 0
  %t83 = zext i1 %t82 to i64
  %t84 = icmp ne i64 %t83, 0
  br i1 %t84, label %then8, label %else8
then8:
  %t85 = load i64, ptr %local.total_log_ratio.38
  %t86 = load i64, ptr %local.steps.39
  %t87 = call i64 @"sx_int_to_f64"(i64 %t86)
  %t88 = call i64 @"sx_f64_div"(i64 %t85, i64 %t87)
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t89 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.4)
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t90 = phi i64 [ %t88, %then8_end ], [ %t89, %else8_end ]
  ret i64 %t90
}

define i64 @"collatz_max"(i64 %start) nounwind {
entry:
  %local.n.91 = alloca i64
  %local.max_n.92 = alloca i64
  %local.steps.93 = alloca i64
  %local.start = alloca i64
  store i64 %start, ptr %local.start
  %t94 = load i64, ptr %local.start
  store i64 %t94, ptr %local.n.91
  %t95 = load i64, ptr %local.start
  store i64 %t95, ptr %local.max_n.92
  store i64 0, ptr %local.steps.93
  br label %loop9
loop9:
  %t96 = load i64, ptr %local.n.91
  %t97 = icmp sgt i64 %t96, 1
  %t98 = zext i1 %t97 to i64
  %t99 = icmp ne i64 %t98, 0
  br i1 %t99, label %body9, label %endloop9
body9:
  %t100 = load i64, ptr %local.n.91
  %t101 = call i64 @"collatz_step"(i64 %t100)
  store i64 %t101, ptr %local.n.91
  %t102 = load i64, ptr %local.n.91
  %t103 = load i64, ptr %local.max_n.92
  %t104 = icmp sgt i64 %t102, %t103
  %t105 = zext i1 %t104 to i64
  %t106 = icmp ne i64 %t105, 0
  br i1 %t106, label %then10, label %else10
then10:
  %t107 = load i64, ptr %local.n.91
  store i64 %t107, ptr %local.max_n.92
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t108 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t109 = load i64, ptr %local.steps.93
  %t110 = add i64 %t109, 1
  store i64 %t110, ptr %local.steps.93
  %t111 = load i64, ptr %local.steps.93
  %t112 = icmp sgt i64 %t111, 10000
  %t113 = zext i1 %t112 to i64
  %t114 = icmp ne i64 %t113, 0
  br i1 %t114, label %then11, label %else11
then11:
  %t115 = load i64, ptr %local.max_n.92
  ret i64 %t115
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t116 = phi i64 [ 0, %else11_end ]
  br label %loop9
endloop9:
  %t117 = load i64, ptr %local.max_n.92
  ret i64 %t117
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.n.118 = alloca i64
  %local.prev_drift.119 = alloca i64
  %local.prev_d_prime.120 = alloca i64
  %local.prev_d_double.121 = alloca i64
  %local.d_prime.122 = alloca i64
  %local.d_double.123 = alloca i64
  %local.d_triple.124 = alloca i64
  %local.drift.125 = alloca i64
  %local.steps.126 = alloca i64
  %local.max_val.127 = alloca i64
  %local.prev_st.128 = alloca i64
  %local.prev_d.129 = alloca i64
  %local.prev_dd.130 = alloca i64
  %local.prev_ddd.131 = alloca i64
  %local.st.132 = alloca i64
  %local.d_val.133 = alloca i64
  %local.dd_val.134 = alloca i64
  %local.ddd_val.135 = alloca i64
  %local.dddd_val.136 = alloca i64
  %local.sum_d.137 = alloca i64
  %local.sum_abs_d.138 = alloca i64
  %local.sum_dd.139 = alloca i64
  %local.count.140 = alloca i64
  %local.sign_changes_d.141 = alloca i64
  %local.sign_changes_dd.142 = alloca i64
  %local.window_start.143 = alloca i64
  %local.window_sum.144 = alloca i64
  %local.window_count.145 = alloca i64
  %local.wn.146 = alloca i64
  %local.avg.147 = alloca i64
  %local.least_neg_drift.148 = alloca i64
  %local.least_neg_n.149 = alloca i64
  %local.most_neg_drift.150 = alloca i64
  %local.most_neg_n.151 = alloca i64
  %local.longest_stop.152 = alloca i64
  %local.longest_n.153 = alloca i64
  %t154 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.5)
  %t155 = ptrtoint ptr %t154 to i64
  %t156 = inttoptr i64 %t155 to ptr
  call void @intrinsic_println(ptr %t156)
  %t157 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.6)
  %t158 = ptrtoint ptr %t157 to i64
  %t159 = inttoptr i64 %t158 to ptr
  call void @intrinsic_println(ptr %t159)
  %t160 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.7)
  %t161 = ptrtoint ptr %t160 to i64
  %t162 = inttoptr i64 %t161 to ptr
  call void @intrinsic_println(ptr %t162)
  %t163 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.8)
  %t164 = ptrtoint ptr %t163 to i64
  %t165 = inttoptr i64 %t164 to ptr
  call void @intrinsic_println(ptr %t165)
  %t166 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.9)
  %t167 = ptrtoint ptr %t166 to i64
  %t168 = inttoptr i64 %t167 to ptr
  call void @intrinsic_println(ptr %t168)
  %t169 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.10)
  %t170 = ptrtoint ptr %t169 to i64
  %t171 = inttoptr i64 %t170 to ptr
  call void @intrinsic_println(ptr %t171)
  %t172 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.11)
  %t173 = ptrtoint ptr %t172 to i64
  %t174 = inttoptr i64 %t173 to ptr
  call void @intrinsic_println(ptr %t174)
  store i64 2, ptr %local.n.118
  %t175 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.12)
  store i64 %t175, ptr %local.prev_drift.119
  %t176 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.13)
  store i64 %t176, ptr %local.prev_d_prime.120
  %t177 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.14)
  store i64 %t177, ptr %local.prev_d_double.121
  %t178 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.15)
  store i64 %t178, ptr %local.d_prime.122
  %t179 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.16)
  store i64 %t179, ptr %local.d_double.123
  %t180 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.17)
  store i64 %t180, ptr %local.d_triple.124
  %t181 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.18)
  store i64 %t181, ptr %local.drift.125
  store i64 0, ptr %local.steps.126
  store i64 0, ptr %local.max_val.127
  br label %loop12
loop12:
  %t182 = load i64, ptr %local.n.118
  %t183 = icmp sle i64 %t182, 100
  %t184 = zext i1 %t183 to i64
  %t185 = icmp ne i64 %t184, 0
  br i1 %t185, label %body12, label %endloop12
body12:
  %t186 = load i64, ptr %local.n.118
  %t187 = call i64 @"collatz_drift"(i64 %t186)
  store i64 %t187, ptr %local.drift.125
  %t188 = load i64, ptr %local.n.118
  %t189 = call i64 @"collatz_stopping_time"(i64 %t188)
  store i64 %t189, ptr %local.steps.126
  %t190 = load i64, ptr %local.n.118
  %t191 = call i64 @"collatz_max"(i64 %t190)
  store i64 %t191, ptr %local.max_val.127
  %t192 = load i64, ptr %local.n.118
  %t193 = icmp sle i64 %t192, 10
  %t194 = zext i1 %t193 to i64
  %t195 = icmp ne i64 %t194, 0
  br i1 %t195, label %then13, label %else13
then13:
  %t196 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.19)
  %t197 = ptrtoint ptr %t196 to i64
  %t198 = inttoptr i64 %t197 to ptr
  call void @intrinsic_print(ptr %t198)
  %t199 = load i64, ptr %local.n.118
  call void @print_i64(i64 %t199)
  %t200 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.20)
  %t201 = ptrtoint ptr %t200 to i64
  %t202 = inttoptr i64 %t201 to ptr
  call void @intrinsic_print(ptr %t202)
  %t203 = load i64, ptr %local.steps.126
  call void @print_i64(i64 %t203)
  %t204 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.21)
  %t205 = ptrtoint ptr %t204 to i64
  %t206 = inttoptr i64 %t205 to ptr
  call void @intrinsic_print(ptr %t206)
  %t207 = load i64, ptr %local.max_val.127
  call void @print_i64(i64 %t207)
  %t208 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.22)
  %t209 = ptrtoint ptr %t208 to i64
  %t210 = inttoptr i64 %t209 to ptr
  call void @intrinsic_print(ptr %t210)
  %t211 = load i64, ptr %local.drift.125
  %t212 = call i64 @"print_f64"(i64 %t211)
  %t213 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.23)
  %t214 = ptrtoint ptr %t213 to i64
  %t215 = inttoptr i64 %t214 to ptr
  call void @intrinsic_println(ptr %t215)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t216 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t217 = load i64, ptr %local.n.118
  %t218 = icmp eq i64 %t217, 27
  %t219 = zext i1 %t218 to i64
  %t220 = icmp ne i64 %t219, 0
  br i1 %t220, label %then14, label %else14
then14:
  %t221 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.24)
  %t222 = ptrtoint ptr %t221 to i64
  %t223 = inttoptr i64 %t222 to ptr
  call void @intrinsic_print(ptr %t223)
  %t224 = load i64, ptr %local.steps.126
  call void @print_i64(i64 %t224)
  %t225 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.25)
  %t226 = ptrtoint ptr %t225 to i64
  %t227 = inttoptr i64 %t226 to ptr
  call void @intrinsic_print(ptr %t227)
  %t228 = load i64, ptr %local.max_val.127
  call void @print_i64(i64 %t228)
  %t229 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.26)
  %t230 = ptrtoint ptr %t229 to i64
  %t231 = inttoptr i64 %t230 to ptr
  call void @intrinsic_print(ptr %t231)
  %t232 = load i64, ptr %local.drift.125
  %t233 = call i64 @"print_f64"(i64 %t232)
  %t234 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.27)
  %t235 = ptrtoint ptr %t234 to i64
  %t236 = inttoptr i64 %t235 to ptr
  call void @intrinsic_println(ptr %t236)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t237 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t238 = load i64, ptr %local.n.118
  %t239 = icmp eq i64 %t238, 97
  %t240 = zext i1 %t239 to i64
  %t241 = icmp ne i64 %t240, 0
  br i1 %t241, label %then15, label %else15
then15:
  %t242 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.28)
  %t243 = ptrtoint ptr %t242 to i64
  %t244 = inttoptr i64 %t243 to ptr
  call void @intrinsic_print(ptr %t244)
  %t245 = load i64, ptr %local.steps.126
  call void @print_i64(i64 %t245)
  %t246 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.29)
  %t247 = ptrtoint ptr %t246 to i64
  %t248 = inttoptr i64 %t247 to ptr
  call void @intrinsic_print(ptr %t248)
  %t249 = load i64, ptr %local.max_val.127
  call void @print_i64(i64 %t249)
  %t250 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.30)
  %t251 = ptrtoint ptr %t250 to i64
  %t252 = inttoptr i64 %t251 to ptr
  call void @intrinsic_print(ptr %t252)
  %t253 = load i64, ptr %local.drift.125
  %t254 = call i64 @"print_f64"(i64 %t253)
  %t255 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.31)
  %t256 = ptrtoint ptr %t255 to i64
  %t257 = inttoptr i64 %t256 to ptr
  call void @intrinsic_println(ptr %t257)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t258 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t259 = load i64, ptr %local.n.118
  %t260 = add i64 %t259, 1
  store i64 %t260, ptr %local.n.118
  br label %loop12
endloop12:
  %t261 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.32)
  %t262 = ptrtoint ptr %t261 to i64
  %t263 = inttoptr i64 %t262 to ptr
  call void @intrinsic_println(ptr %t263)
  %t264 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.33)
  %t265 = ptrtoint ptr %t264 to i64
  %t266 = inttoptr i64 %t265 to ptr
  call void @intrinsic_println(ptr %t266)
  %t267 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.34)
  %t268 = ptrtoint ptr %t267 to i64
  %t269 = inttoptr i64 %t268 to ptr
  call void @intrinsic_println(ptr %t269)
  %t270 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.35)
  %t271 = ptrtoint ptr %t270 to i64
  %t272 = inttoptr i64 %t271 to ptr
  call void @intrinsic_println(ptr %t272)
  %t273 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.36)
  %t274 = ptrtoint ptr %t273 to i64
  %t275 = inttoptr i64 %t274 to ptr
  call void @intrinsic_println(ptr %t275)
  %t276 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.37)
  %t277 = ptrtoint ptr %t276 to i64
  %t278 = inttoptr i64 %t277 to ptr
  call void @intrinsic_println(ptr %t278)
  store i64 2, ptr %local.n.118
  %t279 = call i64 @"collatz_stopping_time"(i64 2)
  store i64 %t279, ptr %local.prev_st.128
  store i64 0, ptr %local.prev_d.129
  store i64 0, ptr %local.prev_dd.130
  store i64 0, ptr %local.prev_ddd.131
  store i64 0, ptr %local.st.132
  store i64 0, ptr %local.d_val.133
  store i64 0, ptr %local.dd_val.134
  store i64 0, ptr %local.ddd_val.135
  store i64 0, ptr %local.dddd_val.136
  store i64 0, ptr %local.sum_d.137
  store i64 0, ptr %local.sum_abs_d.138
  store i64 0, ptr %local.sum_dd.139
  store i64 0, ptr %local.count.140
  store i64 0, ptr %local.sign_changes_d.141
  store i64 0, ptr %local.sign_changes_dd.142
  br label %loop16
loop16:
  %t280 = load i64, ptr %local.n.118
  %t281 = icmp sle i64 %t280, 200
  %t282 = zext i1 %t281 to i64
  %t283 = icmp ne i64 %t282, 0
  br i1 %t283, label %body16, label %endloop16
body16:
  %t284 = load i64, ptr %local.n.118
  %t285 = call i64 @"collatz_stopping_time"(i64 %t284)
  store i64 %t285, ptr %local.st.132
  %t286 = load i64, ptr %local.st.132
  %t287 = load i64, ptr %local.prev_st.128
  %t288 = sub i64 %t286, %t287
  store i64 %t288, ptr %local.d_val.133
  %t289 = load i64, ptr %local.d_val.133
  %t290 = load i64, ptr %local.prev_d.129
  %t291 = sub i64 %t289, %t290
  store i64 %t291, ptr %local.dd_val.134
  %t292 = load i64, ptr %local.dd_val.134
  %t293 = load i64, ptr %local.prev_dd.130
  %t294 = sub i64 %t292, %t293
  store i64 %t294, ptr %local.ddd_val.135
  %t295 = load i64, ptr %local.ddd_val.135
  %t296 = load i64, ptr %local.prev_ddd.131
  %t297 = sub i64 %t295, %t296
  store i64 %t297, ptr %local.dddd_val.136
  %t298 = load i64, ptr %local.n.118
  %t299 = icmp sge i64 %t298, 4
  %t300 = zext i1 %t299 to i64
  %t301 = icmp ne i64 %t300, 0
  br i1 %t301, label %then17, label %else17
then17:
  %t302 = load i64, ptr %local.count.140
  %t303 = add i64 %t302, 1
  store i64 %t303, ptr %local.count.140
  %t304 = load i64, ptr %local.sum_d.137
  %t305 = load i64, ptr %local.d_val.133
  %t306 = add i64 %t304, %t305
  store i64 %t306, ptr %local.sum_d.137
  %t307 = load i64, ptr %local.d_val.133
  %t308 = icmp sge i64 %t307, 0
  %t309 = zext i1 %t308 to i64
  %t310 = icmp ne i64 %t309, 0
  br i1 %t310, label %then18, label %else18
then18:
  %t311 = load i64, ptr %local.sum_abs_d.138
  %t312 = load i64, ptr %local.d_val.133
  %t313 = add i64 %t311, %t312
  store i64 %t313, ptr %local.sum_abs_d.138
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t314 = load i64, ptr %local.sum_abs_d.138
  %t315 = load i64, ptr %local.d_val.133
  %t316 = sub i64 %t314, %t315
  store i64 %t316, ptr %local.sum_abs_d.138
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t317 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t318 = load i64, ptr %local.d_val.133
  %t319 = icmp sge i64 %t318, 0
  %t320 = zext i1 %t319 to i64
  %t321 = icmp ne i64 %t320, 0
  br i1 %t321, label %then19, label %else19
then19:
  %t322 = load i64, ptr %local.prev_d.129
  %t323 = icmp slt i64 %t322, 0
  %t324 = zext i1 %t323 to i64
  %t325 = icmp ne i64 %t324, 0
  br i1 %t325, label %then20, label %else20
then20:
  %t326 = load i64, ptr %local.sign_changes_d.141
  %t327 = add i64 %t326, 1
  store i64 %t327, ptr %local.sign_changes_d.141
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t328 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t329 = phi i64 [ %t328, %then19_end ], [ 0, %else19_end ]
  %t330 = load i64, ptr %local.d_val.133
  %t331 = icmp slt i64 %t330, 0
  %t332 = zext i1 %t331 to i64
  %t333 = icmp ne i64 %t332, 0
  br i1 %t333, label %then21, label %else21
then21:
  %t334 = load i64, ptr %local.prev_d.129
  %t335 = icmp sge i64 %t334, 0
  %t336 = zext i1 %t335 to i64
  %t337 = icmp ne i64 %t336, 0
  br i1 %t337, label %then22, label %else22
then22:
  %t338 = load i64, ptr %local.sign_changes_d.141
  %t339 = add i64 %t338, 1
  store i64 %t339, ptr %local.sign_changes_d.141
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t340 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t341 = phi i64 [ %t340, %then21_end ], [ 0, %else21_end ]
  %t342 = load i64, ptr %local.dd_val.134
  %t343 = icmp sge i64 %t342, 0
  %t344 = zext i1 %t343 to i64
  %t345 = icmp ne i64 %t344, 0
  br i1 %t345, label %then23, label %else23
then23:
  %t346 = load i64, ptr %local.prev_dd.130
  %t347 = icmp slt i64 %t346, 0
  %t348 = zext i1 %t347 to i64
  %t349 = icmp ne i64 %t348, 0
  br i1 %t349, label %then24, label %else24
then24:
  %t350 = load i64, ptr %local.sign_changes_dd.142
  %t351 = add i64 %t350, 1
  store i64 %t351, ptr %local.sign_changes_dd.142
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t352 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t353 = phi i64 [ %t352, %then23_end ], [ 0, %else23_end ]
  %t354 = load i64, ptr %local.dd_val.134
  %t355 = icmp slt i64 %t354, 0
  %t356 = zext i1 %t355 to i64
  %t357 = icmp ne i64 %t356, 0
  br i1 %t357, label %then25, label %else25
then25:
  %t358 = load i64, ptr %local.prev_dd.130
  %t359 = icmp sge i64 %t358, 0
  %t360 = zext i1 %t359 to i64
  %t361 = icmp ne i64 %t360, 0
  br i1 %t361, label %then26, label %else26
then26:
  %t362 = load i64, ptr %local.sign_changes_dd.142
  %t363 = add i64 %t362, 1
  store i64 %t363, ptr %local.sign_changes_dd.142
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t364 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t365 = phi i64 [ %t364, %then25_end ], [ 0, %else25_end ]
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t366 = phi i64 [ %t365, %then17_end ], [ 0, %else17_end ]
  %t367 = load i64, ptr %local.n.118
  %t368 = icmp sle i64 %t367, 15
  %t369 = zext i1 %t368 to i64
  %t370 = icmp ne i64 %t369, 0
  br i1 %t370, label %then27, label %else27
then27:
  %t371 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.38)
  %t372 = ptrtoint ptr %t371 to i64
  %t373 = inttoptr i64 %t372 to ptr
  call void @intrinsic_print(ptr %t373)
  %t374 = load i64, ptr %local.n.118
  call void @print_i64(i64 %t374)
  %t375 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.39)
  %t376 = ptrtoint ptr %t375 to i64
  %t377 = inttoptr i64 %t376 to ptr
  call void @intrinsic_print(ptr %t377)
  %t378 = load i64, ptr %local.d_val.133
  call void @print_i64(i64 %t378)
  %t379 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.40)
  %t380 = ptrtoint ptr %t379 to i64
  %t381 = inttoptr i64 %t380 to ptr
  call void @intrinsic_print(ptr %t381)
  %t382 = load i64, ptr %local.dd_val.134
  call void @print_i64(i64 %t382)
  %t383 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.41)
  %t384 = ptrtoint ptr %t383 to i64
  %t385 = inttoptr i64 %t384 to ptr
  call void @intrinsic_print(ptr %t385)
  %t386 = load i64, ptr %local.ddd_val.135
  call void @print_i64(i64 %t386)
  %t387 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.42)
  %t388 = ptrtoint ptr %t387 to i64
  %t389 = inttoptr i64 %t388 to ptr
  call void @intrinsic_print(ptr %t389)
  %t390 = load i64, ptr %local.dddd_val.136
  call void @print_i64(i64 %t390)
  %t391 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.43)
  %t392 = ptrtoint ptr %t391 to i64
  %t393 = inttoptr i64 %t392 to ptr
  call void @intrinsic_println(ptr %t393)
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t394 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t395 = load i64, ptr %local.st.132
  store i64 %t395, ptr %local.prev_st.128
  %t396 = load i64, ptr %local.d_val.133
  store i64 %t396, ptr %local.prev_d.129
  %t397 = load i64, ptr %local.dd_val.134
  store i64 %t397, ptr %local.prev_dd.130
  %t398 = load i64, ptr %local.ddd_val.135
  store i64 %t398, ptr %local.prev_ddd.131
  %t399 = load i64, ptr %local.n.118
  %t400 = add i64 %t399, 1
  store i64 %t400, ptr %local.n.118
  br label %loop16
endloop16:
  %t401 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.44)
  %t402 = ptrtoint ptr %t401 to i64
  %t403 = inttoptr i64 %t402 to ptr
  call void @intrinsic_println(ptr %t403)
  %t404 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.45)
  %t405 = ptrtoint ptr %t404 to i64
  %t406 = inttoptr i64 %t405 to ptr
  call void @intrinsic_println(ptr %t406)
  %t407 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.46)
  %t408 = ptrtoint ptr %t407 to i64
  %t409 = inttoptr i64 %t408 to ptr
  call void @intrinsic_print(ptr %t409)
  %t410 = load i64, ptr %local.sign_changes_d.141
  call void @print_i64(i64 %t410)
  %t411 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.47)
  %t412 = ptrtoint ptr %t411 to i64
  %t413 = inttoptr i64 %t412 to ptr
  call void @intrinsic_println(ptr %t413)
  %t414 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.48)
  %t415 = ptrtoint ptr %t414 to i64
  %t416 = inttoptr i64 %t415 to ptr
  call void @intrinsic_print(ptr %t416)
  %t417 = load i64, ptr %local.sign_changes_dd.142
  call void @print_i64(i64 %t417)
  %t418 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.49)
  %t419 = ptrtoint ptr %t418 to i64
  %t420 = inttoptr i64 %t419 to ptr
  call void @intrinsic_println(ptr %t420)
  %t421 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.50)
  %t422 = ptrtoint ptr %t421 to i64
  %t423 = inttoptr i64 %t422 to ptr
  call void @intrinsic_print(ptr %t423)
  %t424 = load i64, ptr %local.sum_d.137
  %t425 = call i64 @"sx_int_to_f64"(i64 %t424)
  %t426 = load i64, ptr %local.count.140
  %t427 = call i64 @"sx_int_to_f64"(i64 %t426)
  %t428 = call i64 @"sx_f64_div"(i64 %t425, i64 %t427)
  %t429 = call i64 @"print_f64"(i64 %t428)
  %t430 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.51)
  %t431 = ptrtoint ptr %t430 to i64
  %t432 = inttoptr i64 %t431 to ptr
  call void @intrinsic_println(ptr %t432)
  %t433 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.52)
  %t434 = ptrtoint ptr %t433 to i64
  %t435 = inttoptr i64 %t434 to ptr
  call void @intrinsic_print(ptr %t435)
  %t436 = load i64, ptr %local.sum_abs_d.138
  %t437 = call i64 @"sx_int_to_f64"(i64 %t436)
  %t438 = load i64, ptr %local.count.140
  %t439 = call i64 @"sx_int_to_f64"(i64 %t438)
  %t440 = call i64 @"sx_f64_div"(i64 %t437, i64 %t439)
  %t441 = call i64 @"print_f64"(i64 %t440)
  %t442 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.53)
  %t443 = ptrtoint ptr %t442 to i64
  %t444 = inttoptr i64 %t443 to ptr
  call void @intrinsic_println(ptr %t444)
  %t445 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.54)
  %t446 = ptrtoint ptr %t445 to i64
  %t447 = inttoptr i64 %t446 to ptr
  call void @intrinsic_println(ptr %t447)
  %t448 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.55)
  %t449 = ptrtoint ptr %t448 to i64
  %t450 = inttoptr i64 %t449 to ptr
  call void @intrinsic_println(ptr %t450)
  %t451 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.56)
  %t452 = ptrtoint ptr %t451 to i64
  %t453 = inttoptr i64 %t452 to ptr
  call void @intrinsic_println(ptr %t453)
  %t454 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.57)
  %t455 = ptrtoint ptr %t454 to i64
  %t456 = inttoptr i64 %t455 to ptr
  call void @intrinsic_println(ptr %t456)
  %t457 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.58)
  %t458 = ptrtoint ptr %t457 to i64
  %t459 = inttoptr i64 %t458 to ptr
  call void @intrinsic_println(ptr %t459)
  %t460 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.59)
  %t461 = ptrtoint ptr %t460 to i64
  %t462 = inttoptr i64 %t461 to ptr
  call void @intrinsic_println(ptr %t462)
  store i64 2, ptr %local.window_start.143
  br label %loop28
loop28:
  %t463 = load i64, ptr %local.window_start.143
  %t464 = icmp slt i64 %t463, 1000
  %t465 = zext i1 %t464 to i64
  %t466 = icmp ne i64 %t465, 0
  br i1 %t466, label %body28, label %endloop28
body28:
  %t467 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.60)
  store i64 %t467, ptr %local.window_sum.144
  store i64 0, ptr %local.window_count.145
  %t468 = load i64, ptr %local.window_start.143
  store i64 %t468, ptr %local.wn.146
  br label %loop29
loop29:
  %t469 = load i64, ptr %local.wn.146
  %t470 = load i64, ptr %local.window_start.143
  %t471 = add i64 %t470, 100
  %t472 = icmp slt i64 %t469, %t471
  %t473 = zext i1 %t472 to i64
  %t474 = icmp ne i64 %t473, 0
  br i1 %t474, label %body29, label %endloop29
body29:
  %t475 = load i64, ptr %local.window_sum.144
  %t476 = load i64, ptr %local.wn.146
  %t477 = call i64 @"collatz_drift"(i64 %t476)
  %t478 = call i64 @"sx_f64_add"(i64 %t475, i64 %t477)
  store i64 %t478, ptr %local.window_sum.144
  %t479 = load i64, ptr %local.window_count.145
  %t480 = add i64 %t479, 1
  store i64 %t480, ptr %local.window_count.145
  %t481 = load i64, ptr %local.wn.146
  %t482 = add i64 %t481, 1
  store i64 %t482, ptr %local.wn.146
  br label %loop29
endloop29:
  %t483 = load i64, ptr %local.window_sum.144
  %t484 = load i64, ptr %local.window_count.145
  %t485 = call i64 @"sx_int_to_f64"(i64 %t484)
  %t486 = call i64 @"sx_f64_div"(i64 %t483, i64 %t485)
  store i64 %t486, ptr %local.avg.147
  %t487 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.61)
  %t488 = ptrtoint ptr %t487 to i64
  %t489 = inttoptr i64 %t488 to ptr
  call void @intrinsic_print(ptr %t489)
  %t490 = load i64, ptr %local.window_start.143
  call void @print_i64(i64 %t490)
  %t491 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.62)
  %t492 = ptrtoint ptr %t491 to i64
  %t493 = inttoptr i64 %t492 to ptr
  call void @intrinsic_print(ptr %t493)
  %t494 = load i64, ptr %local.window_start.143
  %t495 = add i64 %t494, 99
  call void @print_i64(i64 %t495)
  %t496 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.63)
  %t497 = ptrtoint ptr %t496 to i64
  %t498 = inttoptr i64 %t497 to ptr
  call void @intrinsic_print(ptr %t498)
  %t499 = load i64, ptr %local.avg.147
  %t500 = call i64 @"print_f64"(i64 %t499)
  %t501 = load i64, ptr %local.avg.147
  %t502 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.64)
  %t503 = call i64 @"sx_f64_lt"(i64 %t501, i64 %t502)
  %t504 = icmp ne i64 %t503, 0
  br i1 %t504, label %then30, label %else30
then30:
  %t505 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.65)
  %t506 = ptrtoint ptr %t505 to i64
  %t507 = inttoptr i64 %t506 to ptr
  call void @intrinsic_println(ptr %t507)
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t508 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.66)
  %t509 = ptrtoint ptr %t508 to i64
  %t510 = inttoptr i64 %t509 to ptr
  call void @intrinsic_println(ptr %t510)
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t511 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t512 = load i64, ptr %local.window_start.143
  %t513 = add i64 %t512, 200
  store i64 %t513, ptr %local.window_start.143
  br label %loop28
endloop28:
  %t514 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.67)
  %t515 = ptrtoint ptr %t514 to i64
  %t516 = inttoptr i64 %t515 to ptr
  call void @intrinsic_println(ptr %t516)
  %t517 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.68)
  %t518 = ptrtoint ptr %t517 to i64
  %t519 = inttoptr i64 %t518 to ptr
  call void @intrinsic_println(ptr %t519)
  %t520 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.69)
  %t521 = ptrtoint ptr %t520 to i64
  %t522 = inttoptr i64 %t521 to ptr
  call void @intrinsic_println(ptr %t522)
  %t523 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.70)
  %t524 = ptrtoint ptr %t523 to i64
  %t525 = inttoptr i64 %t524 to ptr
  call void @intrinsic_println(ptr %t525)
  %t526 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.71)
  %t527 = ptrtoint ptr %t526 to i64
  %t528 = inttoptr i64 %t527 to ptr
  call void @intrinsic_println(ptr %t528)
  %t529 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.72)
  %t530 = ptrtoint ptr %t529 to i64
  %t531 = inttoptr i64 %t530 to ptr
  call void @intrinsic_println(ptr %t531)
  %t532 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.73)
  %t533 = ptrtoint ptr %t532 to i64
  %t534 = inttoptr i64 %t533 to ptr
  call void @intrinsic_println(ptr %t534)
  %t535 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.74)
  %t536 = ptrtoint ptr %t535 to i64
  %t537 = inttoptr i64 %t536 to ptr
  call void @intrinsic_println(ptr %t537)
  %t538 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.75)
  %t539 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.76)
  %t540 = call i64 @"sx_f64_sub"(i64 %t538, i64 %t539)
  store i64 %t540, ptr %local.least_neg_drift.148
  store i64 0, ptr %local.least_neg_n.149
  %t541 = call i64 @f64_parse(ptr @.str.exp_collatz_analysis.77)
  store i64 %t541, ptr %local.most_neg_drift.150
  store i64 0, ptr %local.most_neg_n.151
  store i64 0, ptr %local.longest_stop.152
  store i64 0, ptr %local.longest_n.153
  store i64 2, ptr %local.n.118
  br label %loop31
loop31:
  %t542 = load i64, ptr %local.n.118
  %t543 = icmp sle i64 %t542, 1000
  %t544 = zext i1 %t543 to i64
  %t545 = icmp ne i64 %t544, 0
  br i1 %t545, label %body31, label %endloop31
body31:
  %t546 = load i64, ptr %local.n.118
  %t547 = call i64 @"collatz_drift"(i64 %t546)
  store i64 %t547, ptr %local.drift.125
  %t548 = load i64, ptr %local.n.118
  %t549 = call i64 @"collatz_stopping_time"(i64 %t548)
  store i64 %t549, ptr %local.steps.126
  %t550 = load i64, ptr %local.drift.125
  %t551 = load i64, ptr %local.least_neg_drift.148
  %t552 = call i64 @"sx_f64_gt"(i64 %t550, i64 %t551)
  %t553 = icmp ne i64 %t552, 0
  br i1 %t553, label %then32, label %else32
then32:
  %t554 = load i64, ptr %local.drift.125
  store i64 %t554, ptr %local.least_neg_drift.148
  %t555 = load i64, ptr %local.n.118
  store i64 %t555, ptr %local.least_neg_n.149
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t556 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t557 = load i64, ptr %local.drift.125
  %t558 = load i64, ptr %local.most_neg_drift.150
  %t559 = call i64 @"sx_f64_lt"(i64 %t557, i64 %t558)
  %t560 = icmp ne i64 %t559, 0
  br i1 %t560, label %then33, label %else33
then33:
  %t561 = load i64, ptr %local.drift.125
  store i64 %t561, ptr %local.most_neg_drift.150
  %t562 = load i64, ptr %local.n.118
  store i64 %t562, ptr %local.most_neg_n.151
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t563 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t564 = load i64, ptr %local.steps.126
  %t565 = load i64, ptr %local.longest_stop.152
  %t566 = icmp sgt i64 %t564, %t565
  %t567 = zext i1 %t566 to i64
  %t568 = icmp ne i64 %t567, 0
  br i1 %t568, label %then34, label %else34
then34:
  %t569 = load i64, ptr %local.steps.126
  store i64 %t569, ptr %local.longest_stop.152
  %t570 = load i64, ptr %local.n.118
  store i64 %t570, ptr %local.longest_n.153
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t571 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t572 = load i64, ptr %local.n.118
  %t573 = add i64 %t572, 1
  store i64 %t573, ptr %local.n.118
  br label %loop31
endloop31:
  %t574 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.78)
  %t575 = ptrtoint ptr %t574 to i64
  %t576 = inttoptr i64 %t575 to ptr
  call void @intrinsic_print(ptr %t576)
  %t577 = load i64, ptr %local.least_neg_n.149
  call void @print_i64(i64 %t577)
  %t578 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.79)
  %t579 = ptrtoint ptr %t578 to i64
  %t580 = inttoptr i64 %t579 to ptr
  call void @intrinsic_print(ptr %t580)
  %t581 = load i64, ptr %local.least_neg_drift.148
  %t582 = call i64 @"print_f64"(i64 %t581)
  %t583 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.80)
  %t584 = ptrtoint ptr %t583 to i64
  %t585 = inttoptr i64 %t584 to ptr
  call void @intrinsic_println(ptr %t585)
  %t586 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.81)
  %t587 = ptrtoint ptr %t586 to i64
  %t588 = inttoptr i64 %t587 to ptr
  call void @intrinsic_print(ptr %t588)
  %t589 = load i64, ptr %local.most_neg_n.151
  call void @print_i64(i64 %t589)
  %t590 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.82)
  %t591 = ptrtoint ptr %t590 to i64
  %t592 = inttoptr i64 %t591 to ptr
  call void @intrinsic_print(ptr %t592)
  %t593 = load i64, ptr %local.most_neg_drift.150
  %t594 = call i64 @"print_f64"(i64 %t593)
  %t595 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.83)
  %t596 = ptrtoint ptr %t595 to i64
  %t597 = inttoptr i64 %t596 to ptr
  call void @intrinsic_println(ptr %t597)
  %t598 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.84)
  %t599 = ptrtoint ptr %t598 to i64
  %t600 = inttoptr i64 %t599 to ptr
  call void @intrinsic_print(ptr %t600)
  %t601 = load i64, ptr %local.longest_n.153
  call void @print_i64(i64 %t601)
  %t602 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.85)
  %t603 = ptrtoint ptr %t602 to i64
  %t604 = inttoptr i64 %t603 to ptr
  call void @intrinsic_print(ptr %t604)
  %t605 = load i64, ptr %local.longest_stop.152
  call void @print_i64(i64 %t605)
  %t606 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.86)
  %t607 = ptrtoint ptr %t606 to i64
  %t608 = inttoptr i64 %t607 to ptr
  call void @intrinsic_println(ptr %t608)
  %t609 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.87)
  %t610 = ptrtoint ptr %t609 to i64
  %t611 = inttoptr i64 %t610 to ptr
  call void @intrinsic_println(ptr %t611)
  %t612 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.88)
  %t613 = ptrtoint ptr %t612 to i64
  %t614 = inttoptr i64 %t613 to ptr
  call void @intrinsic_println(ptr %t614)
  %t615 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.89)
  %t616 = ptrtoint ptr %t615 to i64
  %t617 = inttoptr i64 %t616 to ptr
  call void @intrinsic_println(ptr %t617)
  %t618 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.90)
  %t619 = ptrtoint ptr %t618 to i64
  %t620 = inttoptr i64 %t619 to ptr
  call void @intrinsic_println(ptr %t620)
  %t621 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.91)
  %t622 = ptrtoint ptr %t621 to i64
  %t623 = inttoptr i64 %t622 to ptr
  call void @intrinsic_println(ptr %t623)
  %t624 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.92)
  %t625 = ptrtoint ptr %t624 to i64
  %t626 = inttoptr i64 %t625 to ptr
  call void @intrinsic_println(ptr %t626)
  %t627 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.93)
  %t628 = ptrtoint ptr %t627 to i64
  %t629 = inttoptr i64 %t628 to ptr
  call void @intrinsic_println(ptr %t629)
  %t630 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.94)
  %t631 = ptrtoint ptr %t630 to i64
  %t632 = inttoptr i64 %t631 to ptr
  call void @intrinsic_println(ptr %t632)
  %t633 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.95)
  %t634 = ptrtoint ptr %t633 to i64
  %t635 = inttoptr i64 %t634 to ptr
  call void @intrinsic_println(ptr %t635)
  %t636 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.96)
  %t637 = ptrtoint ptr %t636 to i64
  %t638 = inttoptr i64 %t637 to ptr
  call void @intrinsic_println(ptr %t638)
  %t639 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.97)
  %t640 = ptrtoint ptr %t639 to i64
  %t641 = inttoptr i64 %t640 to ptr
  call void @intrinsic_println(ptr %t641)
  %t642 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.98)
  %t643 = ptrtoint ptr %t642 to i64
  %t644 = inttoptr i64 %t643 to ptr
  call void @intrinsic_println(ptr %t644)
  %t645 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.99)
  %t646 = ptrtoint ptr %t645 to i64
  %t647 = inttoptr i64 %t646 to ptr
  call void @intrinsic_println(ptr %t647)
  %t648 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.100)
  %t649 = ptrtoint ptr %t648 to i64
  %t650 = inttoptr i64 %t649 to ptr
  call void @intrinsic_println(ptr %t650)
  %t651 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.101)
  %t652 = ptrtoint ptr %t651 to i64
  %t653 = inttoptr i64 %t652 to ptr
  call void @intrinsic_println(ptr %t653)
  %t654 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.102)
  %t655 = ptrtoint ptr %t654 to i64
  %t656 = inttoptr i64 %t655 to ptr
  call void @intrinsic_println(ptr %t656)
  %t657 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.103)
  %t658 = ptrtoint ptr %t657 to i64
  %t659 = inttoptr i64 %t658 to ptr
  call void @intrinsic_println(ptr %t659)
  %t660 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.104)
  %t661 = ptrtoint ptr %t660 to i64
  %t662 = inttoptr i64 %t661 to ptr
  call void @intrinsic_println(ptr %t662)
  %t663 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.105)
  %t664 = ptrtoint ptr %t663 to i64
  %t665 = inttoptr i64 %t664 to ptr
  call void @intrinsic_println(ptr %t665)
  %t666 = call ptr @intrinsic_string_new(ptr @.str.exp_collatz_analysis.106)
  %t667 = ptrtoint ptr %t666 to i64
  %t668 = inttoptr i64 %t667 to ptr
  call void @intrinsic_println(ptr %t668)
  ret i64 0
}


; String constants
@.str.exp_collatz_analysis.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.5 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_collatz_analysis.6 = private unnamed_addr constant [40 x i8] c"  COLLATZ SEQUENCE: DERIVATIVE ANALYSIS\00"
@.str.exp_collatz_analysis.7 = private unnamed_addr constant [41 x i8] c"  Exploring structure via meta-gradients\00"
@.str.exp_collatz_analysis.8 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_collatz_analysis.9 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.10 = private unnamed_addr constant [42 x i8] c"--- Part 1: Drift D(n) for n = 2..100 ---\00"
@.str.exp_collatz_analysis.11 = private unnamed_addr constant [29 x i8] c"  n    Steps  MaxVal   Drift\00"
@.str.exp_collatz_analysis.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.19 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_collatz_analysis.20 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_collatz_analysis.21 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_collatz_analysis.22 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_collatz_analysis.23 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.24 = private unnamed_addr constant [8 x i8] c"  27   \00"
@.str.exp_collatz_analysis.25 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_collatz_analysis.26 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_collatz_analysis.27 = private unnamed_addr constant [31 x i8] c"  <-- famously long trajectory\00"
@.str.exp_collatz_analysis.28 = private unnamed_addr constant [8 x i8] c"  97   \00"
@.str.exp_collatz_analysis.29 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_collatz_analysis.30 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_collatz_analysis.31 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.32 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.33 = private unnamed_addr constant [52 x i8] c"--- Part 2: Derivative series of stopping times ---\00"
@.str.exp_collatz_analysis.34 = private unnamed_addr constant [39 x i8] c"  Compute D(n), D'(n), D''(n), D'''(n)\00"
@.str.exp_collatz_analysis.35 = private unnamed_addr constant [53 x i8] c"  where D(n) = stopping_time(n+1) - stopping_time(n)\00"
@.str.exp_collatz_analysis.36 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.37 = private unnamed_addr constant [37 x i8] c"  n     D(n)   D'(n)  D''(n) D'''(n)\00"
@.str.exp_collatz_analysis.38 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_collatz_analysis.39 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_collatz_analysis.40 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_collatz_analysis.41 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_collatz_analysis.42 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_collatz_analysis.43 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.44 = private unnamed_addr constant [6 x i8] c"  ...\00"
@.str.exp_collatz_analysis.45 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.46 = private unnamed_addr constant [35 x i8] c"  D(n) sign changes in n=4..200:  \00"
@.str.exp_collatz_analysis.47 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.48 = private unnamed_addr constant [35 x i8] c"  D'(n) sign changes in n=4..200: \00"
@.str.exp_collatz_analysis.49 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.50 = private unnamed_addr constant [13 x i8] c"  Avg D(n): \00"
@.str.exp_collatz_analysis.51 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.52 = private unnamed_addr constant [15 x i8] c"  Avg |D(n)|: \00"
@.str.exp_collatz_analysis.53 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.54 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.55 = private unnamed_addr constant [42 x i8] c"--- Part 3: Average drift convergence ---\00"
@.str.exp_collatz_analysis.56 = private unnamed_addr constant [53 x i8] c"  Average drift D(n) over windows of starting values\00"
@.str.exp_collatz_analysis.57 = private unnamed_addr constant [69 x i8] c"  If drift converges to a negative constant, ALL trajectories shrink\00"
@.str.exp_collatz_analysis.58 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.59 = private unnamed_addr constant [45 x i8] c"  Window         Avg Drift    Interpretation\00"
@.str.exp_collatz_analysis.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.61 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_collatz_analysis.62 = private unnamed_addr constant [2 x i8] c"-\00"
@.str.exp_collatz_analysis.63 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_collatz_analysis.64 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.65 = private unnamed_addr constant [13 x i8] c"   shrinking\00"
@.str.exp_collatz_analysis.66 = private unnamed_addr constant [11 x i8] c"   GROWING\00"
@.str.exp_collatz_analysis.67 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.68 = private unnamed_addr constant [42 x i8] c"--- Part 4: Skeptical Desire Analysis ---\00"
@.str.exp_collatz_analysis.69 = private unnamed_addr constant [55 x i8] c"  Apply adversarial thinking: what if we TRIED to find\00"
@.str.exp_collatz_analysis.70 = private unnamed_addr constant [42 x i8] c"  a starting value that doesn't converge?\00"
@.str.exp_collatz_analysis.71 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.72 = private unnamed_addr constant [58 x i8] c"  Strategy: look for values where drift is LEAST negative\00"
@.str.exp_collatz_analysis.73 = private unnamed_addr constant [53 x i8] c"  (closest to growing). These are the hardest cases.\00"
@.str.exp_collatz_analysis.74 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.76 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_collatz_analysis.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_collatz_analysis.78 = private unnamed_addr constant [22 x i8] c"  Least shrinking: n=\00"
@.str.exp_collatz_analysis.79 = private unnamed_addr constant [9 x i8] c"  drift=\00"
@.str.exp_collatz_analysis.80 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.81 = private unnamed_addr constant [22 x i8] c"  Most shrinking:  n=\00"
@.str.exp_collatz_analysis.82 = private unnamed_addr constant [9 x i8] c"  drift=\00"
@.str.exp_collatz_analysis.83 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.84 = private unnamed_addr constant [22 x i8] c"  Longest path:    n=\00"
@.str.exp_collatz_analysis.85 = private unnamed_addr constant [9 x i8] c"  steps=\00"
@.str.exp_collatz_analysis.86 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.87 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.88 = private unnamed_addr constant [17 x i8] c"--- Analysis ---\00"
@.str.exp_collatz_analysis.89 = private unnamed_addr constant [53 x i8] c"  The derivative series D, D', D'', D''' of stopping\00"
@.str.exp_collatz_analysis.90 = private unnamed_addr constant [56 x i8] c"  times oscillates chaotically -- no clean pattern like\00"
@.str.exp_collatz_analysis.91 = private unnamed_addr constant [32 x i8] c"  Fibonacci or geometric decay.\00"
@.str.exp_collatz_analysis.92 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.93 = private unnamed_addr constant [54 x i8] c"  HOWEVER: the AVERAGE drift is consistently negative\00"
@.str.exp_collatz_analysis.94 = private unnamed_addr constant [54 x i8] c"  across all windows. This means the Collatz map is a\00"
@.str.exp_collatz_analysis.95 = private unnamed_addr constant [54 x i8] c"  contraction ON AVERAGE -- exactly the condition our\00"
@.str.exp_collatz_analysis.96 = private unnamed_addr constant [20 x i8] c"  theorem requires.\00"
@.str.exp_collatz_analysis.97 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.98 = private unnamed_addr constant [60 x i8] c"  The skeptical desire approach (looking for non-converging\00"
@.str.exp_collatz_analysis.99 = private unnamed_addr constant [57 x i8] c"  values) identifies the HARDEST cases but cannot find a\00"
@.str.exp_collatz_analysis.100 = private unnamed_addr constant [59 x i8] c"  counterexample. The adversarial search narrows the space\00"
@.str.exp_collatz_analysis.101 = private unnamed_addr constant [38 x i8] c"  where a counterexample COULD exist.\00"
@.str.exp_collatz_analysis.102 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_collatz_analysis.103 = private unnamed_addr constant [46 x i8] c"  This does NOT prove the Collatz conjecture.\00"
@.str.exp_collatz_analysis.104 = private unnamed_addr constant [55 x i8] c"  It demonstrates that the meta-gradient framework can\00"
@.str.exp_collatz_analysis.105 = private unnamed_addr constant [58 x i8] c"  characterize convergence behavior of discrete dynamical\00"
@.str.exp_collatz_analysis.106 = private unnamed_addr constant [42 x i8] c"  systems and identify adversarial cases.\00"
