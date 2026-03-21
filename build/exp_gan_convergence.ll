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
  %t1 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"dot4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t22 = load i64, ptr %local.a0
  %t23 = load i64, ptr %local.b0
  %t24 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t23)
  %t25 = load i64, ptr %local.a1
  %t26 = load i64, ptr %local.b1
  %t27 = call i64 @"sx_f64_mul"(i64 %t25, i64 %t26)
  %t28 = call i64 @"sx_f64_add"(i64 %t24, i64 %t27)
  %t29 = load i64, ptr %local.a2
  %t30 = load i64, ptr %local.b2
  %t31 = call i64 @"sx_f64_mul"(i64 %t29, i64 %t30)
  %t32 = call i64 @"sx_f64_add"(i64 %t28, i64 %t31)
  %t33 = load i64, ptr %local.a3
  %t34 = load i64, ptr %local.b3
  %t35 = call i64 @"sx_f64_mul"(i64 %t33, i64 %t34)
  %t36 = call i64 @"sx_f64_add"(i64 %t32, i64 %t35)
  ret i64 %t36
}

define i64 @"norm4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %t37 = load i64, ptr %local.a0
  %t38 = load i64, ptr %local.a1
  %t39 = load i64, ptr %local.a2
  %t40 = load i64, ptr %local.a3
  %t41 = load i64, ptr %local.a0
  %t42 = load i64, ptr %local.a1
  %t43 = load i64, ptr %local.a2
  %t44 = load i64, ptr %local.a3
  %t45 = call i64 @"dot4"(i64 %t37, i64 %t38, i64 %t39, i64 %t40, i64 %t41, i64 %t42, i64 %t43, i64 %t44)
  %t46 = call i64 @"sqrt_f64"(i64 %t45)
  ret i64 %t46
}

define i64 @"cosine4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.d.47 = alloca i64
  %local.na.48 = alloca i64
  %local.nb.49 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t50 = load i64, ptr %local.a0
  %t51 = load i64, ptr %local.a1
  %t52 = load i64, ptr %local.a2
  %t53 = load i64, ptr %local.a3
  %t54 = load i64, ptr %local.b0
  %t55 = load i64, ptr %local.b1
  %t56 = load i64, ptr %local.b2
  %t57 = load i64, ptr %local.b3
  %t58 = call i64 @"dot4"(i64 %t50, i64 %t51, i64 %t52, i64 %t53, i64 %t54, i64 %t55, i64 %t56, i64 %t57)
  store i64 %t58, ptr %local.d.47
  %t59 = load i64, ptr %local.a0
  %t60 = load i64, ptr %local.a1
  %t61 = load i64, ptr %local.a2
  %t62 = load i64, ptr %local.a3
  %t63 = call i64 @"norm4"(i64 %t59, i64 %t60, i64 %t61, i64 %t62)
  store i64 %t63, ptr %local.na.48
  %t64 = load i64, ptr %local.b0
  %t65 = load i64, ptr %local.b1
  %t66 = load i64, ptr %local.b2
  %t67 = load i64, ptr %local.b3
  %t68 = call i64 @"norm4"(i64 %t64, i64 %t65, i64 %t66, i64 %t67)
  store i64 %t68, ptr %local.nb.49
  %t69 = load i64, ptr %local.d.47
  %t70 = load i64, ptr %local.na.48
  %t71 = load i64, ptr %local.nb.49
  %t72 = call i64 @"sx_f64_mul"(i64 %t70, i64 %t71)
  %t73 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.2)
  %t74 = call i64 @"sx_f64_add"(i64 %t72, i64 %t73)
  %t75 = call i64 @"sx_f64_div"(i64 %t69, i64 %t74)
  ret i64 %t75
}

define i64 @"dist4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.d0.76 = alloca i64
  %local.d1.77 = alloca i64
  %local.d2.78 = alloca i64
  %local.d3.79 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t80 = load i64, ptr %local.a0
  %t81 = load i64, ptr %local.b0
  %t82 = call i64 @"sx_f64_sub"(i64 %t80, i64 %t81)
  store i64 %t82, ptr %local.d0.76
  %t83 = load i64, ptr %local.a1
  %t84 = load i64, ptr %local.b1
  %t85 = call i64 @"sx_f64_sub"(i64 %t83, i64 %t84)
  store i64 %t85, ptr %local.d1.77
  %t86 = load i64, ptr %local.a2
  %t87 = load i64, ptr %local.b2
  %t88 = call i64 @"sx_f64_sub"(i64 %t86, i64 %t87)
  store i64 %t88, ptr %local.d2.78
  %t89 = load i64, ptr %local.a3
  %t90 = load i64, ptr %local.b3
  %t91 = call i64 @"sx_f64_sub"(i64 %t89, i64 %t90)
  store i64 %t91, ptr %local.d3.79
  %t92 = load i64, ptr %local.d0.76
  %t93 = load i64, ptr %local.d0.76
  %t94 = call i64 @"sx_f64_mul"(i64 %t92, i64 %t93)
  %t95 = load i64, ptr %local.d1.77
  %t96 = load i64, ptr %local.d1.77
  %t97 = call i64 @"sx_f64_mul"(i64 %t95, i64 %t96)
  %t98 = call i64 @"sx_f64_add"(i64 %t94, i64 %t97)
  %t99 = load i64, ptr %local.d2.78
  %t100 = load i64, ptr %local.d2.78
  %t101 = call i64 @"sx_f64_mul"(i64 %t99, i64 %t100)
  %t102 = call i64 @"sx_f64_add"(i64 %t98, i64 %t101)
  %t103 = load i64, ptr %local.d3.79
  %t104 = load i64, ptr %local.d3.79
  %t105 = call i64 @"sx_f64_mul"(i64 %t103, i64 %t104)
  %t106 = call i64 @"sx_f64_add"(i64 %t102, i64 %t105)
  %t107 = call i64 @"sqrt_f64"(i64 %t106)
  ret i64 %t107
}

define i64 @"train_standard_gan"() nounwind {
entry:
  %local.t0.108 = alloca i64
  %local.t1.109 = alloca i64
  %local.t2.110 = alloca i64
  %local.t3.111 = alloca i64
  %local.g0.112 = alloca i64
  %local.g1.113 = alloca i64
  %local.g2.114 = alloca i64
  %local.g3.115 = alloca i64
  %local.d0.116 = alloca i64
  %local.d1.117 = alloca i64
  %local.d2.118 = alloca i64
  %local.d3.119 = alloca i64
  %local.lr.120 = alloca i64
  %local.step.121 = alloca i64
  %local.oscillations.122 = alloca i64
  %local.prev_dg0.123 = alloca i64
  %local.cur_dg0.124 = alloca i64
  %local.gg0.125 = alloca i64
  %local.gg1.126 = alloca i64
  %local.gg2.127 = alloca i64
  %local.gg3.128 = alloca i64
  %local.gd0.129 = alloca i64
  %local.gd1.130 = alloca i64
  %local.gd2.131 = alloca i64
  %local.gd3.132 = alloca i64
  %local.g_dist.133 = alloca i64
  %local.d_dist.134 = alloca i64
  %t135 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.3)
  %t136 = ptrtoint ptr %t135 to i64
  %t137 = inttoptr i64 %t136 to ptr
  call void @intrinsic_println(ptr %t137)
  %t138 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.4)
  %t139 = ptrtoint ptr %t138 to i64
  %t140 = inttoptr i64 %t139 to ptr
  call void @intrinsic_println(ptr %t140)
  %t141 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.5)
  %t142 = ptrtoint ptr %t141 to i64
  %t143 = inttoptr i64 %t142 to ptr
  call void @intrinsic_println(ptr %t143)
  %t144 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.6)
  %t145 = ptrtoint ptr %t144 to i64
  %t146 = inttoptr i64 %t145 to ptr
  call void @intrinsic_println(ptr %t146)
  %t147 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.7)
  store i64 %t147, ptr %local.t0.108
  %t148 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.8)
  %t149 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.9)
  %t150 = call i64 @"sx_f64_sub"(i64 %t148, i64 %t149)
  store i64 %t150, ptr %local.t1.109
  %t151 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.10)
  store i64 %t151, ptr %local.t2.110
  %t152 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.11)
  store i64 %t152, ptr %local.t3.111
  %t153 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.12)
  store i64 %t153, ptr %local.g0.112
  %t154 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.13)
  store i64 %t154, ptr %local.g1.113
  %t155 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.14)
  store i64 %t155, ptr %local.g2.114
  %t156 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.15)
  store i64 %t156, ptr %local.g3.115
  %t157 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.16)
  store i64 %t157, ptr %local.d0.116
  %t158 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.17)
  store i64 %t158, ptr %local.d1.117
  %t159 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.18)
  store i64 %t159, ptr %local.d2.118
  %t160 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.19)
  store i64 %t160, ptr %local.d3.119
  %t161 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.20)
  store i64 %t161, ptr %local.lr.120
  store i64 0, ptr %local.step.121
  store i64 0, ptr %local.oscillations.122
  %t162 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.21)
  store i64 %t162, ptr %local.prev_dg0.123
  %t163 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.22)
  store i64 %t163, ptr %local.cur_dg0.124
  %t164 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.23)
  store i64 %t164, ptr %local.gg0.125
  %t165 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.24)
  store i64 %t165, ptr %local.gg1.126
  %t166 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.25)
  store i64 %t166, ptr %local.gg2.127
  %t167 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.26)
  store i64 %t167, ptr %local.gg3.128
  %t168 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.27)
  store i64 %t168, ptr %local.gd0.129
  %t169 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.28)
  store i64 %t169, ptr %local.gd1.130
  %t170 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.29)
  store i64 %t170, ptr %local.gd2.131
  %t171 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.30)
  store i64 %t171, ptr %local.gd3.132
  br label %loop3
loop3:
  %t172 = load i64, ptr %local.step.121
  %t173 = icmp slt i64 %t172, 1000
  %t174 = zext i1 %t173 to i64
  %t175 = icmp ne i64 %t174, 0
  br i1 %t175, label %body3, label %endloop3
body3:
  %t176 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.31)
  %t177 = load i64, ptr %local.g0.112
  %t178 = load i64, ptr %local.d0.116
  %t179 = call i64 @"sx_f64_sub"(i64 %t177, i64 %t178)
  %t180 = call i64 @"sx_f64_mul"(i64 %t176, i64 %t179)
  store i64 %t180, ptr %local.gg0.125
  %t181 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.32)
  %t182 = load i64, ptr %local.g1.113
  %t183 = load i64, ptr %local.d1.117
  %t184 = call i64 @"sx_f64_sub"(i64 %t182, i64 %t183)
  %t185 = call i64 @"sx_f64_mul"(i64 %t181, i64 %t184)
  store i64 %t185, ptr %local.gg1.126
  %t186 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.33)
  %t187 = load i64, ptr %local.g2.114
  %t188 = load i64, ptr %local.d2.118
  %t189 = call i64 @"sx_f64_sub"(i64 %t187, i64 %t188)
  %t190 = call i64 @"sx_f64_mul"(i64 %t186, i64 %t189)
  store i64 %t190, ptr %local.gg2.127
  %t191 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.34)
  %t192 = load i64, ptr %local.g3.115
  %t193 = load i64, ptr %local.d3.119
  %t194 = call i64 @"sx_f64_sub"(i64 %t192, i64 %t193)
  %t195 = call i64 @"sx_f64_mul"(i64 %t191, i64 %t194)
  store i64 %t195, ptr %local.gg3.128
  %t196 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.35)
  %t197 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.36)
  %t198 = load i64, ptr %local.d0.116
  %t199 = load i64, ptr %local.t0.108
  %t200 = call i64 @"sx_f64_sub"(i64 %t198, i64 %t199)
  %t201 = call i64 @"sx_f64_mul"(i64 %t197, i64 %t200)
  %t202 = call i64 @"sx_f64_sub"(i64 %t196, i64 %t201)
  %t203 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.37)
  %t204 = load i64, ptr %local.d0.116
  %t205 = load i64, ptr %local.g0.112
  %t206 = call i64 @"sx_f64_sub"(i64 %t204, i64 %t205)
  %t207 = call i64 @"sx_f64_mul"(i64 %t203, i64 %t206)
  %t208 = call i64 @"sx_f64_add"(i64 %t202, i64 %t207)
  store i64 %t208, ptr %local.gd0.129
  %t209 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.38)
  %t210 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.39)
  %t211 = load i64, ptr %local.d1.117
  %t212 = load i64, ptr %local.t1.109
  %t213 = call i64 @"sx_f64_sub"(i64 %t211, i64 %t212)
  %t214 = call i64 @"sx_f64_mul"(i64 %t210, i64 %t213)
  %t215 = call i64 @"sx_f64_sub"(i64 %t209, i64 %t214)
  %t216 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.40)
  %t217 = load i64, ptr %local.d1.117
  %t218 = load i64, ptr %local.g1.113
  %t219 = call i64 @"sx_f64_sub"(i64 %t217, i64 %t218)
  %t220 = call i64 @"sx_f64_mul"(i64 %t216, i64 %t219)
  %t221 = call i64 @"sx_f64_add"(i64 %t215, i64 %t220)
  store i64 %t221, ptr %local.gd1.130
  %t222 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.41)
  %t223 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.42)
  %t224 = load i64, ptr %local.d2.118
  %t225 = load i64, ptr %local.t2.110
  %t226 = call i64 @"sx_f64_sub"(i64 %t224, i64 %t225)
  %t227 = call i64 @"sx_f64_mul"(i64 %t223, i64 %t226)
  %t228 = call i64 @"sx_f64_sub"(i64 %t222, i64 %t227)
  %t229 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.43)
  %t230 = load i64, ptr %local.d2.118
  %t231 = load i64, ptr %local.g2.114
  %t232 = call i64 @"sx_f64_sub"(i64 %t230, i64 %t231)
  %t233 = call i64 @"sx_f64_mul"(i64 %t229, i64 %t232)
  %t234 = call i64 @"sx_f64_add"(i64 %t228, i64 %t233)
  store i64 %t234, ptr %local.gd2.131
  %t235 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.44)
  %t236 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.45)
  %t237 = load i64, ptr %local.d3.119
  %t238 = load i64, ptr %local.t3.111
  %t239 = call i64 @"sx_f64_sub"(i64 %t237, i64 %t238)
  %t240 = call i64 @"sx_f64_mul"(i64 %t236, i64 %t239)
  %t241 = call i64 @"sx_f64_sub"(i64 %t235, i64 %t240)
  %t242 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.46)
  %t243 = load i64, ptr %local.d3.119
  %t244 = load i64, ptr %local.g3.115
  %t245 = call i64 @"sx_f64_sub"(i64 %t243, i64 %t244)
  %t246 = call i64 @"sx_f64_mul"(i64 %t242, i64 %t245)
  %t247 = call i64 @"sx_f64_add"(i64 %t241, i64 %t246)
  store i64 %t247, ptr %local.gd3.132
  %t248 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.47)
  %t249 = load i64, ptr %local.lr.120
  %t250 = load i64, ptr %local.gg0.125
  %t251 = call i64 @"sx_f64_mul"(i64 %t249, i64 %t250)
  %t252 = call i64 @"sx_f64_sub"(i64 %t248, i64 %t251)
  store i64 %t252, ptr %local.cur_dg0.124
  %t253 = load i64, ptr %local.step.121
  %t254 = icmp sgt i64 %t253, 0
  %t255 = zext i1 %t254 to i64
  %t256 = icmp ne i64 %t255, 0
  br i1 %t256, label %then4, label %else4
then4:
  %t257 = load i64, ptr %local.prev_dg0.123
  %t258 = load i64, ptr %local.cur_dg0.124
  %t259 = call i64 @"sx_f64_mul"(i64 %t257, i64 %t258)
  %t260 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.48)
  %t261 = call i64 @"sx_f64_lt"(i64 %t259, i64 %t260)
  %t262 = icmp ne i64 %t261, 0
  br i1 %t262, label %then5, label %else5
then5:
  %t263 = load i64, ptr %local.oscillations.122
  %t264 = add i64 %t263, 1
  store i64 %t264, ptr %local.oscillations.122
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t265 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t266 = phi i64 [ %t265, %then4_end ], [ 0, %else4_end ]
  %t267 = load i64, ptr %local.cur_dg0.124
  store i64 %t267, ptr %local.prev_dg0.123
  %t268 = load i64, ptr %local.g0.112
  %t269 = load i64, ptr %local.lr.120
  %t270 = load i64, ptr %local.gg0.125
  %t271 = call i64 @"sx_f64_mul"(i64 %t269, i64 %t270)
  %t272 = call i64 @"sx_f64_sub"(i64 %t268, i64 %t271)
  store i64 %t272, ptr %local.g0.112
  %t273 = load i64, ptr %local.g1.113
  %t274 = load i64, ptr %local.lr.120
  %t275 = load i64, ptr %local.gg1.126
  %t276 = call i64 @"sx_f64_mul"(i64 %t274, i64 %t275)
  %t277 = call i64 @"sx_f64_sub"(i64 %t273, i64 %t276)
  store i64 %t277, ptr %local.g1.113
  %t278 = load i64, ptr %local.g2.114
  %t279 = load i64, ptr %local.lr.120
  %t280 = load i64, ptr %local.gg2.127
  %t281 = call i64 @"sx_f64_mul"(i64 %t279, i64 %t280)
  %t282 = call i64 @"sx_f64_sub"(i64 %t278, i64 %t281)
  store i64 %t282, ptr %local.g2.114
  %t283 = load i64, ptr %local.g3.115
  %t284 = load i64, ptr %local.lr.120
  %t285 = load i64, ptr %local.gg3.128
  %t286 = call i64 @"sx_f64_mul"(i64 %t284, i64 %t285)
  %t287 = call i64 @"sx_f64_sub"(i64 %t283, i64 %t286)
  store i64 %t287, ptr %local.g3.115
  %t288 = load i64, ptr %local.d0.116
  %t289 = load i64, ptr %local.lr.120
  %t290 = load i64, ptr %local.gd0.129
  %t291 = call i64 @"sx_f64_mul"(i64 %t289, i64 %t290)
  %t292 = call i64 @"sx_f64_sub"(i64 %t288, i64 %t291)
  store i64 %t292, ptr %local.d0.116
  %t293 = load i64, ptr %local.d1.117
  %t294 = load i64, ptr %local.lr.120
  %t295 = load i64, ptr %local.gd1.130
  %t296 = call i64 @"sx_f64_mul"(i64 %t294, i64 %t295)
  %t297 = call i64 @"sx_f64_sub"(i64 %t293, i64 %t296)
  store i64 %t297, ptr %local.d1.117
  %t298 = load i64, ptr %local.d2.118
  %t299 = load i64, ptr %local.lr.120
  %t300 = load i64, ptr %local.gd2.131
  %t301 = call i64 @"sx_f64_mul"(i64 %t299, i64 %t300)
  %t302 = call i64 @"sx_f64_sub"(i64 %t298, i64 %t301)
  store i64 %t302, ptr %local.d2.118
  %t303 = load i64, ptr %local.d3.119
  %t304 = load i64, ptr %local.lr.120
  %t305 = load i64, ptr %local.gd3.132
  %t306 = call i64 @"sx_f64_mul"(i64 %t304, i64 %t305)
  %t307 = call i64 @"sx_f64_sub"(i64 %t303, i64 %t306)
  store i64 %t307, ptr %local.d3.119
  %t308 = load i64, ptr %local.step.121
  %t309 = add i64 %t308, 1
  store i64 %t309, ptr %local.step.121
  br label %loop3
endloop3:
  %t310 = load i64, ptr %local.g0.112
  %t311 = load i64, ptr %local.g1.113
  %t312 = load i64, ptr %local.g2.114
  %t313 = load i64, ptr %local.g3.115
  %t314 = load i64, ptr %local.t0.108
  %t315 = load i64, ptr %local.t1.109
  %t316 = load i64, ptr %local.t2.110
  %t317 = load i64, ptr %local.t3.111
  %t318 = call i64 @"dist4"(i64 %t310, i64 %t311, i64 %t312, i64 %t313, i64 %t314, i64 %t315, i64 %t316, i64 %t317)
  store i64 %t318, ptr %local.g_dist.133
  %t319 = load i64, ptr %local.d0.116
  %t320 = load i64, ptr %local.d1.117
  %t321 = load i64, ptr %local.d2.118
  %t322 = load i64, ptr %local.d3.119
  %t323 = load i64, ptr %local.t0.108
  %t324 = load i64, ptr %local.t1.109
  %t325 = load i64, ptr %local.t2.110
  %t326 = load i64, ptr %local.t3.111
  %t327 = call i64 @"dist4"(i64 %t319, i64 %t320, i64 %t321, i64 %t322, i64 %t323, i64 %t324, i64 %t325, i64 %t326)
  store i64 %t327, ptr %local.d_dist.134
  %t328 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.49)
  %t329 = ptrtoint ptr %t328 to i64
  %t330 = inttoptr i64 %t329 to ptr
  call void @intrinsic_print(ptr %t330)
  %t331 = load i64, ptr %local.g0.112
  %t332 = call i64 @"print_f64"(i64 %t331)
  %t333 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.50)
  %t334 = ptrtoint ptr %t333 to i64
  %t335 = inttoptr i64 %t334 to ptr
  call void @intrinsic_print(ptr %t335)
  %t336 = load i64, ptr %local.g1.113
  %t337 = call i64 @"print_f64"(i64 %t336)
  %t338 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.51)
  %t339 = ptrtoint ptr %t338 to i64
  %t340 = inttoptr i64 %t339 to ptr
  call void @intrinsic_print(ptr %t340)
  %t341 = load i64, ptr %local.g2.114
  %t342 = call i64 @"print_f64"(i64 %t341)
  %t343 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.52)
  %t344 = ptrtoint ptr %t343 to i64
  %t345 = inttoptr i64 %t344 to ptr
  call void @intrinsic_print(ptr %t345)
  %t346 = load i64, ptr %local.g3.115
  %t347 = call i64 @"print_f64"(i64 %t346)
  %t348 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.53)
  %t349 = ptrtoint ptr %t348 to i64
  %t350 = inttoptr i64 %t349 to ptr
  call void @intrinsic_println(ptr %t350)
  %t351 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.54)
  %t352 = ptrtoint ptr %t351 to i64
  %t353 = inttoptr i64 %t352 to ptr
  call void @intrinsic_print(ptr %t353)
  %t354 = load i64, ptr %local.d0.116
  %t355 = call i64 @"print_f64"(i64 %t354)
  %t356 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.55)
  %t357 = ptrtoint ptr %t356 to i64
  %t358 = inttoptr i64 %t357 to ptr
  call void @intrinsic_print(ptr %t358)
  %t359 = load i64, ptr %local.d1.117
  %t360 = call i64 @"print_f64"(i64 %t359)
  %t361 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.56)
  %t362 = ptrtoint ptr %t361 to i64
  %t363 = inttoptr i64 %t362 to ptr
  call void @intrinsic_print(ptr %t363)
  %t364 = load i64, ptr %local.d2.118
  %t365 = call i64 @"print_f64"(i64 %t364)
  %t366 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.57)
  %t367 = ptrtoint ptr %t366 to i64
  %t368 = inttoptr i64 %t367 to ptr
  call void @intrinsic_print(ptr %t368)
  %t369 = load i64, ptr %local.d3.119
  %t370 = call i64 @"print_f64"(i64 %t369)
  %t371 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.58)
  %t372 = ptrtoint ptr %t371 to i64
  %t373 = inttoptr i64 %t372 to ptr
  call void @intrinsic_println(ptr %t373)
  %t374 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.59)
  %t375 = ptrtoint ptr %t374 to i64
  %t376 = inttoptr i64 %t375 to ptr
  call void @intrinsic_print(ptr %t376)
  %t377 = load i64, ptr %local.g_dist.133
  %t378 = call i64 @"print_f64"(i64 %t377)
  %t379 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.60)
  %t380 = ptrtoint ptr %t379 to i64
  %t381 = inttoptr i64 %t380 to ptr
  call void @intrinsic_println(ptr %t381)
  %t382 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.61)
  %t383 = ptrtoint ptr %t382 to i64
  %t384 = inttoptr i64 %t383 to ptr
  call void @intrinsic_print(ptr %t384)
  %t385 = load i64, ptr %local.d_dist.134
  %t386 = call i64 @"print_f64"(i64 %t385)
  %t387 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.62)
  %t388 = ptrtoint ptr %t387 to i64
  %t389 = inttoptr i64 %t388 to ptr
  call void @intrinsic_println(ptr %t389)
  %t390 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.63)
  %t391 = ptrtoint ptr %t390 to i64
  %t392 = inttoptr i64 %t391 to ptr
  call void @intrinsic_print(ptr %t392)
  %t393 = load i64, ptr %local.oscillations.122
  call void @print_i64(i64 %t393)
  %t394 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.64)
  %t395 = ptrtoint ptr %t394 to i64
  %t396 = inttoptr i64 %t395 to ptr
  call void @intrinsic_println(ptr %t396)
  %t397 = load i64, ptr %local.oscillations.122
  %t398 = icmp sgt i64 %t397, 50
  %t399 = zext i1 %t398 to i64
  %t400 = icmp ne i64 %t399, 0
  br i1 %t400, label %then6, label %else6
then6:
  %t401 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.65)
  %t402 = ptrtoint ptr %t401 to i64
  %t403 = inttoptr i64 %t402 to ptr
  call void @intrinsic_println(ptr %t403)
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t404 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.66)
  %t405 = ptrtoint ptr %t404 to i64
  %t406 = inttoptr i64 %t405 to ptr
  call void @intrinsic_println(ptr %t406)
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t407 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t408 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.67)
  %t409 = ptrtoint ptr %t408 to i64
  %t410 = inttoptr i64 %t409 to ptr
  call void @intrinsic_println(ptr %t410)
  ret i64 0
}

define i64 @"train_projected_gan"(i64 %alpha, i64 %steps) nounwind {
entry:
  %local.t0.411 = alloca i64
  %local.t1.412 = alloca i64
  %local.t2.413 = alloca i64
  %local.t3.414 = alloca i64
  %local.g0.415 = alloca i64
  %local.g1.416 = alloca i64
  %local.g2.417 = alloca i64
  %local.g3.418 = alloca i64
  %local.d0.419 = alloca i64
  %local.d1.420 = alloca i64
  %local.d2.421 = alloca i64
  %local.d3.422 = alloca i64
  %local.lr.423 = alloca i64
  %local.step.424 = alloca i64
  %local.cosine.425 = alloca i64
  %local.scale.426 = alloca i64
  %local.proj.427 = alloca i64
  %local.gg_sq.428 = alloca i64
  %local.gd_sq.429 = alloca i64
  %local.gg0.430 = alloca i64
  %local.gg1.431 = alloca i64
  %local.gg2.432 = alloca i64
  %local.gg3.433 = alloca i64
  %local.gd0.434 = alloca i64
  %local.gd1.435 = alloca i64
  %local.gd2.436 = alloca i64
  %local.gd3.437 = alloca i64
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t438 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.68)
  store i64 %t438, ptr %local.t0.411
  %t439 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.69)
  %t440 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.70)
  %t441 = call i64 @"sx_f64_sub"(i64 %t439, i64 %t440)
  store i64 %t441, ptr %local.t1.412
  %t442 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.71)
  store i64 %t442, ptr %local.t2.413
  %t443 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.72)
  store i64 %t443, ptr %local.t3.414
  %t444 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.73)
  store i64 %t444, ptr %local.g0.415
  %t445 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.74)
  store i64 %t445, ptr %local.g1.416
  %t446 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.75)
  store i64 %t446, ptr %local.g2.417
  %t447 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.76)
  store i64 %t447, ptr %local.g3.418
  %t448 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.77)
  store i64 %t448, ptr %local.d0.419
  %t449 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.78)
  store i64 %t449, ptr %local.d1.420
  %t450 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.79)
  store i64 %t450, ptr %local.d2.421
  %t451 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.80)
  store i64 %t451, ptr %local.d3.422
  %t452 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.81)
  store i64 %t452, ptr %local.lr.423
  store i64 0, ptr %local.step.424
  %t453 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.82)
  store i64 %t453, ptr %local.cosine.425
  %t454 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.83)
  store i64 %t454, ptr %local.scale.426
  %t455 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.84)
  store i64 %t455, ptr %local.proj.427
  %t456 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.85)
  store i64 %t456, ptr %local.gg_sq.428
  %t457 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.86)
  store i64 %t457, ptr %local.gd_sq.429
  %t458 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.87)
  store i64 %t458, ptr %local.gg0.430
  %t459 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.88)
  store i64 %t459, ptr %local.gg1.431
  %t460 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.89)
  store i64 %t460, ptr %local.gg2.432
  %t461 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.90)
  store i64 %t461, ptr %local.gg3.433
  %t462 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.91)
  store i64 %t462, ptr %local.gd0.434
  %t463 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.92)
  store i64 %t463, ptr %local.gd1.435
  %t464 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.93)
  store i64 %t464, ptr %local.gd2.436
  %t465 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.94)
  store i64 %t465, ptr %local.gd3.437
  br label %loop7
loop7:
  %t466 = load i64, ptr %local.step.424
  %t467 = load i64, ptr %local.steps
  %t468 = icmp slt i64 %t466, %t467
  %t469 = zext i1 %t468 to i64
  %t470 = icmp ne i64 %t469, 0
  br i1 %t470, label %body7, label %endloop7
body7:
  %t471 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.95)
  %t472 = load i64, ptr %local.g0.415
  %t473 = load i64, ptr %local.d0.419
  %t474 = call i64 @"sx_f64_sub"(i64 %t472, i64 %t473)
  %t475 = call i64 @"sx_f64_mul"(i64 %t471, i64 %t474)
  store i64 %t475, ptr %local.gg0.430
  %t476 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.96)
  %t477 = load i64, ptr %local.g1.416
  %t478 = load i64, ptr %local.d1.420
  %t479 = call i64 @"sx_f64_sub"(i64 %t477, i64 %t478)
  %t480 = call i64 @"sx_f64_mul"(i64 %t476, i64 %t479)
  store i64 %t480, ptr %local.gg1.431
  %t481 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.97)
  %t482 = load i64, ptr %local.g2.417
  %t483 = load i64, ptr %local.d2.421
  %t484 = call i64 @"sx_f64_sub"(i64 %t482, i64 %t483)
  %t485 = call i64 @"sx_f64_mul"(i64 %t481, i64 %t484)
  store i64 %t485, ptr %local.gg2.432
  %t486 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.98)
  %t487 = load i64, ptr %local.g3.418
  %t488 = load i64, ptr %local.d3.422
  %t489 = call i64 @"sx_f64_sub"(i64 %t487, i64 %t488)
  %t490 = call i64 @"sx_f64_mul"(i64 %t486, i64 %t489)
  store i64 %t490, ptr %local.gg3.433
  %t491 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.99)
  %t492 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.100)
  %t493 = load i64, ptr %local.d0.419
  %t494 = load i64, ptr %local.t0.411
  %t495 = call i64 @"sx_f64_sub"(i64 %t493, i64 %t494)
  %t496 = call i64 @"sx_f64_mul"(i64 %t492, i64 %t495)
  %t497 = call i64 @"sx_f64_sub"(i64 %t491, i64 %t496)
  %t498 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.101)
  %t499 = load i64, ptr %local.d0.419
  %t500 = load i64, ptr %local.g0.415
  %t501 = call i64 @"sx_f64_sub"(i64 %t499, i64 %t500)
  %t502 = call i64 @"sx_f64_mul"(i64 %t498, i64 %t501)
  %t503 = call i64 @"sx_f64_add"(i64 %t497, i64 %t502)
  store i64 %t503, ptr %local.gd0.434
  %t504 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.102)
  %t505 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.103)
  %t506 = load i64, ptr %local.d1.420
  %t507 = load i64, ptr %local.t1.412
  %t508 = call i64 @"sx_f64_sub"(i64 %t506, i64 %t507)
  %t509 = call i64 @"sx_f64_mul"(i64 %t505, i64 %t508)
  %t510 = call i64 @"sx_f64_sub"(i64 %t504, i64 %t509)
  %t511 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.104)
  %t512 = load i64, ptr %local.d1.420
  %t513 = load i64, ptr %local.g1.416
  %t514 = call i64 @"sx_f64_sub"(i64 %t512, i64 %t513)
  %t515 = call i64 @"sx_f64_mul"(i64 %t511, i64 %t514)
  %t516 = call i64 @"sx_f64_add"(i64 %t510, i64 %t515)
  store i64 %t516, ptr %local.gd1.435
  %t517 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.105)
  %t518 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.106)
  %t519 = load i64, ptr %local.d2.421
  %t520 = load i64, ptr %local.t2.413
  %t521 = call i64 @"sx_f64_sub"(i64 %t519, i64 %t520)
  %t522 = call i64 @"sx_f64_mul"(i64 %t518, i64 %t521)
  %t523 = call i64 @"sx_f64_sub"(i64 %t517, i64 %t522)
  %t524 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.107)
  %t525 = load i64, ptr %local.d2.421
  %t526 = load i64, ptr %local.g2.417
  %t527 = call i64 @"sx_f64_sub"(i64 %t525, i64 %t526)
  %t528 = call i64 @"sx_f64_mul"(i64 %t524, i64 %t527)
  %t529 = call i64 @"sx_f64_add"(i64 %t523, i64 %t528)
  store i64 %t529, ptr %local.gd2.436
  %t530 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.108)
  %t531 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.109)
  %t532 = load i64, ptr %local.d3.422
  %t533 = load i64, ptr %local.t3.414
  %t534 = call i64 @"sx_f64_sub"(i64 %t532, i64 %t533)
  %t535 = call i64 @"sx_f64_mul"(i64 %t531, i64 %t534)
  %t536 = call i64 @"sx_f64_sub"(i64 %t530, i64 %t535)
  %t537 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.110)
  %t538 = load i64, ptr %local.d3.422
  %t539 = load i64, ptr %local.g3.418
  %t540 = call i64 @"sx_f64_sub"(i64 %t538, i64 %t539)
  %t541 = call i64 @"sx_f64_mul"(i64 %t537, i64 %t540)
  %t542 = call i64 @"sx_f64_add"(i64 %t536, i64 %t541)
  store i64 %t542, ptr %local.gd3.437
  %t543 = load i64, ptr %local.gg0.430
  %t544 = load i64, ptr %local.gg1.431
  %t545 = load i64, ptr %local.gg2.432
  %t546 = load i64, ptr %local.gg3.433
  %t547 = load i64, ptr %local.gd0.434
  %t548 = load i64, ptr %local.gd1.435
  %t549 = load i64, ptr %local.gd2.436
  %t550 = load i64, ptr %local.gd3.437
  %t551 = call i64 @"cosine4"(i64 %t543, i64 %t544, i64 %t545, i64 %t546, i64 %t547, i64 %t548, i64 %t549, i64 %t550)
  store i64 %t551, ptr %local.cosine.425
  %t552 = load i64, ptr %local.cosine.425
  %t553 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.111)
  %t554 = call i64 @"sx_f64_lt"(i64 %t552, i64 %t553)
  %t555 = icmp ne i64 %t554, 0
  br i1 %t555, label %then8, label %else8
then8:
  %t556 = load i64, ptr %local.alpha
  %t557 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.112)
  %t558 = load i64, ptr %local.cosine.425
  %t559 = call i64 @"sx_f64_sub"(i64 %t557, i64 %t558)
  %t560 = call i64 @"sx_f64_mul"(i64 %t556, i64 %t559)
  store i64 %t560, ptr %local.scale.426
  %t561 = load i64, ptr %local.gd0.434
  %t562 = load i64, ptr %local.gd1.435
  %t563 = load i64, ptr %local.gd2.436
  %t564 = load i64, ptr %local.gd3.437
  %t565 = load i64, ptr %local.gd0.434
  %t566 = load i64, ptr %local.gd1.435
  %t567 = load i64, ptr %local.gd2.436
  %t568 = load i64, ptr %local.gd3.437
  %t569 = call i64 @"dot4"(i64 %t561, i64 %t562, i64 %t563, i64 %t564, i64 %t565, i64 %t566, i64 %t567, i64 %t568)
  %t570 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.113)
  %t571 = call i64 @"sx_f64_add"(i64 %t569, i64 %t570)
  store i64 %t571, ptr %local.gd_sq.429
  %t572 = load i64, ptr %local.scale.426
  %t573 = load i64, ptr %local.gg0.430
  %t574 = load i64, ptr %local.gg1.431
  %t575 = load i64, ptr %local.gg2.432
  %t576 = load i64, ptr %local.gg3.433
  %t577 = load i64, ptr %local.gd0.434
  %t578 = load i64, ptr %local.gd1.435
  %t579 = load i64, ptr %local.gd2.436
  %t580 = load i64, ptr %local.gd3.437
  %t581 = call i64 @"dot4"(i64 %t573, i64 %t574, i64 %t575, i64 %t576, i64 %t577, i64 %t578, i64 %t579, i64 %t580)
  %t582 = call i64 @"sx_f64_mul"(i64 %t572, i64 %t581)
  %t583 = load i64, ptr %local.gd_sq.429
  %t584 = call i64 @"sx_f64_div"(i64 %t582, i64 %t583)
  store i64 %t584, ptr %local.proj.427
  %t585 = load i64, ptr %local.gg0.430
  %t586 = load i64, ptr %local.proj.427
  %t587 = load i64, ptr %local.gd0.434
  %t588 = call i64 @"sx_f64_mul"(i64 %t586, i64 %t587)
  %t589 = call i64 @"sx_f64_sub"(i64 %t585, i64 %t588)
  store i64 %t589, ptr %local.gg0.430
  %t590 = load i64, ptr %local.gg1.431
  %t591 = load i64, ptr %local.proj.427
  %t592 = load i64, ptr %local.gd1.435
  %t593 = call i64 @"sx_f64_mul"(i64 %t591, i64 %t592)
  %t594 = call i64 @"sx_f64_sub"(i64 %t590, i64 %t593)
  store i64 %t594, ptr %local.gg1.431
  %t595 = load i64, ptr %local.gg2.432
  %t596 = load i64, ptr %local.proj.427
  %t597 = load i64, ptr %local.gd2.436
  %t598 = call i64 @"sx_f64_mul"(i64 %t596, i64 %t597)
  %t599 = call i64 @"sx_f64_sub"(i64 %t595, i64 %t598)
  store i64 %t599, ptr %local.gg2.432
  %t600 = load i64, ptr %local.gg3.433
  %t601 = load i64, ptr %local.proj.427
  %t602 = load i64, ptr %local.gd3.437
  %t603 = call i64 @"sx_f64_mul"(i64 %t601, i64 %t602)
  %t604 = call i64 @"sx_f64_sub"(i64 %t600, i64 %t603)
  store i64 %t604, ptr %local.gg3.433
  %t605 = load i64, ptr %local.gg0.430
  %t606 = load i64, ptr %local.gg1.431
  %t607 = load i64, ptr %local.gg2.432
  %t608 = load i64, ptr %local.gg3.433
  %t609 = load i64, ptr %local.gg0.430
  %t610 = load i64, ptr %local.gg1.431
  %t611 = load i64, ptr %local.gg2.432
  %t612 = load i64, ptr %local.gg3.433
  %t613 = call i64 @"dot4"(i64 %t605, i64 %t606, i64 %t607, i64 %t608, i64 %t609, i64 %t610, i64 %t611, i64 %t612)
  %t614 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.114)
  %t615 = call i64 @"sx_f64_add"(i64 %t613, i64 %t614)
  store i64 %t615, ptr %local.gg_sq.428
  %t616 = load i64, ptr %local.scale.426
  %t617 = load i64, ptr %local.gd0.434
  %t618 = load i64, ptr %local.gd1.435
  %t619 = load i64, ptr %local.gd2.436
  %t620 = load i64, ptr %local.gd3.437
  %t621 = load i64, ptr %local.gg0.430
  %t622 = load i64, ptr %local.gg1.431
  %t623 = load i64, ptr %local.gg2.432
  %t624 = load i64, ptr %local.gg3.433
  %t625 = call i64 @"dot4"(i64 %t617, i64 %t618, i64 %t619, i64 %t620, i64 %t621, i64 %t622, i64 %t623, i64 %t624)
  %t626 = call i64 @"sx_f64_mul"(i64 %t616, i64 %t625)
  %t627 = load i64, ptr %local.gg_sq.428
  %t628 = call i64 @"sx_f64_div"(i64 %t626, i64 %t627)
  store i64 %t628, ptr %local.proj.427
  %t629 = load i64, ptr %local.gd0.434
  %t630 = load i64, ptr %local.proj.427
  %t631 = load i64, ptr %local.gg0.430
  %t632 = call i64 @"sx_f64_mul"(i64 %t630, i64 %t631)
  %t633 = call i64 @"sx_f64_sub"(i64 %t629, i64 %t632)
  store i64 %t633, ptr %local.gd0.434
  %t634 = load i64, ptr %local.gd1.435
  %t635 = load i64, ptr %local.proj.427
  %t636 = load i64, ptr %local.gg1.431
  %t637 = call i64 @"sx_f64_mul"(i64 %t635, i64 %t636)
  %t638 = call i64 @"sx_f64_sub"(i64 %t634, i64 %t637)
  store i64 %t638, ptr %local.gd1.435
  %t639 = load i64, ptr %local.gd2.436
  %t640 = load i64, ptr %local.proj.427
  %t641 = load i64, ptr %local.gg2.432
  %t642 = call i64 @"sx_f64_mul"(i64 %t640, i64 %t641)
  %t643 = call i64 @"sx_f64_sub"(i64 %t639, i64 %t642)
  store i64 %t643, ptr %local.gd2.436
  %t644 = load i64, ptr %local.gd3.437
  %t645 = load i64, ptr %local.proj.427
  %t646 = load i64, ptr %local.gg3.433
  %t647 = call i64 @"sx_f64_mul"(i64 %t645, i64 %t646)
  %t648 = call i64 @"sx_f64_sub"(i64 %t644, i64 %t647)
  store i64 %t648, ptr %local.gd3.437
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t649 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t650 = load i64, ptr %local.g0.415
  %t651 = load i64, ptr %local.lr.423
  %t652 = load i64, ptr %local.gg0.430
  %t653 = call i64 @"sx_f64_mul"(i64 %t651, i64 %t652)
  %t654 = call i64 @"sx_f64_sub"(i64 %t650, i64 %t653)
  store i64 %t654, ptr %local.g0.415
  %t655 = load i64, ptr %local.g1.416
  %t656 = load i64, ptr %local.lr.423
  %t657 = load i64, ptr %local.gg1.431
  %t658 = call i64 @"sx_f64_mul"(i64 %t656, i64 %t657)
  %t659 = call i64 @"sx_f64_sub"(i64 %t655, i64 %t658)
  store i64 %t659, ptr %local.g1.416
  %t660 = load i64, ptr %local.g2.417
  %t661 = load i64, ptr %local.lr.423
  %t662 = load i64, ptr %local.gg2.432
  %t663 = call i64 @"sx_f64_mul"(i64 %t661, i64 %t662)
  %t664 = call i64 @"sx_f64_sub"(i64 %t660, i64 %t663)
  store i64 %t664, ptr %local.g2.417
  %t665 = load i64, ptr %local.g3.418
  %t666 = load i64, ptr %local.lr.423
  %t667 = load i64, ptr %local.gg3.433
  %t668 = call i64 @"sx_f64_mul"(i64 %t666, i64 %t667)
  %t669 = call i64 @"sx_f64_sub"(i64 %t665, i64 %t668)
  store i64 %t669, ptr %local.g3.418
  %t670 = load i64, ptr %local.d0.419
  %t671 = load i64, ptr %local.lr.423
  %t672 = load i64, ptr %local.gd0.434
  %t673 = call i64 @"sx_f64_mul"(i64 %t671, i64 %t672)
  %t674 = call i64 @"sx_f64_sub"(i64 %t670, i64 %t673)
  store i64 %t674, ptr %local.d0.419
  %t675 = load i64, ptr %local.d1.420
  %t676 = load i64, ptr %local.lr.423
  %t677 = load i64, ptr %local.gd1.435
  %t678 = call i64 @"sx_f64_mul"(i64 %t676, i64 %t677)
  %t679 = call i64 @"sx_f64_sub"(i64 %t675, i64 %t678)
  store i64 %t679, ptr %local.d1.420
  %t680 = load i64, ptr %local.d2.421
  %t681 = load i64, ptr %local.lr.423
  %t682 = load i64, ptr %local.gd2.436
  %t683 = call i64 @"sx_f64_mul"(i64 %t681, i64 %t682)
  %t684 = call i64 @"sx_f64_sub"(i64 %t680, i64 %t683)
  store i64 %t684, ptr %local.d2.421
  %t685 = load i64, ptr %local.d3.422
  %t686 = load i64, ptr %local.lr.423
  %t687 = load i64, ptr %local.gd3.437
  %t688 = call i64 @"sx_f64_mul"(i64 %t686, i64 %t687)
  %t689 = call i64 @"sx_f64_sub"(i64 %t685, i64 %t688)
  store i64 %t689, ptr %local.d3.422
  %t690 = load i64, ptr %local.step.424
  %t691 = add i64 %t690, 1
  store i64 %t691, ptr %local.step.424
  br label %loop7
endloop7:
  %t692 = load i64, ptr %local.g0.415
  %t693 = load i64, ptr %local.g1.416
  %t694 = load i64, ptr %local.g2.417
  %t695 = load i64, ptr %local.g3.418
  %t696 = load i64, ptr %local.t0.411
  %t697 = load i64, ptr %local.t1.412
  %t698 = load i64, ptr %local.t2.413
  %t699 = load i64, ptr %local.t3.414
  %t700 = call i64 @"dist4"(i64 %t692, i64 %t693, i64 %t694, i64 %t695, i64 %t696, i64 %t697, i64 %t698, i64 %t699)
  ret i64 %t700
}

define i64 @"count_oscillations_proj"(i64 %alpha, i64 %steps) nounwind {
entry:
  %local.t0.701 = alloca i64
  %local.t1.702 = alloca i64
  %local.t2.703 = alloca i64
  %local.t3.704 = alloca i64
  %local.g0.705 = alloca i64
  %local.g1.706 = alloca i64
  %local.g2.707 = alloca i64
  %local.g3.708 = alloca i64
  %local.d0.709 = alloca i64
  %local.d1.710 = alloca i64
  %local.d2.711 = alloca i64
  %local.d3.712 = alloca i64
  %local.lr.713 = alloca i64
  %local.step.714 = alloca i64
  %local.oscillations.715 = alloca i64
  %local.prev_dg0.716 = alloca i64
  %local.cur_dg0.717 = alloca i64
  %local.cosine.718 = alloca i64
  %local.scale.719 = alloca i64
  %local.proj.720 = alloca i64
  %local.gg_sq.721 = alloca i64
  %local.gd_sq.722 = alloca i64
  %local.gg0.723 = alloca i64
  %local.gg1.724 = alloca i64
  %local.gg2.725 = alloca i64
  %local.gg3.726 = alloca i64
  %local.gd0.727 = alloca i64
  %local.gd1.728 = alloca i64
  %local.gd2.729 = alloca i64
  %local.gd3.730 = alloca i64
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t731 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.115)
  store i64 %t731, ptr %local.t0.701
  %t732 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.116)
  %t733 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.117)
  %t734 = call i64 @"sx_f64_sub"(i64 %t732, i64 %t733)
  store i64 %t734, ptr %local.t1.702
  %t735 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.118)
  store i64 %t735, ptr %local.t2.703
  %t736 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.119)
  store i64 %t736, ptr %local.t3.704
  %t737 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.120)
  store i64 %t737, ptr %local.g0.705
  %t738 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.121)
  store i64 %t738, ptr %local.g1.706
  %t739 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.122)
  store i64 %t739, ptr %local.g2.707
  %t740 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.123)
  store i64 %t740, ptr %local.g3.708
  %t741 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.124)
  store i64 %t741, ptr %local.d0.709
  %t742 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.125)
  store i64 %t742, ptr %local.d1.710
  %t743 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.126)
  store i64 %t743, ptr %local.d2.711
  %t744 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.127)
  store i64 %t744, ptr %local.d3.712
  %t745 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.128)
  store i64 %t745, ptr %local.lr.713
  store i64 0, ptr %local.step.714
  store i64 0, ptr %local.oscillations.715
  %t746 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.129)
  store i64 %t746, ptr %local.prev_dg0.716
  %t747 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.130)
  store i64 %t747, ptr %local.cur_dg0.717
  %t748 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.131)
  store i64 %t748, ptr %local.cosine.718
  %t749 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.132)
  store i64 %t749, ptr %local.scale.719
  %t750 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.133)
  store i64 %t750, ptr %local.proj.720
  %t751 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.134)
  store i64 %t751, ptr %local.gg_sq.721
  %t752 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.135)
  store i64 %t752, ptr %local.gd_sq.722
  %t753 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.136)
  store i64 %t753, ptr %local.gg0.723
  %t754 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.137)
  store i64 %t754, ptr %local.gg1.724
  %t755 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.138)
  store i64 %t755, ptr %local.gg2.725
  %t756 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.139)
  store i64 %t756, ptr %local.gg3.726
  %t757 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.140)
  store i64 %t757, ptr %local.gd0.727
  %t758 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.141)
  store i64 %t758, ptr %local.gd1.728
  %t759 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.142)
  store i64 %t759, ptr %local.gd2.729
  %t760 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.143)
  store i64 %t760, ptr %local.gd3.730
  br label %loop9
loop9:
  %t761 = load i64, ptr %local.step.714
  %t762 = load i64, ptr %local.steps
  %t763 = icmp slt i64 %t761, %t762
  %t764 = zext i1 %t763 to i64
  %t765 = icmp ne i64 %t764, 0
  br i1 %t765, label %body9, label %endloop9
body9:
  %t766 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.144)
  %t767 = load i64, ptr %local.g0.705
  %t768 = load i64, ptr %local.d0.709
  %t769 = call i64 @"sx_f64_sub"(i64 %t767, i64 %t768)
  %t770 = call i64 @"sx_f64_mul"(i64 %t766, i64 %t769)
  store i64 %t770, ptr %local.gg0.723
  %t771 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.145)
  %t772 = load i64, ptr %local.g1.706
  %t773 = load i64, ptr %local.d1.710
  %t774 = call i64 @"sx_f64_sub"(i64 %t772, i64 %t773)
  %t775 = call i64 @"sx_f64_mul"(i64 %t771, i64 %t774)
  store i64 %t775, ptr %local.gg1.724
  %t776 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.146)
  %t777 = load i64, ptr %local.g2.707
  %t778 = load i64, ptr %local.d2.711
  %t779 = call i64 @"sx_f64_sub"(i64 %t777, i64 %t778)
  %t780 = call i64 @"sx_f64_mul"(i64 %t776, i64 %t779)
  store i64 %t780, ptr %local.gg2.725
  %t781 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.147)
  %t782 = load i64, ptr %local.g3.708
  %t783 = load i64, ptr %local.d3.712
  %t784 = call i64 @"sx_f64_sub"(i64 %t782, i64 %t783)
  %t785 = call i64 @"sx_f64_mul"(i64 %t781, i64 %t784)
  store i64 %t785, ptr %local.gg3.726
  %t786 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.148)
  %t787 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.149)
  %t788 = load i64, ptr %local.d0.709
  %t789 = load i64, ptr %local.t0.701
  %t790 = call i64 @"sx_f64_sub"(i64 %t788, i64 %t789)
  %t791 = call i64 @"sx_f64_mul"(i64 %t787, i64 %t790)
  %t792 = call i64 @"sx_f64_sub"(i64 %t786, i64 %t791)
  %t793 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.150)
  %t794 = load i64, ptr %local.d0.709
  %t795 = load i64, ptr %local.g0.705
  %t796 = call i64 @"sx_f64_sub"(i64 %t794, i64 %t795)
  %t797 = call i64 @"sx_f64_mul"(i64 %t793, i64 %t796)
  %t798 = call i64 @"sx_f64_add"(i64 %t792, i64 %t797)
  store i64 %t798, ptr %local.gd0.727
  %t799 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.151)
  %t800 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.152)
  %t801 = load i64, ptr %local.d1.710
  %t802 = load i64, ptr %local.t1.702
  %t803 = call i64 @"sx_f64_sub"(i64 %t801, i64 %t802)
  %t804 = call i64 @"sx_f64_mul"(i64 %t800, i64 %t803)
  %t805 = call i64 @"sx_f64_sub"(i64 %t799, i64 %t804)
  %t806 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.153)
  %t807 = load i64, ptr %local.d1.710
  %t808 = load i64, ptr %local.g1.706
  %t809 = call i64 @"sx_f64_sub"(i64 %t807, i64 %t808)
  %t810 = call i64 @"sx_f64_mul"(i64 %t806, i64 %t809)
  %t811 = call i64 @"sx_f64_add"(i64 %t805, i64 %t810)
  store i64 %t811, ptr %local.gd1.728
  %t812 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.154)
  %t813 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.155)
  %t814 = load i64, ptr %local.d2.711
  %t815 = load i64, ptr %local.t2.703
  %t816 = call i64 @"sx_f64_sub"(i64 %t814, i64 %t815)
  %t817 = call i64 @"sx_f64_mul"(i64 %t813, i64 %t816)
  %t818 = call i64 @"sx_f64_sub"(i64 %t812, i64 %t817)
  %t819 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.156)
  %t820 = load i64, ptr %local.d2.711
  %t821 = load i64, ptr %local.g2.707
  %t822 = call i64 @"sx_f64_sub"(i64 %t820, i64 %t821)
  %t823 = call i64 @"sx_f64_mul"(i64 %t819, i64 %t822)
  %t824 = call i64 @"sx_f64_add"(i64 %t818, i64 %t823)
  store i64 %t824, ptr %local.gd2.729
  %t825 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.157)
  %t826 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.158)
  %t827 = load i64, ptr %local.d3.712
  %t828 = load i64, ptr %local.t3.704
  %t829 = call i64 @"sx_f64_sub"(i64 %t827, i64 %t828)
  %t830 = call i64 @"sx_f64_mul"(i64 %t826, i64 %t829)
  %t831 = call i64 @"sx_f64_sub"(i64 %t825, i64 %t830)
  %t832 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.159)
  %t833 = load i64, ptr %local.d3.712
  %t834 = load i64, ptr %local.g3.708
  %t835 = call i64 @"sx_f64_sub"(i64 %t833, i64 %t834)
  %t836 = call i64 @"sx_f64_mul"(i64 %t832, i64 %t835)
  %t837 = call i64 @"sx_f64_add"(i64 %t831, i64 %t836)
  store i64 %t837, ptr %local.gd3.730
  %t838 = load i64, ptr %local.gg0.723
  %t839 = load i64, ptr %local.gg1.724
  %t840 = load i64, ptr %local.gg2.725
  %t841 = load i64, ptr %local.gg3.726
  %t842 = load i64, ptr %local.gd0.727
  %t843 = load i64, ptr %local.gd1.728
  %t844 = load i64, ptr %local.gd2.729
  %t845 = load i64, ptr %local.gd3.730
  %t846 = call i64 @"cosine4"(i64 %t838, i64 %t839, i64 %t840, i64 %t841, i64 %t842, i64 %t843, i64 %t844, i64 %t845)
  store i64 %t846, ptr %local.cosine.718
  %t847 = load i64, ptr %local.cosine.718
  %t848 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.160)
  %t849 = call i64 @"sx_f64_lt"(i64 %t847, i64 %t848)
  %t850 = icmp ne i64 %t849, 0
  br i1 %t850, label %then10, label %else10
then10:
  %t851 = load i64, ptr %local.alpha
  %t852 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.161)
  %t853 = load i64, ptr %local.cosine.718
  %t854 = call i64 @"sx_f64_sub"(i64 %t852, i64 %t853)
  %t855 = call i64 @"sx_f64_mul"(i64 %t851, i64 %t854)
  store i64 %t855, ptr %local.scale.719
  %t856 = load i64, ptr %local.gd0.727
  %t857 = load i64, ptr %local.gd1.728
  %t858 = load i64, ptr %local.gd2.729
  %t859 = load i64, ptr %local.gd3.730
  %t860 = load i64, ptr %local.gd0.727
  %t861 = load i64, ptr %local.gd1.728
  %t862 = load i64, ptr %local.gd2.729
  %t863 = load i64, ptr %local.gd3.730
  %t864 = call i64 @"dot4"(i64 %t856, i64 %t857, i64 %t858, i64 %t859, i64 %t860, i64 %t861, i64 %t862, i64 %t863)
  %t865 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.162)
  %t866 = call i64 @"sx_f64_add"(i64 %t864, i64 %t865)
  store i64 %t866, ptr %local.gd_sq.722
  %t867 = load i64, ptr %local.scale.719
  %t868 = load i64, ptr %local.gg0.723
  %t869 = load i64, ptr %local.gg1.724
  %t870 = load i64, ptr %local.gg2.725
  %t871 = load i64, ptr %local.gg3.726
  %t872 = load i64, ptr %local.gd0.727
  %t873 = load i64, ptr %local.gd1.728
  %t874 = load i64, ptr %local.gd2.729
  %t875 = load i64, ptr %local.gd3.730
  %t876 = call i64 @"dot4"(i64 %t868, i64 %t869, i64 %t870, i64 %t871, i64 %t872, i64 %t873, i64 %t874, i64 %t875)
  %t877 = call i64 @"sx_f64_mul"(i64 %t867, i64 %t876)
  %t878 = load i64, ptr %local.gd_sq.722
  %t879 = call i64 @"sx_f64_div"(i64 %t877, i64 %t878)
  store i64 %t879, ptr %local.proj.720
  %t880 = load i64, ptr %local.gg0.723
  %t881 = load i64, ptr %local.proj.720
  %t882 = load i64, ptr %local.gd0.727
  %t883 = call i64 @"sx_f64_mul"(i64 %t881, i64 %t882)
  %t884 = call i64 @"sx_f64_sub"(i64 %t880, i64 %t883)
  store i64 %t884, ptr %local.gg0.723
  %t885 = load i64, ptr %local.gg1.724
  %t886 = load i64, ptr %local.proj.720
  %t887 = load i64, ptr %local.gd1.728
  %t888 = call i64 @"sx_f64_mul"(i64 %t886, i64 %t887)
  %t889 = call i64 @"sx_f64_sub"(i64 %t885, i64 %t888)
  store i64 %t889, ptr %local.gg1.724
  %t890 = load i64, ptr %local.gg2.725
  %t891 = load i64, ptr %local.proj.720
  %t892 = load i64, ptr %local.gd2.729
  %t893 = call i64 @"sx_f64_mul"(i64 %t891, i64 %t892)
  %t894 = call i64 @"sx_f64_sub"(i64 %t890, i64 %t893)
  store i64 %t894, ptr %local.gg2.725
  %t895 = load i64, ptr %local.gg3.726
  %t896 = load i64, ptr %local.proj.720
  %t897 = load i64, ptr %local.gd3.730
  %t898 = call i64 @"sx_f64_mul"(i64 %t896, i64 %t897)
  %t899 = call i64 @"sx_f64_sub"(i64 %t895, i64 %t898)
  store i64 %t899, ptr %local.gg3.726
  %t900 = load i64, ptr %local.gg0.723
  %t901 = load i64, ptr %local.gg1.724
  %t902 = load i64, ptr %local.gg2.725
  %t903 = load i64, ptr %local.gg3.726
  %t904 = load i64, ptr %local.gg0.723
  %t905 = load i64, ptr %local.gg1.724
  %t906 = load i64, ptr %local.gg2.725
  %t907 = load i64, ptr %local.gg3.726
  %t908 = call i64 @"dot4"(i64 %t900, i64 %t901, i64 %t902, i64 %t903, i64 %t904, i64 %t905, i64 %t906, i64 %t907)
  %t909 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.163)
  %t910 = call i64 @"sx_f64_add"(i64 %t908, i64 %t909)
  store i64 %t910, ptr %local.gg_sq.721
  %t911 = load i64, ptr %local.scale.719
  %t912 = load i64, ptr %local.gd0.727
  %t913 = load i64, ptr %local.gd1.728
  %t914 = load i64, ptr %local.gd2.729
  %t915 = load i64, ptr %local.gd3.730
  %t916 = load i64, ptr %local.gg0.723
  %t917 = load i64, ptr %local.gg1.724
  %t918 = load i64, ptr %local.gg2.725
  %t919 = load i64, ptr %local.gg3.726
  %t920 = call i64 @"dot4"(i64 %t912, i64 %t913, i64 %t914, i64 %t915, i64 %t916, i64 %t917, i64 %t918, i64 %t919)
  %t921 = call i64 @"sx_f64_mul"(i64 %t911, i64 %t920)
  %t922 = load i64, ptr %local.gg_sq.721
  %t923 = call i64 @"sx_f64_div"(i64 %t921, i64 %t922)
  store i64 %t923, ptr %local.proj.720
  %t924 = load i64, ptr %local.gd0.727
  %t925 = load i64, ptr %local.proj.720
  %t926 = load i64, ptr %local.gg0.723
  %t927 = call i64 @"sx_f64_mul"(i64 %t925, i64 %t926)
  %t928 = call i64 @"sx_f64_sub"(i64 %t924, i64 %t927)
  store i64 %t928, ptr %local.gd0.727
  %t929 = load i64, ptr %local.gd1.728
  %t930 = load i64, ptr %local.proj.720
  %t931 = load i64, ptr %local.gg1.724
  %t932 = call i64 @"sx_f64_mul"(i64 %t930, i64 %t931)
  %t933 = call i64 @"sx_f64_sub"(i64 %t929, i64 %t932)
  store i64 %t933, ptr %local.gd1.728
  %t934 = load i64, ptr %local.gd2.729
  %t935 = load i64, ptr %local.proj.720
  %t936 = load i64, ptr %local.gg2.725
  %t937 = call i64 @"sx_f64_mul"(i64 %t935, i64 %t936)
  %t938 = call i64 @"sx_f64_sub"(i64 %t934, i64 %t937)
  store i64 %t938, ptr %local.gd2.729
  %t939 = load i64, ptr %local.gd3.730
  %t940 = load i64, ptr %local.proj.720
  %t941 = load i64, ptr %local.gg3.726
  %t942 = call i64 @"sx_f64_mul"(i64 %t940, i64 %t941)
  %t943 = call i64 @"sx_f64_sub"(i64 %t939, i64 %t942)
  store i64 %t943, ptr %local.gd3.730
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t944 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t945 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.164)
  %t946 = load i64, ptr %local.lr.713
  %t947 = load i64, ptr %local.gg0.723
  %t948 = call i64 @"sx_f64_mul"(i64 %t946, i64 %t947)
  %t949 = call i64 @"sx_f64_sub"(i64 %t945, i64 %t948)
  store i64 %t949, ptr %local.cur_dg0.717
  %t950 = load i64, ptr %local.step.714
  %t951 = icmp sgt i64 %t950, 0
  %t952 = zext i1 %t951 to i64
  %t953 = icmp ne i64 %t952, 0
  br i1 %t953, label %then11, label %else11
then11:
  %t954 = load i64, ptr %local.prev_dg0.716
  %t955 = load i64, ptr %local.cur_dg0.717
  %t956 = call i64 @"sx_f64_mul"(i64 %t954, i64 %t955)
  %t957 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.165)
  %t958 = call i64 @"sx_f64_lt"(i64 %t956, i64 %t957)
  %t959 = icmp ne i64 %t958, 0
  br i1 %t959, label %then12, label %else12
then12:
  %t960 = load i64, ptr %local.oscillations.715
  %t961 = add i64 %t960, 1
  store i64 %t961, ptr %local.oscillations.715
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t962 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t963 = phi i64 [ %t962, %then11_end ], [ 0, %else11_end ]
  %t964 = load i64, ptr %local.cur_dg0.717
  store i64 %t964, ptr %local.prev_dg0.716
  %t965 = load i64, ptr %local.g0.705
  %t966 = load i64, ptr %local.lr.713
  %t967 = load i64, ptr %local.gg0.723
  %t968 = call i64 @"sx_f64_mul"(i64 %t966, i64 %t967)
  %t969 = call i64 @"sx_f64_sub"(i64 %t965, i64 %t968)
  store i64 %t969, ptr %local.g0.705
  %t970 = load i64, ptr %local.g1.706
  %t971 = load i64, ptr %local.lr.713
  %t972 = load i64, ptr %local.gg1.724
  %t973 = call i64 @"sx_f64_mul"(i64 %t971, i64 %t972)
  %t974 = call i64 @"sx_f64_sub"(i64 %t970, i64 %t973)
  store i64 %t974, ptr %local.g1.706
  %t975 = load i64, ptr %local.g2.707
  %t976 = load i64, ptr %local.lr.713
  %t977 = load i64, ptr %local.gg2.725
  %t978 = call i64 @"sx_f64_mul"(i64 %t976, i64 %t977)
  %t979 = call i64 @"sx_f64_sub"(i64 %t975, i64 %t978)
  store i64 %t979, ptr %local.g2.707
  %t980 = load i64, ptr %local.g3.708
  %t981 = load i64, ptr %local.lr.713
  %t982 = load i64, ptr %local.gg3.726
  %t983 = call i64 @"sx_f64_mul"(i64 %t981, i64 %t982)
  %t984 = call i64 @"sx_f64_sub"(i64 %t980, i64 %t983)
  store i64 %t984, ptr %local.g3.708
  %t985 = load i64, ptr %local.d0.709
  %t986 = load i64, ptr %local.lr.713
  %t987 = load i64, ptr %local.gd0.727
  %t988 = call i64 @"sx_f64_mul"(i64 %t986, i64 %t987)
  %t989 = call i64 @"sx_f64_sub"(i64 %t985, i64 %t988)
  store i64 %t989, ptr %local.d0.709
  %t990 = load i64, ptr %local.d1.710
  %t991 = load i64, ptr %local.lr.713
  %t992 = load i64, ptr %local.gd1.728
  %t993 = call i64 @"sx_f64_mul"(i64 %t991, i64 %t992)
  %t994 = call i64 @"sx_f64_sub"(i64 %t990, i64 %t993)
  store i64 %t994, ptr %local.d1.710
  %t995 = load i64, ptr %local.d2.711
  %t996 = load i64, ptr %local.lr.713
  %t997 = load i64, ptr %local.gd2.729
  %t998 = call i64 @"sx_f64_mul"(i64 %t996, i64 %t997)
  %t999 = call i64 @"sx_f64_sub"(i64 %t995, i64 %t998)
  store i64 %t999, ptr %local.d2.711
  %t1000 = load i64, ptr %local.d3.712
  %t1001 = load i64, ptr %local.lr.713
  %t1002 = load i64, ptr %local.gd3.730
  %t1003 = call i64 @"sx_f64_mul"(i64 %t1001, i64 %t1002)
  %t1004 = call i64 @"sx_f64_sub"(i64 %t1000, i64 %t1003)
  store i64 %t1004, ptr %local.d3.712
  %t1005 = load i64, ptr %local.step.714
  %t1006 = add i64 %t1005, 1
  store i64 %t1006, ptr %local.step.714
  br label %loop9
endloop9:
  %t1007 = load i64, ptr %local.oscillations.715
  ret i64 %t1007
}

define i64 @"test_projected_gan"() nounwind {
entry:
  %local.dist_none.1008 = alloca i64
  %local.dist_proj.1009 = alloca i64
  %local.osc_none.1010 = alloca i64
  %local.osc_proj.1011 = alloca i64
  %local.improvement.1012 = alloca i64
  %t1013 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.166)
  %t1014 = ptrtoint ptr %t1013 to i64
  %t1015 = inttoptr i64 %t1014 to ptr
  call void @intrinsic_println(ptr %t1015)
  %t1016 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.167)
  %t1017 = ptrtoint ptr %t1016 to i64
  %t1018 = inttoptr i64 %t1017 to ptr
  call void @intrinsic_println(ptr %t1018)
  %t1019 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.168)
  %t1020 = ptrtoint ptr %t1019 to i64
  %t1021 = inttoptr i64 %t1020 to ptr
  call void @intrinsic_println(ptr %t1021)
  %t1022 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.169)
  %t1023 = ptrtoint ptr %t1022 to i64
  %t1024 = inttoptr i64 %t1023 to ptr
  call void @intrinsic_println(ptr %t1024)
  %t1025 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.170)
  %t1026 = call i64 @"train_projected_gan"(i64 %t1025, i64 1000)
  store i64 %t1026, ptr %local.dist_none.1008
  %t1027 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.171)
  %t1028 = call i64 @"train_projected_gan"(i64 %t1027, i64 1000)
  store i64 %t1028, ptr %local.dist_proj.1009
  %t1029 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.172)
  %t1030 = call i64 @"count_oscillations_proj"(i64 %t1029, i64 1000)
  store i64 %t1030, ptr %local.osc_none.1010
  %t1031 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.173)
  %t1032 = call i64 @"count_oscillations_proj"(i64 %t1031, i64 1000)
  store i64 %t1032, ptr %local.osc_proj.1011
  %t1033 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.174)
  %t1034 = ptrtoint ptr %t1033 to i64
  %t1035 = inttoptr i64 %t1034 to ptr
  call void @intrinsic_print(ptr %t1035)
  %t1036 = load i64, ptr %local.dist_none.1008
  %t1037 = call i64 @"print_f64"(i64 %t1036)
  %t1038 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.175)
  %t1039 = ptrtoint ptr %t1038 to i64
  %t1040 = inttoptr i64 %t1039 to ptr
  call void @intrinsic_print(ptr %t1040)
  %t1041 = load i64, ptr %local.osc_none.1010
  call void @print_i64(i64 %t1041)
  %t1042 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.176)
  %t1043 = ptrtoint ptr %t1042 to i64
  %t1044 = inttoptr i64 %t1043 to ptr
  call void @intrinsic_println(ptr %t1044)
  %t1045 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.177)
  %t1046 = ptrtoint ptr %t1045 to i64
  %t1047 = inttoptr i64 %t1046 to ptr
  call void @intrinsic_print(ptr %t1047)
  %t1048 = load i64, ptr %local.dist_proj.1009
  %t1049 = call i64 @"print_f64"(i64 %t1048)
  %t1050 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.178)
  %t1051 = ptrtoint ptr %t1050 to i64
  %t1052 = inttoptr i64 %t1051 to ptr
  call void @intrinsic_print(ptr %t1052)
  %t1053 = load i64, ptr %local.osc_proj.1011
  call void @print_i64(i64 %t1053)
  %t1054 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.179)
  %t1055 = ptrtoint ptr %t1054 to i64
  %t1056 = inttoptr i64 %t1055 to ptr
  call void @intrinsic_println(ptr %t1056)
  %t1057 = load i64, ptr %local.dist_proj.1009
  %t1058 = load i64, ptr %local.dist_none.1008
  %t1059 = call i64 @"sx_f64_lt"(i64 %t1057, i64 %t1058)
  %t1060 = icmp ne i64 %t1059, 0
  br i1 %t1060, label %then13, label %else13
then13:
  %t1061 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.180)
  %t1062 = load i64, ptr %local.dist_none.1008
  %t1063 = load i64, ptr %local.dist_proj.1009
  %t1064 = call i64 @"sx_f64_sub"(i64 %t1062, i64 %t1063)
  %t1065 = call i64 @"sx_f64_mul"(i64 %t1061, i64 %t1064)
  %t1066 = load i64, ptr %local.dist_none.1008
  %t1067 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.181)
  %t1068 = call i64 @"sx_f64_add"(i64 %t1066, i64 %t1067)
  %t1069 = call i64 @"sx_f64_div"(i64 %t1065, i64 %t1068)
  store i64 %t1069, ptr %local.improvement.1012
  %t1070 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.182)
  %t1071 = ptrtoint ptr %t1070 to i64
  %t1072 = inttoptr i64 %t1071 to ptr
  call void @intrinsic_print(ptr %t1072)
  %t1073 = load i64, ptr %local.improvement.1012
  %t1074 = call i64 @"print_f64"(i64 %t1073)
  %t1075 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.183)
  %t1076 = ptrtoint ptr %t1075 to i64
  %t1077 = inttoptr i64 %t1076 to ptr
  call void @intrinsic_println(ptr %t1077)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  %t1078 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.184)
  %t1079 = ptrtoint ptr %t1078 to i64
  %t1080 = inttoptr i64 %t1079 to ptr
  call void @intrinsic_println(ptr %t1080)
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t1081 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t1082 = load i64, ptr %local.osc_proj.1011
  %t1083 = load i64, ptr %local.osc_none.1010
  %t1084 = icmp slt i64 %t1082, %t1083
  %t1085 = zext i1 %t1084 to i64
  %t1086 = icmp ne i64 %t1085, 0
  br i1 %t1086, label %then14, label %else14
then14:
  %t1087 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.185)
  %t1088 = ptrtoint ptr %t1087 to i64
  %t1089 = inttoptr i64 %t1088 to ptr
  call void @intrinsic_print(ptr %t1089)
  %t1090 = load i64, ptr %local.osc_none.1010
  call void @print_i64(i64 %t1090)
  %t1091 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.186)
  %t1092 = ptrtoint ptr %t1091 to i64
  %t1093 = inttoptr i64 %t1092 to ptr
  call void @intrinsic_print(ptr %t1093)
  %t1094 = load i64, ptr %local.osc_proj.1011
  call void @print_i64(i64 %t1094)
  %t1095 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.187)
  %t1096 = ptrtoint ptr %t1095 to i64
  %t1097 = inttoptr i64 %t1096 to ptr
  call void @intrinsic_println(ptr %t1097)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t1098 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t1099 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.188)
  %t1100 = ptrtoint ptr %t1099 to i64
  %t1101 = inttoptr i64 %t1100 to ptr
  call void @intrinsic_println(ptr %t1101)
  ret i64 0
}

define i64 @"train_asym_gan"(i64 %a_gd, i64 %a_dg, i64 %steps) nounwind {
entry:
  %local.t0.1102 = alloca i64
  %local.t1.1103 = alloca i64
  %local.t2.1104 = alloca i64
  %local.t3.1105 = alloca i64
  %local.g0.1106 = alloca i64
  %local.g1.1107 = alloca i64
  %local.g2.1108 = alloca i64
  %local.g3.1109 = alloca i64
  %local.d0.1110 = alloca i64
  %local.d1.1111 = alloca i64
  %local.d2.1112 = alloca i64
  %local.d3.1113 = alloca i64
  %local.lr.1114 = alloca i64
  %local.step.1115 = alloca i64
  %local.cosine.1116 = alloca i64
  %local.proj.1117 = alloca i64
  %local.sq.1118 = alloca i64
  %local.scale_gd.1119 = alloca i64
  %local.scale_dg.1120 = alloca i64
  %local.gg0.1121 = alloca i64
  %local.gg1.1122 = alloca i64
  %local.gg2.1123 = alloca i64
  %local.gg3.1124 = alloca i64
  %local.gd0.1125 = alloca i64
  %local.gd1.1126 = alloca i64
  %local.gd2.1127 = alloca i64
  %local.gd3.1128 = alloca i64
  %local.a_gd = alloca i64
  store i64 %a_gd, ptr %local.a_gd
  %local.a_dg = alloca i64
  store i64 %a_dg, ptr %local.a_dg
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1129 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.189)
  store i64 %t1129, ptr %local.t0.1102
  %t1130 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.190)
  %t1131 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.191)
  %t1132 = call i64 @"sx_f64_sub"(i64 %t1130, i64 %t1131)
  store i64 %t1132, ptr %local.t1.1103
  %t1133 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.192)
  store i64 %t1133, ptr %local.t2.1104
  %t1134 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.193)
  store i64 %t1134, ptr %local.t3.1105
  %t1135 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.194)
  store i64 %t1135, ptr %local.g0.1106
  %t1136 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.195)
  store i64 %t1136, ptr %local.g1.1107
  %t1137 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.196)
  store i64 %t1137, ptr %local.g2.1108
  %t1138 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.197)
  store i64 %t1138, ptr %local.g3.1109
  %t1139 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.198)
  store i64 %t1139, ptr %local.d0.1110
  %t1140 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.199)
  store i64 %t1140, ptr %local.d1.1111
  %t1141 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.200)
  store i64 %t1141, ptr %local.d2.1112
  %t1142 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.201)
  store i64 %t1142, ptr %local.d3.1113
  %t1143 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.202)
  store i64 %t1143, ptr %local.lr.1114
  store i64 0, ptr %local.step.1115
  %t1144 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.203)
  store i64 %t1144, ptr %local.cosine.1116
  %t1145 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.204)
  store i64 %t1145, ptr %local.proj.1117
  %t1146 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.205)
  store i64 %t1146, ptr %local.sq.1118
  %t1147 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.206)
  store i64 %t1147, ptr %local.scale_gd.1119
  %t1148 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.207)
  store i64 %t1148, ptr %local.scale_dg.1120
  %t1149 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.208)
  store i64 %t1149, ptr %local.gg0.1121
  %t1150 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.209)
  store i64 %t1150, ptr %local.gg1.1122
  %t1151 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.210)
  store i64 %t1151, ptr %local.gg2.1123
  %t1152 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.211)
  store i64 %t1152, ptr %local.gg3.1124
  %t1153 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.212)
  store i64 %t1153, ptr %local.gd0.1125
  %t1154 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.213)
  store i64 %t1154, ptr %local.gd1.1126
  %t1155 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.214)
  store i64 %t1155, ptr %local.gd2.1127
  %t1156 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.215)
  store i64 %t1156, ptr %local.gd3.1128
  br label %loop15
loop15:
  %t1157 = load i64, ptr %local.step.1115
  %t1158 = load i64, ptr %local.steps
  %t1159 = icmp slt i64 %t1157, %t1158
  %t1160 = zext i1 %t1159 to i64
  %t1161 = icmp ne i64 %t1160, 0
  br i1 %t1161, label %body15, label %endloop15
body15:
  %t1162 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.216)
  %t1163 = load i64, ptr %local.g0.1106
  %t1164 = load i64, ptr %local.d0.1110
  %t1165 = call i64 @"sx_f64_sub"(i64 %t1163, i64 %t1164)
  %t1166 = call i64 @"sx_f64_mul"(i64 %t1162, i64 %t1165)
  store i64 %t1166, ptr %local.gg0.1121
  %t1167 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.217)
  %t1168 = load i64, ptr %local.g1.1107
  %t1169 = load i64, ptr %local.d1.1111
  %t1170 = call i64 @"sx_f64_sub"(i64 %t1168, i64 %t1169)
  %t1171 = call i64 @"sx_f64_mul"(i64 %t1167, i64 %t1170)
  store i64 %t1171, ptr %local.gg1.1122
  %t1172 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.218)
  %t1173 = load i64, ptr %local.g2.1108
  %t1174 = load i64, ptr %local.d2.1112
  %t1175 = call i64 @"sx_f64_sub"(i64 %t1173, i64 %t1174)
  %t1176 = call i64 @"sx_f64_mul"(i64 %t1172, i64 %t1175)
  store i64 %t1176, ptr %local.gg2.1123
  %t1177 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.219)
  %t1178 = load i64, ptr %local.g3.1109
  %t1179 = load i64, ptr %local.d3.1113
  %t1180 = call i64 @"sx_f64_sub"(i64 %t1178, i64 %t1179)
  %t1181 = call i64 @"sx_f64_mul"(i64 %t1177, i64 %t1180)
  store i64 %t1181, ptr %local.gg3.1124
  %t1182 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.220)
  %t1183 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.221)
  %t1184 = load i64, ptr %local.d0.1110
  %t1185 = load i64, ptr %local.t0.1102
  %t1186 = call i64 @"sx_f64_sub"(i64 %t1184, i64 %t1185)
  %t1187 = call i64 @"sx_f64_mul"(i64 %t1183, i64 %t1186)
  %t1188 = call i64 @"sx_f64_sub"(i64 %t1182, i64 %t1187)
  %t1189 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.222)
  %t1190 = load i64, ptr %local.d0.1110
  %t1191 = load i64, ptr %local.g0.1106
  %t1192 = call i64 @"sx_f64_sub"(i64 %t1190, i64 %t1191)
  %t1193 = call i64 @"sx_f64_mul"(i64 %t1189, i64 %t1192)
  %t1194 = call i64 @"sx_f64_add"(i64 %t1188, i64 %t1193)
  store i64 %t1194, ptr %local.gd0.1125
  %t1195 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.223)
  %t1196 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.224)
  %t1197 = load i64, ptr %local.d1.1111
  %t1198 = load i64, ptr %local.t1.1103
  %t1199 = call i64 @"sx_f64_sub"(i64 %t1197, i64 %t1198)
  %t1200 = call i64 @"sx_f64_mul"(i64 %t1196, i64 %t1199)
  %t1201 = call i64 @"sx_f64_sub"(i64 %t1195, i64 %t1200)
  %t1202 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.225)
  %t1203 = load i64, ptr %local.d1.1111
  %t1204 = load i64, ptr %local.g1.1107
  %t1205 = call i64 @"sx_f64_sub"(i64 %t1203, i64 %t1204)
  %t1206 = call i64 @"sx_f64_mul"(i64 %t1202, i64 %t1205)
  %t1207 = call i64 @"sx_f64_add"(i64 %t1201, i64 %t1206)
  store i64 %t1207, ptr %local.gd1.1126
  %t1208 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.226)
  %t1209 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.227)
  %t1210 = load i64, ptr %local.d2.1112
  %t1211 = load i64, ptr %local.t2.1104
  %t1212 = call i64 @"sx_f64_sub"(i64 %t1210, i64 %t1211)
  %t1213 = call i64 @"sx_f64_mul"(i64 %t1209, i64 %t1212)
  %t1214 = call i64 @"sx_f64_sub"(i64 %t1208, i64 %t1213)
  %t1215 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.228)
  %t1216 = load i64, ptr %local.d2.1112
  %t1217 = load i64, ptr %local.g2.1108
  %t1218 = call i64 @"sx_f64_sub"(i64 %t1216, i64 %t1217)
  %t1219 = call i64 @"sx_f64_mul"(i64 %t1215, i64 %t1218)
  %t1220 = call i64 @"sx_f64_add"(i64 %t1214, i64 %t1219)
  store i64 %t1220, ptr %local.gd2.1127
  %t1221 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.229)
  %t1222 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.230)
  %t1223 = load i64, ptr %local.d3.1113
  %t1224 = load i64, ptr %local.t3.1105
  %t1225 = call i64 @"sx_f64_sub"(i64 %t1223, i64 %t1224)
  %t1226 = call i64 @"sx_f64_mul"(i64 %t1222, i64 %t1225)
  %t1227 = call i64 @"sx_f64_sub"(i64 %t1221, i64 %t1226)
  %t1228 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.231)
  %t1229 = load i64, ptr %local.d3.1113
  %t1230 = load i64, ptr %local.g3.1109
  %t1231 = call i64 @"sx_f64_sub"(i64 %t1229, i64 %t1230)
  %t1232 = call i64 @"sx_f64_mul"(i64 %t1228, i64 %t1231)
  %t1233 = call i64 @"sx_f64_add"(i64 %t1227, i64 %t1232)
  store i64 %t1233, ptr %local.gd3.1128
  %t1234 = load i64, ptr %local.gg0.1121
  %t1235 = load i64, ptr %local.gg1.1122
  %t1236 = load i64, ptr %local.gg2.1123
  %t1237 = load i64, ptr %local.gg3.1124
  %t1238 = load i64, ptr %local.gd0.1125
  %t1239 = load i64, ptr %local.gd1.1126
  %t1240 = load i64, ptr %local.gd2.1127
  %t1241 = load i64, ptr %local.gd3.1128
  %t1242 = call i64 @"cosine4"(i64 %t1234, i64 %t1235, i64 %t1236, i64 %t1237, i64 %t1238, i64 %t1239, i64 %t1240, i64 %t1241)
  store i64 %t1242, ptr %local.cosine.1116
  %t1243 = load i64, ptr %local.cosine.1116
  %t1244 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.232)
  %t1245 = call i64 @"sx_f64_lt"(i64 %t1243, i64 %t1244)
  %t1246 = icmp ne i64 %t1245, 0
  br i1 %t1246, label %then16, label %else16
then16:
  %t1247 = load i64, ptr %local.a_gd
  %t1248 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.233)
  %t1249 = load i64, ptr %local.cosine.1116
  %t1250 = call i64 @"sx_f64_sub"(i64 %t1248, i64 %t1249)
  %t1251 = call i64 @"sx_f64_mul"(i64 %t1247, i64 %t1250)
  store i64 %t1251, ptr %local.scale_gd.1119
  %t1252 = load i64, ptr %local.gd0.1125
  %t1253 = load i64, ptr %local.gd1.1126
  %t1254 = load i64, ptr %local.gd2.1127
  %t1255 = load i64, ptr %local.gd3.1128
  %t1256 = load i64, ptr %local.gd0.1125
  %t1257 = load i64, ptr %local.gd1.1126
  %t1258 = load i64, ptr %local.gd2.1127
  %t1259 = load i64, ptr %local.gd3.1128
  %t1260 = call i64 @"dot4"(i64 %t1252, i64 %t1253, i64 %t1254, i64 %t1255, i64 %t1256, i64 %t1257, i64 %t1258, i64 %t1259)
  %t1261 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.234)
  %t1262 = call i64 @"sx_f64_add"(i64 %t1260, i64 %t1261)
  store i64 %t1262, ptr %local.sq.1118
  %t1263 = load i64, ptr %local.scale_gd.1119
  %t1264 = load i64, ptr %local.gg0.1121
  %t1265 = load i64, ptr %local.gg1.1122
  %t1266 = load i64, ptr %local.gg2.1123
  %t1267 = load i64, ptr %local.gg3.1124
  %t1268 = load i64, ptr %local.gd0.1125
  %t1269 = load i64, ptr %local.gd1.1126
  %t1270 = load i64, ptr %local.gd2.1127
  %t1271 = load i64, ptr %local.gd3.1128
  %t1272 = call i64 @"dot4"(i64 %t1264, i64 %t1265, i64 %t1266, i64 %t1267, i64 %t1268, i64 %t1269, i64 %t1270, i64 %t1271)
  %t1273 = call i64 @"sx_f64_mul"(i64 %t1263, i64 %t1272)
  %t1274 = load i64, ptr %local.sq.1118
  %t1275 = call i64 @"sx_f64_div"(i64 %t1273, i64 %t1274)
  store i64 %t1275, ptr %local.proj.1117
  %t1276 = load i64, ptr %local.gg0.1121
  %t1277 = load i64, ptr %local.proj.1117
  %t1278 = load i64, ptr %local.gd0.1125
  %t1279 = call i64 @"sx_f64_mul"(i64 %t1277, i64 %t1278)
  %t1280 = call i64 @"sx_f64_sub"(i64 %t1276, i64 %t1279)
  store i64 %t1280, ptr %local.gg0.1121
  %t1281 = load i64, ptr %local.gg1.1122
  %t1282 = load i64, ptr %local.proj.1117
  %t1283 = load i64, ptr %local.gd1.1126
  %t1284 = call i64 @"sx_f64_mul"(i64 %t1282, i64 %t1283)
  %t1285 = call i64 @"sx_f64_sub"(i64 %t1281, i64 %t1284)
  store i64 %t1285, ptr %local.gg1.1122
  %t1286 = load i64, ptr %local.gg2.1123
  %t1287 = load i64, ptr %local.proj.1117
  %t1288 = load i64, ptr %local.gd2.1127
  %t1289 = call i64 @"sx_f64_mul"(i64 %t1287, i64 %t1288)
  %t1290 = call i64 @"sx_f64_sub"(i64 %t1286, i64 %t1289)
  store i64 %t1290, ptr %local.gg2.1123
  %t1291 = load i64, ptr %local.gg3.1124
  %t1292 = load i64, ptr %local.proj.1117
  %t1293 = load i64, ptr %local.gd3.1128
  %t1294 = call i64 @"sx_f64_mul"(i64 %t1292, i64 %t1293)
  %t1295 = call i64 @"sx_f64_sub"(i64 %t1291, i64 %t1294)
  store i64 %t1295, ptr %local.gg3.1124
  %t1296 = load i64, ptr %local.a_dg
  %t1297 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.235)
  %t1298 = load i64, ptr %local.cosine.1116
  %t1299 = call i64 @"sx_f64_sub"(i64 %t1297, i64 %t1298)
  %t1300 = call i64 @"sx_f64_mul"(i64 %t1296, i64 %t1299)
  store i64 %t1300, ptr %local.scale_dg.1120
  %t1301 = load i64, ptr %local.gg0.1121
  %t1302 = load i64, ptr %local.gg1.1122
  %t1303 = load i64, ptr %local.gg2.1123
  %t1304 = load i64, ptr %local.gg3.1124
  %t1305 = load i64, ptr %local.gg0.1121
  %t1306 = load i64, ptr %local.gg1.1122
  %t1307 = load i64, ptr %local.gg2.1123
  %t1308 = load i64, ptr %local.gg3.1124
  %t1309 = call i64 @"dot4"(i64 %t1301, i64 %t1302, i64 %t1303, i64 %t1304, i64 %t1305, i64 %t1306, i64 %t1307, i64 %t1308)
  %t1310 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.236)
  %t1311 = call i64 @"sx_f64_add"(i64 %t1309, i64 %t1310)
  store i64 %t1311, ptr %local.sq.1118
  %t1312 = load i64, ptr %local.scale_dg.1120
  %t1313 = load i64, ptr %local.gd0.1125
  %t1314 = load i64, ptr %local.gd1.1126
  %t1315 = load i64, ptr %local.gd2.1127
  %t1316 = load i64, ptr %local.gd3.1128
  %t1317 = load i64, ptr %local.gg0.1121
  %t1318 = load i64, ptr %local.gg1.1122
  %t1319 = load i64, ptr %local.gg2.1123
  %t1320 = load i64, ptr %local.gg3.1124
  %t1321 = call i64 @"dot4"(i64 %t1313, i64 %t1314, i64 %t1315, i64 %t1316, i64 %t1317, i64 %t1318, i64 %t1319, i64 %t1320)
  %t1322 = call i64 @"sx_f64_mul"(i64 %t1312, i64 %t1321)
  %t1323 = load i64, ptr %local.sq.1118
  %t1324 = call i64 @"sx_f64_div"(i64 %t1322, i64 %t1323)
  store i64 %t1324, ptr %local.proj.1117
  %t1325 = load i64, ptr %local.gd0.1125
  %t1326 = load i64, ptr %local.proj.1117
  %t1327 = load i64, ptr %local.gg0.1121
  %t1328 = call i64 @"sx_f64_mul"(i64 %t1326, i64 %t1327)
  %t1329 = call i64 @"sx_f64_sub"(i64 %t1325, i64 %t1328)
  store i64 %t1329, ptr %local.gd0.1125
  %t1330 = load i64, ptr %local.gd1.1126
  %t1331 = load i64, ptr %local.proj.1117
  %t1332 = load i64, ptr %local.gg1.1122
  %t1333 = call i64 @"sx_f64_mul"(i64 %t1331, i64 %t1332)
  %t1334 = call i64 @"sx_f64_sub"(i64 %t1330, i64 %t1333)
  store i64 %t1334, ptr %local.gd1.1126
  %t1335 = load i64, ptr %local.gd2.1127
  %t1336 = load i64, ptr %local.proj.1117
  %t1337 = load i64, ptr %local.gg2.1123
  %t1338 = call i64 @"sx_f64_mul"(i64 %t1336, i64 %t1337)
  %t1339 = call i64 @"sx_f64_sub"(i64 %t1335, i64 %t1338)
  store i64 %t1339, ptr %local.gd2.1127
  %t1340 = load i64, ptr %local.gd3.1128
  %t1341 = load i64, ptr %local.proj.1117
  %t1342 = load i64, ptr %local.gg3.1124
  %t1343 = call i64 @"sx_f64_mul"(i64 %t1341, i64 %t1342)
  %t1344 = call i64 @"sx_f64_sub"(i64 %t1340, i64 %t1343)
  store i64 %t1344, ptr %local.gd3.1128
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t1345 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t1346 = load i64, ptr %local.g0.1106
  %t1347 = load i64, ptr %local.lr.1114
  %t1348 = load i64, ptr %local.gg0.1121
  %t1349 = call i64 @"sx_f64_mul"(i64 %t1347, i64 %t1348)
  %t1350 = call i64 @"sx_f64_sub"(i64 %t1346, i64 %t1349)
  store i64 %t1350, ptr %local.g0.1106
  %t1351 = load i64, ptr %local.g1.1107
  %t1352 = load i64, ptr %local.lr.1114
  %t1353 = load i64, ptr %local.gg1.1122
  %t1354 = call i64 @"sx_f64_mul"(i64 %t1352, i64 %t1353)
  %t1355 = call i64 @"sx_f64_sub"(i64 %t1351, i64 %t1354)
  store i64 %t1355, ptr %local.g1.1107
  %t1356 = load i64, ptr %local.g2.1108
  %t1357 = load i64, ptr %local.lr.1114
  %t1358 = load i64, ptr %local.gg2.1123
  %t1359 = call i64 @"sx_f64_mul"(i64 %t1357, i64 %t1358)
  %t1360 = call i64 @"sx_f64_sub"(i64 %t1356, i64 %t1359)
  store i64 %t1360, ptr %local.g2.1108
  %t1361 = load i64, ptr %local.g3.1109
  %t1362 = load i64, ptr %local.lr.1114
  %t1363 = load i64, ptr %local.gg3.1124
  %t1364 = call i64 @"sx_f64_mul"(i64 %t1362, i64 %t1363)
  %t1365 = call i64 @"sx_f64_sub"(i64 %t1361, i64 %t1364)
  store i64 %t1365, ptr %local.g3.1109
  %t1366 = load i64, ptr %local.d0.1110
  %t1367 = load i64, ptr %local.lr.1114
  %t1368 = load i64, ptr %local.gd0.1125
  %t1369 = call i64 @"sx_f64_mul"(i64 %t1367, i64 %t1368)
  %t1370 = call i64 @"sx_f64_sub"(i64 %t1366, i64 %t1369)
  store i64 %t1370, ptr %local.d0.1110
  %t1371 = load i64, ptr %local.d1.1111
  %t1372 = load i64, ptr %local.lr.1114
  %t1373 = load i64, ptr %local.gd1.1126
  %t1374 = call i64 @"sx_f64_mul"(i64 %t1372, i64 %t1373)
  %t1375 = call i64 @"sx_f64_sub"(i64 %t1371, i64 %t1374)
  store i64 %t1375, ptr %local.d1.1111
  %t1376 = load i64, ptr %local.d2.1112
  %t1377 = load i64, ptr %local.lr.1114
  %t1378 = load i64, ptr %local.gd2.1127
  %t1379 = call i64 @"sx_f64_mul"(i64 %t1377, i64 %t1378)
  %t1380 = call i64 @"sx_f64_sub"(i64 %t1376, i64 %t1379)
  store i64 %t1380, ptr %local.d2.1112
  %t1381 = load i64, ptr %local.d3.1113
  %t1382 = load i64, ptr %local.lr.1114
  %t1383 = load i64, ptr %local.gd3.1128
  %t1384 = call i64 @"sx_f64_mul"(i64 %t1382, i64 %t1383)
  %t1385 = call i64 @"sx_f64_sub"(i64 %t1381, i64 %t1384)
  store i64 %t1385, ptr %local.d3.1113
  %t1386 = load i64, ptr %local.step.1115
  %t1387 = add i64 %t1386, 1
  store i64 %t1387, ptr %local.step.1115
  br label %loop15
endloop15:
  %t1388 = load i64, ptr %local.g0.1106
  %t1389 = load i64, ptr %local.g1.1107
  %t1390 = load i64, ptr %local.g2.1108
  %t1391 = load i64, ptr %local.g3.1109
  %t1392 = load i64, ptr %local.t0.1102
  %t1393 = load i64, ptr %local.t1.1103
  %t1394 = load i64, ptr %local.t2.1104
  %t1395 = load i64, ptr %local.t3.1105
  %t1396 = call i64 @"dist4"(i64 %t1388, i64 %t1389, i64 %t1390, i64 %t1391, i64 %t1392, i64 %t1393, i64 %t1394, i64 %t1395)
  ret i64 %t1396
}

define i64 @"meta_grad_gan"(i64 %a_gd, i64 %a_dg, i64 %which, i64 %steps) nounwind {
entry:
  %local.h.1397 = alloca i64
  %local.gd_p.1398 = alloca i64
  %local.dg_p.1399 = alloca i64
  %local.gd_m.1400 = alloca i64
  %local.dg_m.1401 = alloca i64
  %local.lp.1402 = alloca i64
  %local.lm.1403 = alloca i64
  %local.a_gd = alloca i64
  store i64 %a_gd, ptr %local.a_gd
  %local.a_dg = alloca i64
  store i64 %a_dg, ptr %local.a_dg
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1404 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.237)
  store i64 %t1404, ptr %local.h.1397
  %t1405 = load i64, ptr %local.a_gd
  store i64 %t1405, ptr %local.gd_p.1398
  %t1406 = load i64, ptr %local.a_dg
  store i64 %t1406, ptr %local.dg_p.1399
  %t1407 = load i64, ptr %local.a_gd
  store i64 %t1407, ptr %local.gd_m.1400
  %t1408 = load i64, ptr %local.a_dg
  store i64 %t1408, ptr %local.dg_m.1401
  %t1409 = load i64, ptr %local.which
  %t1410 = icmp eq i64 %t1409, 0
  %t1411 = zext i1 %t1410 to i64
  %t1412 = icmp ne i64 %t1411, 0
  br i1 %t1412, label %then17, label %else17
then17:
  %t1413 = load i64, ptr %local.a_gd
  %t1414 = load i64, ptr %local.h.1397
  %t1415 = call i64 @"sx_f64_add"(i64 %t1413, i64 %t1414)
  store i64 %t1415, ptr %local.gd_p.1398
  %t1416 = load i64, ptr %local.a_gd
  %t1417 = load i64, ptr %local.h.1397
  %t1418 = call i64 @"sx_f64_sub"(i64 %t1416, i64 %t1417)
  store i64 %t1418, ptr %local.gd_m.1400
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t1419 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t1420 = load i64, ptr %local.which
  %t1421 = icmp eq i64 %t1420, 1
  %t1422 = zext i1 %t1421 to i64
  %t1423 = icmp ne i64 %t1422, 0
  br i1 %t1423, label %then18, label %else18
then18:
  %t1424 = load i64, ptr %local.a_dg
  %t1425 = load i64, ptr %local.h.1397
  %t1426 = call i64 @"sx_f64_add"(i64 %t1424, i64 %t1425)
  store i64 %t1426, ptr %local.dg_p.1399
  %t1427 = load i64, ptr %local.a_dg
  %t1428 = load i64, ptr %local.h.1397
  %t1429 = call i64 @"sx_f64_sub"(i64 %t1427, i64 %t1428)
  store i64 %t1429, ptr %local.dg_m.1401
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t1430 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t1431 = load i64, ptr %local.gd_p.1398
  %t1432 = load i64, ptr %local.dg_p.1399
  %t1433 = load i64, ptr %local.steps
  %t1434 = call i64 @"train_asym_gan"(i64 %t1431, i64 %t1432, i64 %t1433)
  store i64 %t1434, ptr %local.lp.1402
  %t1435 = load i64, ptr %local.gd_m.1400
  %t1436 = load i64, ptr %local.dg_m.1401
  %t1437 = load i64, ptr %local.steps
  %t1438 = call i64 @"train_asym_gan"(i64 %t1435, i64 %t1436, i64 %t1437)
  store i64 %t1438, ptr %local.lm.1403
  %t1439 = load i64, ptr %local.lp.1402
  %t1440 = load i64, ptr %local.lm.1403
  %t1441 = call i64 @"sx_f64_sub"(i64 %t1439, i64 %t1440)
  %t1442 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.238)
  %t1443 = load i64, ptr %local.h.1397
  %t1444 = call i64 @"sx_f64_mul"(i64 %t1442, i64 %t1443)
  %t1445 = call i64 @"sx_f64_div"(i64 %t1441, i64 %t1444)
  ret i64 %t1445
}

define i64 @"test_learned_interaction"() nounwind {
entry:
  %local.a_gd.1446 = alloca i64
  %local.a_dg.1447 = alloca i64
  %local.mg.1448 = alloca i64
  %local.cycle.1449 = alloca i64
  %local.meta_lr.1450 = alloca i64
  %local.inner.1451 = alloca i64
  %local.dist_init.1452 = alloca i64
  %local.dist_learned.1453 = alloca i64
  %local.dist_none.1454 = alloca i64
  %local.dist_sym.1455 = alloca i64
  %local.asym.1456 = alloca i64
  %t1457 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.239)
  %t1458 = ptrtoint ptr %t1457 to i64
  %t1459 = inttoptr i64 %t1458 to ptr
  call void @intrinsic_println(ptr %t1459)
  %t1460 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.240)
  %t1461 = ptrtoint ptr %t1460 to i64
  %t1462 = inttoptr i64 %t1461 to ptr
  call void @intrinsic_println(ptr %t1462)
  %t1463 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.241)
  %t1464 = ptrtoint ptr %t1463 to i64
  %t1465 = inttoptr i64 %t1464 to ptr
  call void @intrinsic_println(ptr %t1465)
  %t1466 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.242)
  %t1467 = ptrtoint ptr %t1466 to i64
  %t1468 = inttoptr i64 %t1467 to ptr
  call void @intrinsic_println(ptr %t1468)
  %t1469 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.243)
  store i64 %t1469, ptr %local.a_gd.1446
  %t1470 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.244)
  store i64 %t1470, ptr %local.a_dg.1447
  %t1471 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.245)
  store i64 %t1471, ptr %local.mg.1448
  store i64 0, ptr %local.cycle.1449
  %t1472 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.246)
  store i64 %t1472, ptr %local.meta_lr.1450
  store i64 100, ptr %local.inner.1451
  %t1473 = load i64, ptr %local.a_gd.1446
  %t1474 = load i64, ptr %local.a_dg.1447
  %t1475 = load i64, ptr %local.inner.1451
  %t1476 = call i64 @"train_asym_gan"(i64 %t1473, i64 %t1474, i64 %t1475)
  store i64 %t1476, ptr %local.dist_init.1452
  %t1477 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.247)
  %t1478 = ptrtoint ptr %t1477 to i64
  %t1479 = inttoptr i64 %t1478 to ptr
  call void @intrinsic_print(ptr %t1479)
  %t1480 = load i64, ptr %local.dist_init.1452
  %t1481 = call i64 @"print_f64"(i64 %t1480)
  %t1482 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.248)
  %t1483 = ptrtoint ptr %t1482 to i64
  %t1484 = inttoptr i64 %t1483 to ptr
  call void @intrinsic_println(ptr %t1484)
  br label %loop19
loop19:
  %t1485 = load i64, ptr %local.cycle.1449
  %t1486 = icmp slt i64 %t1485, 50
  %t1487 = zext i1 %t1486 to i64
  %t1488 = icmp ne i64 %t1487, 0
  br i1 %t1488, label %body19, label %endloop19
body19:
  %t1489 = load i64, ptr %local.a_gd.1446
  %t1490 = load i64, ptr %local.a_dg.1447
  %t1491 = load i64, ptr %local.inner.1451
  %t1492 = call i64 @"meta_grad_gan"(i64 %t1489, i64 %t1490, i64 0, i64 %t1491)
  store i64 %t1492, ptr %local.mg.1448
  %t1493 = load i64, ptr %local.a_gd.1446
  %t1494 = load i64, ptr %local.meta_lr.1450
  %t1495 = load i64, ptr %local.mg.1448
  %t1496 = call i64 @"sx_f64_mul"(i64 %t1494, i64 %t1495)
  %t1497 = call i64 @"sx_f64_sub"(i64 %t1493, i64 %t1496)
  %t1498 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.249)
  %t1499 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.250)
  %t1500 = call i64 @"clamp"(i64 %t1497, i64 %t1498, i64 %t1499)
  store i64 %t1500, ptr %local.a_gd.1446
  %t1501 = load i64, ptr %local.a_gd.1446
  %t1502 = load i64, ptr %local.a_dg.1447
  %t1503 = load i64, ptr %local.inner.1451
  %t1504 = call i64 @"meta_grad_gan"(i64 %t1501, i64 %t1502, i64 1, i64 %t1503)
  store i64 %t1504, ptr %local.mg.1448
  %t1505 = load i64, ptr %local.a_dg.1447
  %t1506 = load i64, ptr %local.meta_lr.1450
  %t1507 = load i64, ptr %local.mg.1448
  %t1508 = call i64 @"sx_f64_mul"(i64 %t1506, i64 %t1507)
  %t1509 = call i64 @"sx_f64_sub"(i64 %t1505, i64 %t1508)
  %t1510 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.251)
  %t1511 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.252)
  %t1512 = call i64 @"clamp"(i64 %t1509, i64 %t1510, i64 %t1511)
  store i64 %t1512, ptr %local.a_dg.1447
  %t1513 = load i64, ptr %local.cycle.1449
  %t1514 = icmp eq i64 %t1513, 0
  %t1515 = zext i1 %t1514 to i64
  %t1516 = icmp ne i64 %t1515, 0
  br i1 %t1516, label %then20, label %else20
then20:
  %t1517 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.253)
  %t1518 = ptrtoint ptr %t1517 to i64
  %t1519 = inttoptr i64 %t1518 to ptr
  call void @intrinsic_print(ptr %t1519)
  %t1520 = load i64, ptr %local.a_gd.1446
  %t1521 = call i64 @"print_f64"(i64 %t1520)
  %t1522 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.254)
  %t1523 = ptrtoint ptr %t1522 to i64
  %t1524 = inttoptr i64 %t1523 to ptr
  call void @intrinsic_print(ptr %t1524)
  %t1525 = load i64, ptr %local.a_dg.1447
  %t1526 = call i64 @"print_f64"(i64 %t1525)
  %t1527 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.255)
  %t1528 = ptrtoint ptr %t1527 to i64
  %t1529 = inttoptr i64 %t1528 to ptr
  call void @intrinsic_println(ptr %t1529)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t1530 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t1531 = load i64, ptr %local.cycle.1449
  %t1532 = icmp eq i64 %t1531, 24
  %t1533 = zext i1 %t1532 to i64
  %t1534 = icmp ne i64 %t1533, 0
  br i1 %t1534, label %then21, label %else21
then21:
  %t1535 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.256)
  %t1536 = ptrtoint ptr %t1535 to i64
  %t1537 = inttoptr i64 %t1536 to ptr
  call void @intrinsic_print(ptr %t1537)
  %t1538 = load i64, ptr %local.a_gd.1446
  %t1539 = call i64 @"print_f64"(i64 %t1538)
  %t1540 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.257)
  %t1541 = ptrtoint ptr %t1540 to i64
  %t1542 = inttoptr i64 %t1541 to ptr
  call void @intrinsic_print(ptr %t1542)
  %t1543 = load i64, ptr %local.a_dg.1447
  %t1544 = call i64 @"print_f64"(i64 %t1543)
  %t1545 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.258)
  %t1546 = ptrtoint ptr %t1545 to i64
  %t1547 = inttoptr i64 %t1546 to ptr
  call void @intrinsic_println(ptr %t1547)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t1548 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t1549 = load i64, ptr %local.cycle.1449
  %t1550 = icmp eq i64 %t1549, 49
  %t1551 = zext i1 %t1550 to i64
  %t1552 = icmp ne i64 %t1551, 0
  br i1 %t1552, label %then22, label %else22
then22:
  %t1553 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.259)
  %t1554 = ptrtoint ptr %t1553 to i64
  %t1555 = inttoptr i64 %t1554 to ptr
  call void @intrinsic_print(ptr %t1555)
  %t1556 = load i64, ptr %local.a_gd.1446
  %t1557 = call i64 @"print_f64"(i64 %t1556)
  %t1558 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.260)
  %t1559 = ptrtoint ptr %t1558 to i64
  %t1560 = inttoptr i64 %t1559 to ptr
  call void @intrinsic_print(ptr %t1560)
  %t1561 = load i64, ptr %local.a_dg.1447
  %t1562 = call i64 @"print_f64"(i64 %t1561)
  %t1563 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.261)
  %t1564 = ptrtoint ptr %t1563 to i64
  %t1565 = inttoptr i64 %t1564 to ptr
  call void @intrinsic_println(ptr %t1565)
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t1566 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t1567 = load i64, ptr %local.cycle.1449
  %t1568 = add i64 %t1567, 1
  store i64 %t1568, ptr %local.cycle.1449
  br label %loop19
endloop19:
  %t1569 = load i64, ptr %local.a_gd.1446
  %t1570 = load i64, ptr %local.a_dg.1447
  %t1571 = load i64, ptr %local.inner.1451
  %t1572 = call i64 @"train_asym_gan"(i64 %t1569, i64 %t1570, i64 %t1571)
  store i64 %t1572, ptr %local.dist_learned.1453
  %t1573 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.262)
  %t1574 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.263)
  %t1575 = load i64, ptr %local.inner.1451
  %t1576 = call i64 @"train_asym_gan"(i64 %t1573, i64 %t1574, i64 %t1575)
  store i64 %t1576, ptr %local.dist_none.1454
  %t1577 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.264)
  %t1578 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.265)
  %t1579 = load i64, ptr %local.inner.1451
  %t1580 = call i64 @"train_asym_gan"(i64 %t1577, i64 %t1578, i64 %t1579)
  store i64 %t1580, ptr %local.dist_sym.1455
  %t1581 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.266)
  %t1582 = ptrtoint ptr %t1581 to i64
  %t1583 = inttoptr i64 %t1582 to ptr
  call void @intrinsic_println(ptr %t1583)
  %t1584 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.267)
  %t1585 = ptrtoint ptr %t1584 to i64
  %t1586 = inttoptr i64 %t1585 to ptr
  call void @intrinsic_print(ptr %t1586)
  %t1587 = load i64, ptr %local.dist_none.1454
  %t1588 = call i64 @"print_f64"(i64 %t1587)
  %t1589 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.268)
  %t1590 = ptrtoint ptr %t1589 to i64
  %t1591 = inttoptr i64 %t1590 to ptr
  call void @intrinsic_println(ptr %t1591)
  %t1592 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.269)
  %t1593 = ptrtoint ptr %t1592 to i64
  %t1594 = inttoptr i64 %t1593 to ptr
  call void @intrinsic_print(ptr %t1594)
  %t1595 = load i64, ptr %local.dist_sym.1455
  %t1596 = call i64 @"print_f64"(i64 %t1595)
  %t1597 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.270)
  %t1598 = ptrtoint ptr %t1597 to i64
  %t1599 = inttoptr i64 %t1598 to ptr
  call void @intrinsic_println(ptr %t1599)
  %t1600 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.271)
  %t1601 = ptrtoint ptr %t1600 to i64
  %t1602 = inttoptr i64 %t1601 to ptr
  call void @intrinsic_print(ptr %t1602)
  %t1603 = load i64, ptr %local.a_gd.1446
  %t1604 = call i64 @"print_f64"(i64 %t1603)
  %t1605 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.272)
  %t1606 = ptrtoint ptr %t1605 to i64
  %t1607 = inttoptr i64 %t1606 to ptr
  call void @intrinsic_print(ptr %t1607)
  %t1608 = load i64, ptr %local.a_dg.1447
  %t1609 = call i64 @"print_f64"(i64 %t1608)
  %t1610 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.273)
  %t1611 = ptrtoint ptr %t1610 to i64
  %t1612 = inttoptr i64 %t1611 to ptr
  call void @intrinsic_print(ptr %t1612)
  %t1613 = load i64, ptr %local.dist_learned.1453
  %t1614 = call i64 @"print_f64"(i64 %t1613)
  %t1615 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.274)
  %t1616 = ptrtoint ptr %t1615 to i64
  %t1617 = inttoptr i64 %t1616 to ptr
  call void @intrinsic_println(ptr %t1617)
  %t1618 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.275)
  %t1619 = ptrtoint ptr %t1618 to i64
  %t1620 = inttoptr i64 %t1619 to ptr
  call void @intrinsic_println(ptr %t1620)
  %t1621 = load i64, ptr %local.a_gd.1446
  %t1622 = load i64, ptr %local.a_dg.1447
  %t1623 = call i64 @"sx_f64_sub"(i64 %t1621, i64 %t1622)
  %t1624 = call i64 @"abs_f64"(i64 %t1623)
  store i64 %t1624, ptr %local.asym.1456
  %t1625 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.276)
  %t1626 = ptrtoint ptr %t1625 to i64
  %t1627 = inttoptr i64 %t1626 to ptr
  call void @intrinsic_print(ptr %t1627)
  %t1628 = load i64, ptr %local.asym.1456
  %t1629 = call i64 @"print_f64"(i64 %t1628)
  %t1630 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.277)
  %t1631 = ptrtoint ptr %t1630 to i64
  %t1632 = inttoptr i64 %t1631 to ptr
  call void @intrinsic_println(ptr %t1632)
  %t1633 = load i64, ptr %local.asym.1456
  %t1634 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.278)
  %t1635 = call i64 @"sx_f64_gt"(i64 %t1633, i64 %t1634)
  %t1636 = icmp ne i64 %t1635, 0
  br i1 %t1636, label %then23, label %else23
then23:
  %t1637 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.279)
  %t1638 = ptrtoint ptr %t1637 to i64
  %t1639 = inttoptr i64 %t1638 to ptr
  call void @intrinsic_println(ptr %t1639)
  %t1640 = load i64, ptr %local.a_gd.1446
  %t1641 = load i64, ptr %local.a_dg.1447
  %t1642 = call i64 @"sx_f64_gt"(i64 %t1640, i64 %t1641)
  %t1643 = icmp ne i64 %t1642, 0
  br i1 %t1643, label %then24, label %else24
then24:
  %t1644 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.280)
  %t1645 = ptrtoint ptr %t1644 to i64
  %t1646 = inttoptr i64 %t1645 to ptr
  call void @intrinsic_println(ptr %t1646)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t1647 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.281)
  %t1648 = ptrtoint ptr %t1647 to i64
  %t1649 = inttoptr i64 %t1648 to ptr
  call void @intrinsic_println(ptr %t1649)
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t1650 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t1651 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.282)
  %t1652 = ptrtoint ptr %t1651 to i64
  %t1653 = inttoptr i64 %t1652 to ptr
  call void @intrinsic_println(ptr %t1653)
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t1654 = phi i64 [ %t1650, %then23_end ], [ 0, %else23_end ]
  %t1655 = load i64, ptr %local.dist_learned.1453
  %t1656 = load i64, ptr %local.dist_none.1454
  %t1657 = call i64 @"sx_f64_lt"(i64 %t1655, i64 %t1656)
  %t1658 = icmp ne i64 %t1657, 0
  br i1 %t1658, label %then25, label %else25
then25:
  %t1659 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.283)
  %t1660 = ptrtoint ptr %t1659 to i64
  %t1661 = inttoptr i64 %t1660 to ptr
  call void @intrinsic_println(ptr %t1661)
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t1662 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t1663 = load i64, ptr %local.dist_learned.1453
  %t1664 = load i64, ptr %local.dist_sym.1455
  %t1665 = call i64 @"sx_f64_lt"(i64 %t1663, i64 %t1664)
  %t1666 = icmp ne i64 %t1665, 0
  br i1 %t1666, label %then26, label %else26
then26:
  %t1667 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.284)
  %t1668 = ptrtoint ptr %t1667 to i64
  %t1669 = inttoptr i64 %t1668 to ptr
  call void @intrinsic_println(ptr %t1669)
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t1670 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t1671 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.285)
  %t1672 = ptrtoint ptr %t1671 to i64
  %t1673 = inttoptr i64 %t1672 to ptr
  call void @intrinsic_println(ptr %t1673)
  ret i64 0
}

define i64 @"train_skeptical_gan"(i64 %coupling, i64 %steps) nounwind {
entry:
  %local.t0.1674 = alloca i64
  %local.t1.1675 = alloca i64
  %local.t2.1676 = alloca i64
  %local.t3.1677 = alloca i64
  %local.sk0.1678 = alloca i64
  %local.sk1.1679 = alloca i64
  %local.sk2.1680 = alloca i64
  %local.sk3.1681 = alloca i64
  %local.g0.1682 = alloca i64
  %local.g1.1683 = alloca i64
  %local.g2.1684 = alloca i64
  %local.g3.1685 = alloca i64
  %local.d0.1686 = alloca i64
  %local.d1.1687 = alloca i64
  %local.d2.1688 = alloca i64
  %local.d3.1689 = alloca i64
  %local.lr.1690 = alloca i64
  %local.step.1691 = alloca i64
  %local.cosine.1692 = alloca i64
  %local.proj.1693 = alloca i64
  %local.sq.1694 = alloca i64
  %local.scale.1695 = alloca i64
  %local.gg0.1696 = alloca i64
  %local.gg1.1697 = alloca i64
  %local.gg2.1698 = alloca i64
  %local.gg3.1699 = alloca i64
  %local.gd0.1700 = alloca i64
  %local.gd1.1701 = alloca i64
  %local.gd2.1702 = alloca i64
  %local.gd3.1703 = alloca i64
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1704 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.286)
  store i64 %t1704, ptr %local.t0.1674
  %t1705 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.287)
  %t1706 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.288)
  %t1707 = call i64 @"sx_f64_sub"(i64 %t1705, i64 %t1706)
  store i64 %t1707, ptr %local.t1.1675
  %t1708 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.289)
  store i64 %t1708, ptr %local.t2.1676
  %t1709 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.290)
  store i64 %t1709, ptr %local.t3.1677
  %t1710 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.291)
  store i64 %t1710, ptr %local.sk0.1678
  %t1711 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.292)
  store i64 %t1711, ptr %local.sk1.1679
  %t1712 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.293)
  store i64 %t1712, ptr %local.sk2.1680
  %t1713 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.294)
  store i64 %t1713, ptr %local.sk3.1681
  %t1714 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.295)
  store i64 %t1714, ptr %local.g0.1682
  %t1715 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.296)
  store i64 %t1715, ptr %local.g1.1683
  %t1716 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.297)
  store i64 %t1716, ptr %local.g2.1684
  %t1717 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.298)
  store i64 %t1717, ptr %local.g3.1685
  %t1718 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.299)
  store i64 %t1718, ptr %local.d0.1686
  %t1719 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.300)
  store i64 %t1719, ptr %local.d1.1687
  %t1720 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.301)
  store i64 %t1720, ptr %local.d2.1688
  %t1721 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.302)
  store i64 %t1721, ptr %local.d3.1689
  %t1722 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.303)
  store i64 %t1722, ptr %local.lr.1690
  store i64 0, ptr %local.step.1691
  %t1723 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.304)
  store i64 %t1723, ptr %local.cosine.1692
  %t1724 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.305)
  store i64 %t1724, ptr %local.proj.1693
  %t1725 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.306)
  store i64 %t1725, ptr %local.sq.1694
  %t1726 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.307)
  store i64 %t1726, ptr %local.scale.1695
  %t1727 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.308)
  store i64 %t1727, ptr %local.gg0.1696
  %t1728 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.309)
  store i64 %t1728, ptr %local.gg1.1697
  %t1729 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.310)
  store i64 %t1729, ptr %local.gg2.1698
  %t1730 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.311)
  store i64 %t1730, ptr %local.gg3.1699
  %t1731 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.312)
  store i64 %t1731, ptr %local.gd0.1700
  %t1732 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.313)
  store i64 %t1732, ptr %local.gd1.1701
  %t1733 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.314)
  store i64 %t1733, ptr %local.gd2.1702
  %t1734 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.315)
  store i64 %t1734, ptr %local.gd3.1703
  br label %loop27
loop27:
  %t1735 = load i64, ptr %local.step.1691
  %t1736 = load i64, ptr %local.steps
  %t1737 = icmp slt i64 %t1735, %t1736
  %t1738 = zext i1 %t1737 to i64
  %t1739 = icmp ne i64 %t1738, 0
  br i1 %t1739, label %body27, label %endloop27
body27:
  %t1740 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.316)
  %t1741 = load i64, ptr %local.g0.1682
  %t1742 = load i64, ptr %local.d0.1686
  %t1743 = call i64 @"sx_f64_sub"(i64 %t1741, i64 %t1742)
  %t1744 = call i64 @"sx_f64_mul"(i64 %t1740, i64 %t1743)
  %t1745 = load i64, ptr %local.coupling
  %t1746 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.317)
  %t1747 = call i64 @"sx_f64_mul"(i64 %t1745, i64 %t1746)
  %t1748 = load i64, ptr %local.g0.1682
  %t1749 = load i64, ptr %local.sk0.1678
  %t1750 = call i64 @"sx_f64_sub"(i64 %t1748, i64 %t1749)
  %t1751 = call i64 @"sx_f64_mul"(i64 %t1747, i64 %t1750)
  %t1752 = call i64 @"sx_f64_add"(i64 %t1744, i64 %t1751)
  store i64 %t1752, ptr %local.gg0.1696
  %t1753 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.318)
  %t1754 = load i64, ptr %local.g1.1683
  %t1755 = load i64, ptr %local.d1.1687
  %t1756 = call i64 @"sx_f64_sub"(i64 %t1754, i64 %t1755)
  %t1757 = call i64 @"sx_f64_mul"(i64 %t1753, i64 %t1756)
  %t1758 = load i64, ptr %local.coupling
  %t1759 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.319)
  %t1760 = call i64 @"sx_f64_mul"(i64 %t1758, i64 %t1759)
  %t1761 = load i64, ptr %local.g1.1683
  %t1762 = load i64, ptr %local.sk1.1679
  %t1763 = call i64 @"sx_f64_sub"(i64 %t1761, i64 %t1762)
  %t1764 = call i64 @"sx_f64_mul"(i64 %t1760, i64 %t1763)
  %t1765 = call i64 @"sx_f64_add"(i64 %t1757, i64 %t1764)
  store i64 %t1765, ptr %local.gg1.1697
  %t1766 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.320)
  %t1767 = load i64, ptr %local.g2.1684
  %t1768 = load i64, ptr %local.d2.1688
  %t1769 = call i64 @"sx_f64_sub"(i64 %t1767, i64 %t1768)
  %t1770 = call i64 @"sx_f64_mul"(i64 %t1766, i64 %t1769)
  %t1771 = load i64, ptr %local.coupling
  %t1772 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.321)
  %t1773 = call i64 @"sx_f64_mul"(i64 %t1771, i64 %t1772)
  %t1774 = load i64, ptr %local.g2.1684
  %t1775 = load i64, ptr %local.sk2.1680
  %t1776 = call i64 @"sx_f64_sub"(i64 %t1774, i64 %t1775)
  %t1777 = call i64 @"sx_f64_mul"(i64 %t1773, i64 %t1776)
  %t1778 = call i64 @"sx_f64_add"(i64 %t1770, i64 %t1777)
  store i64 %t1778, ptr %local.gg2.1698
  %t1779 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.322)
  %t1780 = load i64, ptr %local.g3.1685
  %t1781 = load i64, ptr %local.d3.1689
  %t1782 = call i64 @"sx_f64_sub"(i64 %t1780, i64 %t1781)
  %t1783 = call i64 @"sx_f64_mul"(i64 %t1779, i64 %t1782)
  %t1784 = load i64, ptr %local.coupling
  %t1785 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.323)
  %t1786 = call i64 @"sx_f64_mul"(i64 %t1784, i64 %t1785)
  %t1787 = load i64, ptr %local.g3.1685
  %t1788 = load i64, ptr %local.sk3.1681
  %t1789 = call i64 @"sx_f64_sub"(i64 %t1787, i64 %t1788)
  %t1790 = call i64 @"sx_f64_mul"(i64 %t1786, i64 %t1789)
  %t1791 = call i64 @"sx_f64_add"(i64 %t1783, i64 %t1790)
  store i64 %t1791, ptr %local.gg3.1699
  %t1792 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.324)
  %t1793 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.325)
  %t1794 = load i64, ptr %local.d0.1686
  %t1795 = load i64, ptr %local.t0.1674
  %t1796 = call i64 @"sx_f64_sub"(i64 %t1794, i64 %t1795)
  %t1797 = call i64 @"sx_f64_mul"(i64 %t1793, i64 %t1796)
  %t1798 = call i64 @"sx_f64_sub"(i64 %t1792, i64 %t1797)
  %t1799 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.326)
  %t1800 = load i64, ptr %local.d0.1686
  %t1801 = load i64, ptr %local.g0.1682
  %t1802 = call i64 @"sx_f64_sub"(i64 %t1800, i64 %t1801)
  %t1803 = call i64 @"sx_f64_mul"(i64 %t1799, i64 %t1802)
  %t1804 = call i64 @"sx_f64_add"(i64 %t1798, i64 %t1803)
  store i64 %t1804, ptr %local.gd0.1700
  %t1805 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.327)
  %t1806 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.328)
  %t1807 = load i64, ptr %local.d1.1687
  %t1808 = load i64, ptr %local.t1.1675
  %t1809 = call i64 @"sx_f64_sub"(i64 %t1807, i64 %t1808)
  %t1810 = call i64 @"sx_f64_mul"(i64 %t1806, i64 %t1809)
  %t1811 = call i64 @"sx_f64_sub"(i64 %t1805, i64 %t1810)
  %t1812 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.329)
  %t1813 = load i64, ptr %local.d1.1687
  %t1814 = load i64, ptr %local.g1.1683
  %t1815 = call i64 @"sx_f64_sub"(i64 %t1813, i64 %t1814)
  %t1816 = call i64 @"sx_f64_mul"(i64 %t1812, i64 %t1815)
  %t1817 = call i64 @"sx_f64_add"(i64 %t1811, i64 %t1816)
  store i64 %t1817, ptr %local.gd1.1701
  %t1818 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.330)
  %t1819 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.331)
  %t1820 = load i64, ptr %local.d2.1688
  %t1821 = load i64, ptr %local.t2.1676
  %t1822 = call i64 @"sx_f64_sub"(i64 %t1820, i64 %t1821)
  %t1823 = call i64 @"sx_f64_mul"(i64 %t1819, i64 %t1822)
  %t1824 = call i64 @"sx_f64_sub"(i64 %t1818, i64 %t1823)
  %t1825 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.332)
  %t1826 = load i64, ptr %local.d2.1688
  %t1827 = load i64, ptr %local.g2.1684
  %t1828 = call i64 @"sx_f64_sub"(i64 %t1826, i64 %t1827)
  %t1829 = call i64 @"sx_f64_mul"(i64 %t1825, i64 %t1828)
  %t1830 = call i64 @"sx_f64_add"(i64 %t1824, i64 %t1829)
  store i64 %t1830, ptr %local.gd2.1702
  %t1831 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.333)
  %t1832 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.334)
  %t1833 = load i64, ptr %local.d3.1689
  %t1834 = load i64, ptr %local.t3.1677
  %t1835 = call i64 @"sx_f64_sub"(i64 %t1833, i64 %t1834)
  %t1836 = call i64 @"sx_f64_mul"(i64 %t1832, i64 %t1835)
  %t1837 = call i64 @"sx_f64_sub"(i64 %t1831, i64 %t1836)
  %t1838 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.335)
  %t1839 = load i64, ptr %local.d3.1689
  %t1840 = load i64, ptr %local.g3.1685
  %t1841 = call i64 @"sx_f64_sub"(i64 %t1839, i64 %t1840)
  %t1842 = call i64 @"sx_f64_mul"(i64 %t1838, i64 %t1841)
  %t1843 = call i64 @"sx_f64_add"(i64 %t1837, i64 %t1842)
  store i64 %t1843, ptr %local.gd3.1703
  %t1844 = load i64, ptr %local.gg0.1696
  %t1845 = load i64, ptr %local.gg1.1697
  %t1846 = load i64, ptr %local.gg2.1698
  %t1847 = load i64, ptr %local.gg3.1699
  %t1848 = load i64, ptr %local.gd0.1700
  %t1849 = load i64, ptr %local.gd1.1701
  %t1850 = load i64, ptr %local.gd2.1702
  %t1851 = load i64, ptr %local.gd3.1703
  %t1852 = call i64 @"cosine4"(i64 %t1844, i64 %t1845, i64 %t1846, i64 %t1847, i64 %t1848, i64 %t1849, i64 %t1850, i64 %t1851)
  store i64 %t1852, ptr %local.cosine.1692
  %t1853 = load i64, ptr %local.cosine.1692
  %t1854 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.336)
  %t1855 = call i64 @"sx_f64_lt"(i64 %t1853, i64 %t1854)
  %t1856 = icmp ne i64 %t1855, 0
  br i1 %t1856, label %then28, label %else28
then28:
  %t1857 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.337)
  %t1858 = load i64, ptr %local.cosine.1692
  %t1859 = call i64 @"sx_f64_sub"(i64 %t1857, i64 %t1858)
  store i64 %t1859, ptr %local.scale.1695
  %t1860 = load i64, ptr %local.gd0.1700
  %t1861 = load i64, ptr %local.gd1.1701
  %t1862 = load i64, ptr %local.gd2.1702
  %t1863 = load i64, ptr %local.gd3.1703
  %t1864 = load i64, ptr %local.gd0.1700
  %t1865 = load i64, ptr %local.gd1.1701
  %t1866 = load i64, ptr %local.gd2.1702
  %t1867 = load i64, ptr %local.gd3.1703
  %t1868 = call i64 @"dot4"(i64 %t1860, i64 %t1861, i64 %t1862, i64 %t1863, i64 %t1864, i64 %t1865, i64 %t1866, i64 %t1867)
  %t1869 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.338)
  %t1870 = call i64 @"sx_f64_add"(i64 %t1868, i64 %t1869)
  store i64 %t1870, ptr %local.sq.1694
  %t1871 = load i64, ptr %local.scale.1695
  %t1872 = load i64, ptr %local.gg0.1696
  %t1873 = load i64, ptr %local.gg1.1697
  %t1874 = load i64, ptr %local.gg2.1698
  %t1875 = load i64, ptr %local.gg3.1699
  %t1876 = load i64, ptr %local.gd0.1700
  %t1877 = load i64, ptr %local.gd1.1701
  %t1878 = load i64, ptr %local.gd2.1702
  %t1879 = load i64, ptr %local.gd3.1703
  %t1880 = call i64 @"dot4"(i64 %t1872, i64 %t1873, i64 %t1874, i64 %t1875, i64 %t1876, i64 %t1877, i64 %t1878, i64 %t1879)
  %t1881 = call i64 @"sx_f64_mul"(i64 %t1871, i64 %t1880)
  %t1882 = load i64, ptr %local.sq.1694
  %t1883 = call i64 @"sx_f64_div"(i64 %t1881, i64 %t1882)
  store i64 %t1883, ptr %local.proj.1693
  %t1884 = load i64, ptr %local.gg0.1696
  %t1885 = load i64, ptr %local.proj.1693
  %t1886 = load i64, ptr %local.gd0.1700
  %t1887 = call i64 @"sx_f64_mul"(i64 %t1885, i64 %t1886)
  %t1888 = call i64 @"sx_f64_sub"(i64 %t1884, i64 %t1887)
  store i64 %t1888, ptr %local.gg0.1696
  %t1889 = load i64, ptr %local.gg1.1697
  %t1890 = load i64, ptr %local.proj.1693
  %t1891 = load i64, ptr %local.gd1.1701
  %t1892 = call i64 @"sx_f64_mul"(i64 %t1890, i64 %t1891)
  %t1893 = call i64 @"sx_f64_sub"(i64 %t1889, i64 %t1892)
  store i64 %t1893, ptr %local.gg1.1697
  %t1894 = load i64, ptr %local.gg2.1698
  %t1895 = load i64, ptr %local.proj.1693
  %t1896 = load i64, ptr %local.gd2.1702
  %t1897 = call i64 @"sx_f64_mul"(i64 %t1895, i64 %t1896)
  %t1898 = call i64 @"sx_f64_sub"(i64 %t1894, i64 %t1897)
  store i64 %t1898, ptr %local.gg2.1698
  %t1899 = load i64, ptr %local.gg3.1699
  %t1900 = load i64, ptr %local.proj.1693
  %t1901 = load i64, ptr %local.gd3.1703
  %t1902 = call i64 @"sx_f64_mul"(i64 %t1900, i64 %t1901)
  %t1903 = call i64 @"sx_f64_sub"(i64 %t1899, i64 %t1902)
  store i64 %t1903, ptr %local.gg3.1699
  %t1904 = load i64, ptr %local.gg0.1696
  %t1905 = load i64, ptr %local.gg1.1697
  %t1906 = load i64, ptr %local.gg2.1698
  %t1907 = load i64, ptr %local.gg3.1699
  %t1908 = load i64, ptr %local.gg0.1696
  %t1909 = load i64, ptr %local.gg1.1697
  %t1910 = load i64, ptr %local.gg2.1698
  %t1911 = load i64, ptr %local.gg3.1699
  %t1912 = call i64 @"dot4"(i64 %t1904, i64 %t1905, i64 %t1906, i64 %t1907, i64 %t1908, i64 %t1909, i64 %t1910, i64 %t1911)
  %t1913 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.339)
  %t1914 = call i64 @"sx_f64_add"(i64 %t1912, i64 %t1913)
  store i64 %t1914, ptr %local.sq.1694
  %t1915 = load i64, ptr %local.scale.1695
  %t1916 = load i64, ptr %local.gd0.1700
  %t1917 = load i64, ptr %local.gd1.1701
  %t1918 = load i64, ptr %local.gd2.1702
  %t1919 = load i64, ptr %local.gd3.1703
  %t1920 = load i64, ptr %local.gg0.1696
  %t1921 = load i64, ptr %local.gg1.1697
  %t1922 = load i64, ptr %local.gg2.1698
  %t1923 = load i64, ptr %local.gg3.1699
  %t1924 = call i64 @"dot4"(i64 %t1916, i64 %t1917, i64 %t1918, i64 %t1919, i64 %t1920, i64 %t1921, i64 %t1922, i64 %t1923)
  %t1925 = call i64 @"sx_f64_mul"(i64 %t1915, i64 %t1924)
  %t1926 = load i64, ptr %local.sq.1694
  %t1927 = call i64 @"sx_f64_div"(i64 %t1925, i64 %t1926)
  store i64 %t1927, ptr %local.proj.1693
  %t1928 = load i64, ptr %local.gd0.1700
  %t1929 = load i64, ptr %local.proj.1693
  %t1930 = load i64, ptr %local.gg0.1696
  %t1931 = call i64 @"sx_f64_mul"(i64 %t1929, i64 %t1930)
  %t1932 = call i64 @"sx_f64_sub"(i64 %t1928, i64 %t1931)
  store i64 %t1932, ptr %local.gd0.1700
  %t1933 = load i64, ptr %local.gd1.1701
  %t1934 = load i64, ptr %local.proj.1693
  %t1935 = load i64, ptr %local.gg1.1697
  %t1936 = call i64 @"sx_f64_mul"(i64 %t1934, i64 %t1935)
  %t1937 = call i64 @"sx_f64_sub"(i64 %t1933, i64 %t1936)
  store i64 %t1937, ptr %local.gd1.1701
  %t1938 = load i64, ptr %local.gd2.1702
  %t1939 = load i64, ptr %local.proj.1693
  %t1940 = load i64, ptr %local.gg2.1698
  %t1941 = call i64 @"sx_f64_mul"(i64 %t1939, i64 %t1940)
  %t1942 = call i64 @"sx_f64_sub"(i64 %t1938, i64 %t1941)
  store i64 %t1942, ptr %local.gd2.1702
  %t1943 = load i64, ptr %local.gd3.1703
  %t1944 = load i64, ptr %local.proj.1693
  %t1945 = load i64, ptr %local.gg3.1699
  %t1946 = call i64 @"sx_f64_mul"(i64 %t1944, i64 %t1945)
  %t1947 = call i64 @"sx_f64_sub"(i64 %t1943, i64 %t1946)
  store i64 %t1947, ptr %local.gd3.1703
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1948 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t1949 = load i64, ptr %local.g0.1682
  %t1950 = load i64, ptr %local.lr.1690
  %t1951 = load i64, ptr %local.gg0.1696
  %t1952 = call i64 @"sx_f64_mul"(i64 %t1950, i64 %t1951)
  %t1953 = call i64 @"sx_f64_sub"(i64 %t1949, i64 %t1952)
  store i64 %t1953, ptr %local.g0.1682
  %t1954 = load i64, ptr %local.g1.1683
  %t1955 = load i64, ptr %local.lr.1690
  %t1956 = load i64, ptr %local.gg1.1697
  %t1957 = call i64 @"sx_f64_mul"(i64 %t1955, i64 %t1956)
  %t1958 = call i64 @"sx_f64_sub"(i64 %t1954, i64 %t1957)
  store i64 %t1958, ptr %local.g1.1683
  %t1959 = load i64, ptr %local.g2.1684
  %t1960 = load i64, ptr %local.lr.1690
  %t1961 = load i64, ptr %local.gg2.1698
  %t1962 = call i64 @"sx_f64_mul"(i64 %t1960, i64 %t1961)
  %t1963 = call i64 @"sx_f64_sub"(i64 %t1959, i64 %t1962)
  store i64 %t1963, ptr %local.g2.1684
  %t1964 = load i64, ptr %local.g3.1685
  %t1965 = load i64, ptr %local.lr.1690
  %t1966 = load i64, ptr %local.gg3.1699
  %t1967 = call i64 @"sx_f64_mul"(i64 %t1965, i64 %t1966)
  %t1968 = call i64 @"sx_f64_sub"(i64 %t1964, i64 %t1967)
  store i64 %t1968, ptr %local.g3.1685
  %t1969 = load i64, ptr %local.d0.1686
  %t1970 = load i64, ptr %local.lr.1690
  %t1971 = load i64, ptr %local.gd0.1700
  %t1972 = call i64 @"sx_f64_mul"(i64 %t1970, i64 %t1971)
  %t1973 = call i64 @"sx_f64_sub"(i64 %t1969, i64 %t1972)
  store i64 %t1973, ptr %local.d0.1686
  %t1974 = load i64, ptr %local.d1.1687
  %t1975 = load i64, ptr %local.lr.1690
  %t1976 = load i64, ptr %local.gd1.1701
  %t1977 = call i64 @"sx_f64_mul"(i64 %t1975, i64 %t1976)
  %t1978 = call i64 @"sx_f64_sub"(i64 %t1974, i64 %t1977)
  store i64 %t1978, ptr %local.d1.1687
  %t1979 = load i64, ptr %local.d2.1688
  %t1980 = load i64, ptr %local.lr.1690
  %t1981 = load i64, ptr %local.gd2.1702
  %t1982 = call i64 @"sx_f64_mul"(i64 %t1980, i64 %t1981)
  %t1983 = call i64 @"sx_f64_sub"(i64 %t1979, i64 %t1982)
  store i64 %t1983, ptr %local.d2.1688
  %t1984 = load i64, ptr %local.d3.1689
  %t1985 = load i64, ptr %local.lr.1690
  %t1986 = load i64, ptr %local.gd3.1703
  %t1987 = call i64 @"sx_f64_mul"(i64 %t1985, i64 %t1986)
  %t1988 = call i64 @"sx_f64_sub"(i64 %t1984, i64 %t1987)
  store i64 %t1988, ptr %local.d3.1689
  %t1989 = load i64, ptr %local.step.1691
  %t1990 = add i64 %t1989, 1
  store i64 %t1990, ptr %local.step.1691
  br label %loop27
endloop27:
  %t1991 = load i64, ptr %local.g0.1682
  %t1992 = load i64, ptr %local.g1.1683
  %t1993 = load i64, ptr %local.g2.1684
  %t1994 = load i64, ptr %local.g3.1685
  %t1995 = load i64, ptr %local.t0.1674
  %t1996 = load i64, ptr %local.t1.1675
  %t1997 = load i64, ptr %local.t2.1676
  %t1998 = load i64, ptr %local.t3.1677
  %t1999 = call i64 @"dist4"(i64 %t1991, i64 %t1992, i64 %t1993, i64 %t1994, i64 %t1995, i64 %t1996, i64 %t1997, i64 %t1998)
  ret i64 %t1999
}

define i64 @"test_skeptical_desire"() nounwind {
entry:
  %local.d_c0.2000 = alloca i64
  %local.d_c3.2001 = alloca i64
  %local.d_c5.2002 = alloca i64
  %local.d_c8.2003 = alloca i64
  %local.d_c10.2004 = alloca i64
  %local.best.2005 = alloca i64
  %local.best_c.2006 = alloca i64
  %t2007 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.340)
  %t2008 = ptrtoint ptr %t2007 to i64
  %t2009 = inttoptr i64 %t2008 to ptr
  call void @intrinsic_println(ptr %t2009)
  %t2010 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.341)
  %t2011 = ptrtoint ptr %t2010 to i64
  %t2012 = inttoptr i64 %t2011 to ptr
  call void @intrinsic_println(ptr %t2012)
  %t2013 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.342)
  %t2014 = ptrtoint ptr %t2013 to i64
  %t2015 = inttoptr i64 %t2014 to ptr
  call void @intrinsic_println(ptr %t2015)
  %t2016 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.343)
  %t2017 = ptrtoint ptr %t2016 to i64
  %t2018 = inttoptr i64 %t2017 to ptr
  call void @intrinsic_println(ptr %t2018)
  %t2019 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.344)
  %t2020 = ptrtoint ptr %t2019 to i64
  %t2021 = inttoptr i64 %t2020 to ptr
  call void @intrinsic_println(ptr %t2021)
  %t2022 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.345)
  %t2023 = ptrtoint ptr %t2022 to i64
  %t2024 = inttoptr i64 %t2023 to ptr
  call void @intrinsic_println(ptr %t2024)
  %t2025 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.346)
  %t2026 = call i64 @"train_skeptical_gan"(i64 %t2025, i64 1000)
  store i64 %t2026, ptr %local.d_c0.2000
  %t2027 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.347)
  %t2028 = call i64 @"train_skeptical_gan"(i64 %t2027, i64 1000)
  store i64 %t2028, ptr %local.d_c3.2001
  %t2029 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.348)
  %t2030 = call i64 @"train_skeptical_gan"(i64 %t2029, i64 1000)
  store i64 %t2030, ptr %local.d_c5.2002
  %t2031 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.349)
  %t2032 = call i64 @"train_skeptical_gan"(i64 %t2031, i64 1000)
  store i64 %t2032, ptr %local.d_c8.2003
  %t2033 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.350)
  %t2034 = call i64 @"train_skeptical_gan"(i64 %t2033, i64 1000)
  store i64 %t2034, ptr %local.d_c10.2004
  %t2035 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.351)
  %t2036 = ptrtoint ptr %t2035 to i64
  %t2037 = inttoptr i64 %t2036 to ptr
  call void @intrinsic_print(ptr %t2037)
  %t2038 = load i64, ptr %local.d_c0.2000
  %t2039 = call i64 @"print_f64"(i64 %t2038)
  %t2040 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.352)
  %t2041 = ptrtoint ptr %t2040 to i64
  %t2042 = inttoptr i64 %t2041 to ptr
  call void @intrinsic_println(ptr %t2042)
  %t2043 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.353)
  %t2044 = ptrtoint ptr %t2043 to i64
  %t2045 = inttoptr i64 %t2044 to ptr
  call void @intrinsic_print(ptr %t2045)
  %t2046 = load i64, ptr %local.d_c3.2001
  %t2047 = call i64 @"print_f64"(i64 %t2046)
  %t2048 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.354)
  %t2049 = ptrtoint ptr %t2048 to i64
  %t2050 = inttoptr i64 %t2049 to ptr
  call void @intrinsic_println(ptr %t2050)
  %t2051 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.355)
  %t2052 = ptrtoint ptr %t2051 to i64
  %t2053 = inttoptr i64 %t2052 to ptr
  call void @intrinsic_print(ptr %t2053)
  %t2054 = load i64, ptr %local.d_c5.2002
  %t2055 = call i64 @"print_f64"(i64 %t2054)
  %t2056 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.356)
  %t2057 = ptrtoint ptr %t2056 to i64
  %t2058 = inttoptr i64 %t2057 to ptr
  call void @intrinsic_println(ptr %t2058)
  %t2059 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.357)
  %t2060 = ptrtoint ptr %t2059 to i64
  %t2061 = inttoptr i64 %t2060 to ptr
  call void @intrinsic_print(ptr %t2061)
  %t2062 = load i64, ptr %local.d_c8.2003
  %t2063 = call i64 @"print_f64"(i64 %t2062)
  %t2064 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.358)
  %t2065 = ptrtoint ptr %t2064 to i64
  %t2066 = inttoptr i64 %t2065 to ptr
  call void @intrinsic_println(ptr %t2066)
  %t2067 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.359)
  %t2068 = ptrtoint ptr %t2067 to i64
  %t2069 = inttoptr i64 %t2068 to ptr
  call void @intrinsic_print(ptr %t2069)
  %t2070 = load i64, ptr %local.d_c10.2004
  %t2071 = call i64 @"print_f64"(i64 %t2070)
  %t2072 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.360)
  %t2073 = ptrtoint ptr %t2072 to i64
  %t2074 = inttoptr i64 %t2073 to ptr
  call void @intrinsic_println(ptr %t2074)
  %t2075 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.361)
  %t2076 = ptrtoint ptr %t2075 to i64
  %t2077 = inttoptr i64 %t2076 to ptr
  call void @intrinsic_println(ptr %t2077)
  %t2078 = load i64, ptr %local.d_c0.2000
  store i64 %t2078, ptr %local.best.2005
  %t2079 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.362)
  store i64 %t2079, ptr %local.best_c.2006
  %t2080 = load i64, ptr %local.d_c3.2001
  %t2081 = load i64, ptr %local.best.2005
  %t2082 = call i64 @"sx_f64_lt"(i64 %t2080, i64 %t2081)
  %t2083 = icmp ne i64 %t2082, 0
  br i1 %t2083, label %then29, label %else29
then29:
  %t2084 = load i64, ptr %local.d_c3.2001
  store i64 %t2084, ptr %local.best.2005
  %t2085 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.363)
  store i64 %t2085, ptr %local.best_c.2006
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t2086 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t2087 = load i64, ptr %local.d_c5.2002
  %t2088 = load i64, ptr %local.best.2005
  %t2089 = call i64 @"sx_f64_lt"(i64 %t2087, i64 %t2088)
  %t2090 = icmp ne i64 %t2089, 0
  br i1 %t2090, label %then30, label %else30
then30:
  %t2091 = load i64, ptr %local.d_c5.2002
  store i64 %t2091, ptr %local.best.2005
  %t2092 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.364)
  store i64 %t2092, ptr %local.best_c.2006
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t2093 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t2094 = load i64, ptr %local.d_c8.2003
  %t2095 = load i64, ptr %local.best.2005
  %t2096 = call i64 @"sx_f64_lt"(i64 %t2094, i64 %t2095)
  %t2097 = icmp ne i64 %t2096, 0
  br i1 %t2097, label %then31, label %else31
then31:
  %t2098 = load i64, ptr %local.d_c8.2003
  store i64 %t2098, ptr %local.best.2005
  %t2099 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.365)
  store i64 %t2099, ptr %local.best_c.2006
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t2100 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t2101 = load i64, ptr %local.d_c10.2004
  %t2102 = load i64, ptr %local.best.2005
  %t2103 = call i64 @"sx_f64_lt"(i64 %t2101, i64 %t2102)
  %t2104 = icmp ne i64 %t2103, 0
  br i1 %t2104, label %then32, label %else32
then32:
  %t2105 = load i64, ptr %local.d_c10.2004
  store i64 %t2105, ptr %local.best.2005
  %t2106 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.366)
  store i64 %t2106, ptr %local.best_c.2006
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t2107 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t2108 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.367)
  %t2109 = ptrtoint ptr %t2108 to i64
  %t2110 = inttoptr i64 %t2109 to ptr
  call void @intrinsic_print(ptr %t2110)
  %t2111 = load i64, ptr %local.best_c.2006
  %t2112 = call i64 @"print_f64"(i64 %t2111)
  %t2113 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.368)
  %t2114 = ptrtoint ptr %t2113 to i64
  %t2115 = inttoptr i64 %t2114 to ptr
  call void @intrinsic_print(ptr %t2115)
  %t2116 = load i64, ptr %local.best.2005
  %t2117 = call i64 @"print_f64"(i64 %t2116)
  %t2118 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.369)
  %t2119 = ptrtoint ptr %t2118 to i64
  %t2120 = inttoptr i64 %t2119 to ptr
  call void @intrinsic_println(ptr %t2120)
  %t2121 = load i64, ptr %local.best_c.2006
  %t2122 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.370)
  %t2123 = call i64 @"sx_f64_gt"(i64 %t2121, i64 %t2122)
  %t2124 = icmp ne i64 %t2123, 0
  br i1 %t2124, label %then33, label %else33
then33:
  %t2125 = load i64, ptr %local.best.2005
  %t2126 = load i64, ptr %local.d_c0.2000
  %t2127 = call i64 @"sx_f64_lt"(i64 %t2125, i64 %t2126)
  %t2128 = icmp ne i64 %t2127, 0
  br i1 %t2128, label %then34, label %else34
then34:
  %t2129 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.371)
  %t2130 = ptrtoint ptr %t2129 to i64
  %t2131 = inttoptr i64 %t2130 to ptr
  call void @intrinsic_println(ptr %t2131)
  %t2132 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.372)
  %t2133 = ptrtoint ptr %t2132 to i64
  %t2134 = inttoptr i64 %t2133 to ptr
  call void @intrinsic_println(ptr %t2134)
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t2135 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  br label %then33_end
then33_end:
  br label %endif33
else33:
  %t2136 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.373)
  %t2137 = ptrtoint ptr %t2136 to i64
  %t2138 = inttoptr i64 %t2137 to ptr
  call void @intrinsic_println(ptr %t2138)
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t2139 = phi i64 [ %t2135, %then33_end ], [ 0, %else33_end ]
  %t2140 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.374)
  %t2141 = ptrtoint ptr %t2140 to i64
  %t2142 = inttoptr i64 %t2141 to ptr
  call void @intrinsic_println(ptr %t2142)
  ret i64 0
}

define i64 @"run_conv_score"(i64 %use_proj) nounwind {
entry:
  %local.t0.2143 = alloca i64
  %local.t1.2144 = alloca i64
  %local.t2.2145 = alloca i64
  %local.t3.2146 = alloca i64
  %local.g0.2147 = alloca i64
  %local.g1.2148 = alloca i64
  %local.g2.2149 = alloca i64
  %local.g3.2150 = alloca i64
  %local.d0.2151 = alloca i64
  %local.d1.2152 = alloca i64
  %local.d2.2153 = alloca i64
  %local.d3.2154 = alloca i64
  %local.lr.2155 = alloca i64
  %local.step.2156 = alloca i64
  %local.cosine.2157 = alloca i64
  %local.proj.2158 = alloca i64
  %local.sq.2159 = alloca i64
  %local.scale.2160 = alloca i64
  %local.gg0.2161 = alloca i64
  %local.gg1.2162 = alloca i64
  %local.gg2.2163 = alloca i64
  %local.gg3.2164 = alloca i64
  %local.gd0.2165 = alloca i64
  %local.gd1.2166 = alloca i64
  %local.gd2.2167 = alloca i64
  %local.gd3.2168 = alloca i64
  %local.dist_prev2.2169 = alloca i64
  %local.dist_prev1.2170 = alloca i64
  %local.dist_cur.2171 = alloca i64
  %local.d_prime.2172 = alloca i64
  %local.d_prime_prev.2173 = alloca i64
  %local.d_dprime.2174 = alloca i64
  %local.score.2175 = alloca i64
  %local.converge_step.2176 = alloca i64
  %local.use_proj = alloca i64
  store i64 %use_proj, ptr %local.use_proj
  %t2177 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.375)
  store i64 %t2177, ptr %local.t0.2143
  %t2178 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.376)
  %t2179 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.377)
  %t2180 = call i64 @"sx_f64_sub"(i64 %t2178, i64 %t2179)
  store i64 %t2180, ptr %local.t1.2144
  %t2181 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.378)
  store i64 %t2181, ptr %local.t2.2145
  %t2182 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.379)
  store i64 %t2182, ptr %local.t3.2146
  %t2183 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.380)
  store i64 %t2183, ptr %local.g0.2147
  %t2184 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.381)
  store i64 %t2184, ptr %local.g1.2148
  %t2185 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.382)
  store i64 %t2185, ptr %local.g2.2149
  %t2186 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.383)
  store i64 %t2186, ptr %local.g3.2150
  %t2187 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.384)
  store i64 %t2187, ptr %local.d0.2151
  %t2188 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.385)
  store i64 %t2188, ptr %local.d1.2152
  %t2189 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.386)
  store i64 %t2189, ptr %local.d2.2153
  %t2190 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.387)
  store i64 %t2190, ptr %local.d3.2154
  %t2191 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.388)
  store i64 %t2191, ptr %local.lr.2155
  store i64 0, ptr %local.step.2156
  %t2192 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.389)
  store i64 %t2192, ptr %local.cosine.2157
  %t2193 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.390)
  store i64 %t2193, ptr %local.proj.2158
  %t2194 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.391)
  store i64 %t2194, ptr %local.sq.2159
  %t2195 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.392)
  store i64 %t2195, ptr %local.scale.2160
  %t2196 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.393)
  store i64 %t2196, ptr %local.gg0.2161
  %t2197 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.394)
  store i64 %t2197, ptr %local.gg1.2162
  %t2198 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.395)
  store i64 %t2198, ptr %local.gg2.2163
  %t2199 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.396)
  store i64 %t2199, ptr %local.gg3.2164
  %t2200 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.397)
  store i64 %t2200, ptr %local.gd0.2165
  %t2201 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.398)
  store i64 %t2201, ptr %local.gd1.2166
  %t2202 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.399)
  store i64 %t2202, ptr %local.gd2.2167
  %t2203 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.400)
  store i64 %t2203, ptr %local.gd3.2168
  %t2204 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.401)
  store i64 %t2204, ptr %local.dist_prev2.2169
  %t2205 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.402)
  store i64 %t2205, ptr %local.dist_prev1.2170
  %t2206 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.403)
  store i64 %t2206, ptr %local.dist_cur.2171
  %t2207 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.404)
  store i64 %t2207, ptr %local.d_prime.2172
  %t2208 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.405)
  store i64 %t2208, ptr %local.d_prime_prev.2173
  %t2209 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.406)
  store i64 %t2209, ptr %local.d_dprime.2174
  %t2210 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.407)
  store i64 %t2210, ptr %local.score.2175
  store i64 -1, ptr %local.converge_step.2176
  %t2211 = load i64, ptr %local.g0.2147
  %t2212 = load i64, ptr %local.g1.2148
  %t2213 = load i64, ptr %local.g2.2149
  %t2214 = load i64, ptr %local.g3.2150
  %t2215 = load i64, ptr %local.t0.2143
  %t2216 = load i64, ptr %local.t1.2144
  %t2217 = load i64, ptr %local.t2.2145
  %t2218 = load i64, ptr %local.t3.2146
  %t2219 = call i64 @"dist4"(i64 %t2211, i64 %t2212, i64 %t2213, i64 %t2214, i64 %t2215, i64 %t2216, i64 %t2217, i64 %t2218)
  store i64 %t2219, ptr %local.dist_prev2.2169
  %t2220 = load i64, ptr %local.dist_prev2.2169
  store i64 %t2220, ptr %local.dist_prev1.2170
  br label %loop35
loop35:
  %t2221 = load i64, ptr %local.step.2156
  %t2222 = icmp slt i64 %t2221, 1000
  %t2223 = zext i1 %t2222 to i64
  %t2224 = icmp ne i64 %t2223, 0
  br i1 %t2224, label %body35, label %endloop35
body35:
  %t2225 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.408)
  %t2226 = load i64, ptr %local.g0.2147
  %t2227 = load i64, ptr %local.d0.2151
  %t2228 = call i64 @"sx_f64_sub"(i64 %t2226, i64 %t2227)
  %t2229 = call i64 @"sx_f64_mul"(i64 %t2225, i64 %t2228)
  store i64 %t2229, ptr %local.gg0.2161
  %t2230 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.409)
  %t2231 = load i64, ptr %local.g1.2148
  %t2232 = load i64, ptr %local.d1.2152
  %t2233 = call i64 @"sx_f64_sub"(i64 %t2231, i64 %t2232)
  %t2234 = call i64 @"sx_f64_mul"(i64 %t2230, i64 %t2233)
  store i64 %t2234, ptr %local.gg1.2162
  %t2235 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.410)
  %t2236 = load i64, ptr %local.g2.2149
  %t2237 = load i64, ptr %local.d2.2153
  %t2238 = call i64 @"sx_f64_sub"(i64 %t2236, i64 %t2237)
  %t2239 = call i64 @"sx_f64_mul"(i64 %t2235, i64 %t2238)
  store i64 %t2239, ptr %local.gg2.2163
  %t2240 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.411)
  %t2241 = load i64, ptr %local.g3.2150
  %t2242 = load i64, ptr %local.d3.2154
  %t2243 = call i64 @"sx_f64_sub"(i64 %t2241, i64 %t2242)
  %t2244 = call i64 @"sx_f64_mul"(i64 %t2240, i64 %t2243)
  store i64 %t2244, ptr %local.gg3.2164
  %t2245 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.412)
  %t2246 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.413)
  %t2247 = load i64, ptr %local.d0.2151
  %t2248 = load i64, ptr %local.t0.2143
  %t2249 = call i64 @"sx_f64_sub"(i64 %t2247, i64 %t2248)
  %t2250 = call i64 @"sx_f64_mul"(i64 %t2246, i64 %t2249)
  %t2251 = call i64 @"sx_f64_sub"(i64 %t2245, i64 %t2250)
  %t2252 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.414)
  %t2253 = load i64, ptr %local.d0.2151
  %t2254 = load i64, ptr %local.g0.2147
  %t2255 = call i64 @"sx_f64_sub"(i64 %t2253, i64 %t2254)
  %t2256 = call i64 @"sx_f64_mul"(i64 %t2252, i64 %t2255)
  %t2257 = call i64 @"sx_f64_add"(i64 %t2251, i64 %t2256)
  store i64 %t2257, ptr %local.gd0.2165
  %t2258 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.415)
  %t2259 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.416)
  %t2260 = load i64, ptr %local.d1.2152
  %t2261 = load i64, ptr %local.t1.2144
  %t2262 = call i64 @"sx_f64_sub"(i64 %t2260, i64 %t2261)
  %t2263 = call i64 @"sx_f64_mul"(i64 %t2259, i64 %t2262)
  %t2264 = call i64 @"sx_f64_sub"(i64 %t2258, i64 %t2263)
  %t2265 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.417)
  %t2266 = load i64, ptr %local.d1.2152
  %t2267 = load i64, ptr %local.g1.2148
  %t2268 = call i64 @"sx_f64_sub"(i64 %t2266, i64 %t2267)
  %t2269 = call i64 @"sx_f64_mul"(i64 %t2265, i64 %t2268)
  %t2270 = call i64 @"sx_f64_add"(i64 %t2264, i64 %t2269)
  store i64 %t2270, ptr %local.gd1.2166
  %t2271 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.418)
  %t2272 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.419)
  %t2273 = load i64, ptr %local.d2.2153
  %t2274 = load i64, ptr %local.t2.2145
  %t2275 = call i64 @"sx_f64_sub"(i64 %t2273, i64 %t2274)
  %t2276 = call i64 @"sx_f64_mul"(i64 %t2272, i64 %t2275)
  %t2277 = call i64 @"sx_f64_sub"(i64 %t2271, i64 %t2276)
  %t2278 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.420)
  %t2279 = load i64, ptr %local.d2.2153
  %t2280 = load i64, ptr %local.g2.2149
  %t2281 = call i64 @"sx_f64_sub"(i64 %t2279, i64 %t2280)
  %t2282 = call i64 @"sx_f64_mul"(i64 %t2278, i64 %t2281)
  %t2283 = call i64 @"sx_f64_add"(i64 %t2277, i64 %t2282)
  store i64 %t2283, ptr %local.gd2.2167
  %t2284 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.421)
  %t2285 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.422)
  %t2286 = load i64, ptr %local.d3.2154
  %t2287 = load i64, ptr %local.t3.2146
  %t2288 = call i64 @"sx_f64_sub"(i64 %t2286, i64 %t2287)
  %t2289 = call i64 @"sx_f64_mul"(i64 %t2285, i64 %t2288)
  %t2290 = call i64 @"sx_f64_sub"(i64 %t2284, i64 %t2289)
  %t2291 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.423)
  %t2292 = load i64, ptr %local.d3.2154
  %t2293 = load i64, ptr %local.g3.2150
  %t2294 = call i64 @"sx_f64_sub"(i64 %t2292, i64 %t2293)
  %t2295 = call i64 @"sx_f64_mul"(i64 %t2291, i64 %t2294)
  %t2296 = call i64 @"sx_f64_add"(i64 %t2290, i64 %t2295)
  store i64 %t2296, ptr %local.gd3.2168
  %t2297 = load i64, ptr %local.use_proj
  %t2298 = icmp eq i64 %t2297, 1
  %t2299 = zext i1 %t2298 to i64
  %t2300 = icmp ne i64 %t2299, 0
  br i1 %t2300, label %then36, label %else36
then36:
  %t2301 = load i64, ptr %local.gg0.2161
  %t2302 = load i64, ptr %local.gg1.2162
  %t2303 = load i64, ptr %local.gg2.2163
  %t2304 = load i64, ptr %local.gg3.2164
  %t2305 = load i64, ptr %local.gd0.2165
  %t2306 = load i64, ptr %local.gd1.2166
  %t2307 = load i64, ptr %local.gd2.2167
  %t2308 = load i64, ptr %local.gd3.2168
  %t2309 = call i64 @"cosine4"(i64 %t2301, i64 %t2302, i64 %t2303, i64 %t2304, i64 %t2305, i64 %t2306, i64 %t2307, i64 %t2308)
  store i64 %t2309, ptr %local.cosine.2157
  %t2310 = load i64, ptr %local.cosine.2157
  %t2311 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.424)
  %t2312 = call i64 @"sx_f64_lt"(i64 %t2310, i64 %t2311)
  %t2313 = icmp ne i64 %t2312, 0
  br i1 %t2313, label %then37, label %else37
then37:
  %t2314 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.425)
  %t2315 = load i64, ptr %local.cosine.2157
  %t2316 = call i64 @"sx_f64_sub"(i64 %t2314, i64 %t2315)
  store i64 %t2316, ptr %local.scale.2160
  %t2317 = load i64, ptr %local.gd0.2165
  %t2318 = load i64, ptr %local.gd1.2166
  %t2319 = load i64, ptr %local.gd2.2167
  %t2320 = load i64, ptr %local.gd3.2168
  %t2321 = load i64, ptr %local.gd0.2165
  %t2322 = load i64, ptr %local.gd1.2166
  %t2323 = load i64, ptr %local.gd2.2167
  %t2324 = load i64, ptr %local.gd3.2168
  %t2325 = call i64 @"dot4"(i64 %t2317, i64 %t2318, i64 %t2319, i64 %t2320, i64 %t2321, i64 %t2322, i64 %t2323, i64 %t2324)
  %t2326 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.426)
  %t2327 = call i64 @"sx_f64_add"(i64 %t2325, i64 %t2326)
  store i64 %t2327, ptr %local.sq.2159
  %t2328 = load i64, ptr %local.scale.2160
  %t2329 = load i64, ptr %local.gg0.2161
  %t2330 = load i64, ptr %local.gg1.2162
  %t2331 = load i64, ptr %local.gg2.2163
  %t2332 = load i64, ptr %local.gg3.2164
  %t2333 = load i64, ptr %local.gd0.2165
  %t2334 = load i64, ptr %local.gd1.2166
  %t2335 = load i64, ptr %local.gd2.2167
  %t2336 = load i64, ptr %local.gd3.2168
  %t2337 = call i64 @"dot4"(i64 %t2329, i64 %t2330, i64 %t2331, i64 %t2332, i64 %t2333, i64 %t2334, i64 %t2335, i64 %t2336)
  %t2338 = call i64 @"sx_f64_mul"(i64 %t2328, i64 %t2337)
  %t2339 = load i64, ptr %local.sq.2159
  %t2340 = call i64 @"sx_f64_div"(i64 %t2338, i64 %t2339)
  store i64 %t2340, ptr %local.proj.2158
  %t2341 = load i64, ptr %local.gg0.2161
  %t2342 = load i64, ptr %local.proj.2158
  %t2343 = load i64, ptr %local.gd0.2165
  %t2344 = call i64 @"sx_f64_mul"(i64 %t2342, i64 %t2343)
  %t2345 = call i64 @"sx_f64_sub"(i64 %t2341, i64 %t2344)
  store i64 %t2345, ptr %local.gg0.2161
  %t2346 = load i64, ptr %local.gg1.2162
  %t2347 = load i64, ptr %local.proj.2158
  %t2348 = load i64, ptr %local.gd1.2166
  %t2349 = call i64 @"sx_f64_mul"(i64 %t2347, i64 %t2348)
  %t2350 = call i64 @"sx_f64_sub"(i64 %t2346, i64 %t2349)
  store i64 %t2350, ptr %local.gg1.2162
  %t2351 = load i64, ptr %local.gg2.2163
  %t2352 = load i64, ptr %local.proj.2158
  %t2353 = load i64, ptr %local.gd2.2167
  %t2354 = call i64 @"sx_f64_mul"(i64 %t2352, i64 %t2353)
  %t2355 = call i64 @"sx_f64_sub"(i64 %t2351, i64 %t2354)
  store i64 %t2355, ptr %local.gg2.2163
  %t2356 = load i64, ptr %local.gg3.2164
  %t2357 = load i64, ptr %local.proj.2158
  %t2358 = load i64, ptr %local.gd3.2168
  %t2359 = call i64 @"sx_f64_mul"(i64 %t2357, i64 %t2358)
  %t2360 = call i64 @"sx_f64_sub"(i64 %t2356, i64 %t2359)
  store i64 %t2360, ptr %local.gg3.2164
  %t2361 = load i64, ptr %local.gg0.2161
  %t2362 = load i64, ptr %local.gg1.2162
  %t2363 = load i64, ptr %local.gg2.2163
  %t2364 = load i64, ptr %local.gg3.2164
  %t2365 = load i64, ptr %local.gg0.2161
  %t2366 = load i64, ptr %local.gg1.2162
  %t2367 = load i64, ptr %local.gg2.2163
  %t2368 = load i64, ptr %local.gg3.2164
  %t2369 = call i64 @"dot4"(i64 %t2361, i64 %t2362, i64 %t2363, i64 %t2364, i64 %t2365, i64 %t2366, i64 %t2367, i64 %t2368)
  %t2370 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.427)
  %t2371 = call i64 @"sx_f64_add"(i64 %t2369, i64 %t2370)
  store i64 %t2371, ptr %local.sq.2159
  %t2372 = load i64, ptr %local.scale.2160
  %t2373 = load i64, ptr %local.gd0.2165
  %t2374 = load i64, ptr %local.gd1.2166
  %t2375 = load i64, ptr %local.gd2.2167
  %t2376 = load i64, ptr %local.gd3.2168
  %t2377 = load i64, ptr %local.gg0.2161
  %t2378 = load i64, ptr %local.gg1.2162
  %t2379 = load i64, ptr %local.gg2.2163
  %t2380 = load i64, ptr %local.gg3.2164
  %t2381 = call i64 @"dot4"(i64 %t2373, i64 %t2374, i64 %t2375, i64 %t2376, i64 %t2377, i64 %t2378, i64 %t2379, i64 %t2380)
  %t2382 = call i64 @"sx_f64_mul"(i64 %t2372, i64 %t2381)
  %t2383 = load i64, ptr %local.sq.2159
  %t2384 = call i64 @"sx_f64_div"(i64 %t2382, i64 %t2383)
  store i64 %t2384, ptr %local.proj.2158
  %t2385 = load i64, ptr %local.gd0.2165
  %t2386 = load i64, ptr %local.proj.2158
  %t2387 = load i64, ptr %local.gg0.2161
  %t2388 = call i64 @"sx_f64_mul"(i64 %t2386, i64 %t2387)
  %t2389 = call i64 @"sx_f64_sub"(i64 %t2385, i64 %t2388)
  store i64 %t2389, ptr %local.gd0.2165
  %t2390 = load i64, ptr %local.gd1.2166
  %t2391 = load i64, ptr %local.proj.2158
  %t2392 = load i64, ptr %local.gg1.2162
  %t2393 = call i64 @"sx_f64_mul"(i64 %t2391, i64 %t2392)
  %t2394 = call i64 @"sx_f64_sub"(i64 %t2390, i64 %t2393)
  store i64 %t2394, ptr %local.gd1.2166
  %t2395 = load i64, ptr %local.gd2.2167
  %t2396 = load i64, ptr %local.proj.2158
  %t2397 = load i64, ptr %local.gg2.2163
  %t2398 = call i64 @"sx_f64_mul"(i64 %t2396, i64 %t2397)
  %t2399 = call i64 @"sx_f64_sub"(i64 %t2395, i64 %t2398)
  store i64 %t2399, ptr %local.gd2.2167
  %t2400 = load i64, ptr %local.gd3.2168
  %t2401 = load i64, ptr %local.proj.2158
  %t2402 = load i64, ptr %local.gg3.2164
  %t2403 = call i64 @"sx_f64_mul"(i64 %t2401, i64 %t2402)
  %t2404 = call i64 @"sx_f64_sub"(i64 %t2400, i64 %t2403)
  store i64 %t2404, ptr %local.gd3.2168
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t2405 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t2406 = phi i64 [ %t2405, %then36_end ], [ 0, %else36_end ]
  %t2407 = load i64, ptr %local.g0.2147
  %t2408 = load i64, ptr %local.lr.2155
  %t2409 = load i64, ptr %local.gg0.2161
  %t2410 = call i64 @"sx_f64_mul"(i64 %t2408, i64 %t2409)
  %t2411 = call i64 @"sx_f64_sub"(i64 %t2407, i64 %t2410)
  store i64 %t2411, ptr %local.g0.2147
  %t2412 = load i64, ptr %local.g1.2148
  %t2413 = load i64, ptr %local.lr.2155
  %t2414 = load i64, ptr %local.gg1.2162
  %t2415 = call i64 @"sx_f64_mul"(i64 %t2413, i64 %t2414)
  %t2416 = call i64 @"sx_f64_sub"(i64 %t2412, i64 %t2415)
  store i64 %t2416, ptr %local.g1.2148
  %t2417 = load i64, ptr %local.g2.2149
  %t2418 = load i64, ptr %local.lr.2155
  %t2419 = load i64, ptr %local.gg2.2163
  %t2420 = call i64 @"sx_f64_mul"(i64 %t2418, i64 %t2419)
  %t2421 = call i64 @"sx_f64_sub"(i64 %t2417, i64 %t2420)
  store i64 %t2421, ptr %local.g2.2149
  %t2422 = load i64, ptr %local.g3.2150
  %t2423 = load i64, ptr %local.lr.2155
  %t2424 = load i64, ptr %local.gg3.2164
  %t2425 = call i64 @"sx_f64_mul"(i64 %t2423, i64 %t2424)
  %t2426 = call i64 @"sx_f64_sub"(i64 %t2422, i64 %t2425)
  store i64 %t2426, ptr %local.g3.2150
  %t2427 = load i64, ptr %local.d0.2151
  %t2428 = load i64, ptr %local.lr.2155
  %t2429 = load i64, ptr %local.gd0.2165
  %t2430 = call i64 @"sx_f64_mul"(i64 %t2428, i64 %t2429)
  %t2431 = call i64 @"sx_f64_sub"(i64 %t2427, i64 %t2430)
  store i64 %t2431, ptr %local.d0.2151
  %t2432 = load i64, ptr %local.d1.2152
  %t2433 = load i64, ptr %local.lr.2155
  %t2434 = load i64, ptr %local.gd1.2166
  %t2435 = call i64 @"sx_f64_mul"(i64 %t2433, i64 %t2434)
  %t2436 = call i64 @"sx_f64_sub"(i64 %t2432, i64 %t2435)
  store i64 %t2436, ptr %local.d1.2152
  %t2437 = load i64, ptr %local.d2.2153
  %t2438 = load i64, ptr %local.lr.2155
  %t2439 = load i64, ptr %local.gd2.2167
  %t2440 = call i64 @"sx_f64_mul"(i64 %t2438, i64 %t2439)
  %t2441 = call i64 @"sx_f64_sub"(i64 %t2437, i64 %t2440)
  store i64 %t2441, ptr %local.d2.2153
  %t2442 = load i64, ptr %local.d3.2154
  %t2443 = load i64, ptr %local.lr.2155
  %t2444 = load i64, ptr %local.gd3.2168
  %t2445 = call i64 @"sx_f64_mul"(i64 %t2443, i64 %t2444)
  %t2446 = call i64 @"sx_f64_sub"(i64 %t2442, i64 %t2445)
  store i64 %t2446, ptr %local.d3.2154
  %t2447 = load i64, ptr %local.g0.2147
  %t2448 = load i64, ptr %local.g1.2148
  %t2449 = load i64, ptr %local.g2.2149
  %t2450 = load i64, ptr %local.g3.2150
  %t2451 = load i64, ptr %local.t0.2143
  %t2452 = load i64, ptr %local.t1.2144
  %t2453 = load i64, ptr %local.t2.2145
  %t2454 = load i64, ptr %local.t3.2146
  %t2455 = call i64 @"dist4"(i64 %t2447, i64 %t2448, i64 %t2449, i64 %t2450, i64 %t2451, i64 %t2452, i64 %t2453, i64 %t2454)
  store i64 %t2455, ptr %local.dist_cur.2171
  %t2456 = load i64, ptr %local.dist_cur.2171
  %t2457 = load i64, ptr %local.dist_prev1.2170
  %t2458 = call i64 @"sx_f64_sub"(i64 %t2456, i64 %t2457)
  store i64 %t2458, ptr %local.d_prime.2172
  %t2459 = load i64, ptr %local.d_prime.2172
  %t2460 = load i64, ptr %local.d_prime_prev.2173
  %t2461 = call i64 @"sx_f64_sub"(i64 %t2459, i64 %t2460)
  store i64 %t2461, ptr %local.d_dprime.2174
  %t2462 = load i64, ptr %local.d_prime.2172
  store i64 %t2462, ptr %local.d_prime_prev.2173
  %t2463 = load i64, ptr %local.dist_cur.2171
  %t2464 = load i64, ptr %local.d_prime.2172
  %t2465 = call i64 @"abs_f64"(i64 %t2464)
  %t2466 = call i64 @"sx_f64_add"(i64 %t2463, i64 %t2465)
  %t2467 = load i64, ptr %local.d_dprime.2174
  %t2468 = call i64 @"abs_f64"(i64 %t2467)
  %t2469 = call i64 @"sx_f64_add"(i64 %t2466, i64 %t2468)
  store i64 %t2469, ptr %local.score.2175
  %t2470 = load i64, ptr %local.step.2156
  %t2471 = icmp eq i64 %t2470, 10
  %t2472 = zext i1 %t2471 to i64
  %t2473 = icmp ne i64 %t2472, 0
  br i1 %t2473, label %then38, label %else38
then38:
  %t2474 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.428)
  %t2475 = ptrtoint ptr %t2474 to i64
  %t2476 = inttoptr i64 %t2475 to ptr
  call void @intrinsic_print(ptr %t2476)
  %t2477 = load i64, ptr %local.score.2175
  %t2478 = call i64 @"print_f64"(i64 %t2477)
  %t2479 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.429)
  %t2480 = ptrtoint ptr %t2479 to i64
  %t2481 = inttoptr i64 %t2480 to ptr
  call void @intrinsic_print(ptr %t2481)
  %t2482 = load i64, ptr %local.dist_cur.2171
  %t2483 = call i64 @"print_f64"(i64 %t2482)
  %t2484 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.430)
  %t2485 = ptrtoint ptr %t2484 to i64
  %t2486 = inttoptr i64 %t2485 to ptr
  call void @intrinsic_println(ptr %t2486)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t2487 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t2488 = load i64, ptr %local.step.2156
  %t2489 = icmp eq i64 %t2488, 100
  %t2490 = zext i1 %t2489 to i64
  %t2491 = icmp ne i64 %t2490, 0
  br i1 %t2491, label %then39, label %else39
then39:
  %t2492 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.431)
  %t2493 = ptrtoint ptr %t2492 to i64
  %t2494 = inttoptr i64 %t2493 to ptr
  call void @intrinsic_print(ptr %t2494)
  %t2495 = load i64, ptr %local.score.2175
  %t2496 = call i64 @"print_f64"(i64 %t2495)
  %t2497 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.432)
  %t2498 = ptrtoint ptr %t2497 to i64
  %t2499 = inttoptr i64 %t2498 to ptr
  call void @intrinsic_print(ptr %t2499)
  %t2500 = load i64, ptr %local.dist_cur.2171
  %t2501 = call i64 @"print_f64"(i64 %t2500)
  %t2502 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.433)
  %t2503 = ptrtoint ptr %t2502 to i64
  %t2504 = inttoptr i64 %t2503 to ptr
  call void @intrinsic_println(ptr %t2504)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t2505 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t2506 = load i64, ptr %local.step.2156
  %t2507 = icmp eq i64 %t2506, 500
  %t2508 = zext i1 %t2507 to i64
  %t2509 = icmp ne i64 %t2508, 0
  br i1 %t2509, label %then40, label %else40
then40:
  %t2510 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.434)
  %t2511 = ptrtoint ptr %t2510 to i64
  %t2512 = inttoptr i64 %t2511 to ptr
  call void @intrinsic_print(ptr %t2512)
  %t2513 = load i64, ptr %local.score.2175
  %t2514 = call i64 @"print_f64"(i64 %t2513)
  %t2515 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.435)
  %t2516 = ptrtoint ptr %t2515 to i64
  %t2517 = inttoptr i64 %t2516 to ptr
  call void @intrinsic_print(ptr %t2517)
  %t2518 = load i64, ptr %local.dist_cur.2171
  %t2519 = call i64 @"print_f64"(i64 %t2518)
  %t2520 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.436)
  %t2521 = ptrtoint ptr %t2520 to i64
  %t2522 = inttoptr i64 %t2521 to ptr
  call void @intrinsic_println(ptr %t2522)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t2523 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t2524 = load i64, ptr %local.step.2156
  %t2525 = icmp eq i64 %t2524, 999
  %t2526 = zext i1 %t2525 to i64
  %t2527 = icmp ne i64 %t2526, 0
  br i1 %t2527, label %then41, label %else41
then41:
  %t2528 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.437)
  %t2529 = ptrtoint ptr %t2528 to i64
  %t2530 = inttoptr i64 %t2529 to ptr
  call void @intrinsic_print(ptr %t2530)
  %t2531 = load i64, ptr %local.score.2175
  %t2532 = call i64 @"print_f64"(i64 %t2531)
  %t2533 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.438)
  %t2534 = ptrtoint ptr %t2533 to i64
  %t2535 = inttoptr i64 %t2534 to ptr
  call void @intrinsic_print(ptr %t2535)
  %t2536 = load i64, ptr %local.dist_cur.2171
  %t2537 = call i64 @"print_f64"(i64 %t2536)
  %t2538 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.439)
  %t2539 = ptrtoint ptr %t2538 to i64
  %t2540 = inttoptr i64 %t2539 to ptr
  call void @intrinsic_println(ptr %t2540)
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t2541 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t2542 = load i64, ptr %local.step.2156
  %t2543 = icmp sgt i64 %t2542, 10
  %t2544 = zext i1 %t2543 to i64
  %t2545 = icmp ne i64 %t2544, 0
  br i1 %t2545, label %then42, label %else42
then42:
  %t2546 = load i64, ptr %local.converge_step.2176
  %t2547 = icmp slt i64 %t2546, 0
  %t2548 = zext i1 %t2547 to i64
  %t2549 = icmp ne i64 %t2548, 0
  br i1 %t2549, label %then43, label %else43
then43:
  %t2550 = load i64, ptr %local.score.2175
  %t2551 = call i64 @f64_parse(ptr @.str.exp_gan_convergence.440)
  %t2552 = call i64 @"sx_f64_lt"(i64 %t2550, i64 %t2551)
  %t2553 = icmp ne i64 %t2552, 0
  br i1 %t2553, label %then44, label %else44
then44:
  %t2554 = load i64, ptr %local.step.2156
  store i64 %t2554, ptr %local.converge_step.2176
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t2555 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t2556 = phi i64 [ %t2555, %then43_end ], [ 0, %else43_end ]
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t2557 = phi i64 [ %t2556, %then42_end ], [ 0, %else42_end ]
  %t2558 = load i64, ptr %local.dist_prev1.2170
  store i64 %t2558, ptr %local.dist_prev2.2169
  %t2559 = load i64, ptr %local.dist_cur.2171
  store i64 %t2559, ptr %local.dist_prev1.2170
  %t2560 = load i64, ptr %local.step.2156
  %t2561 = add i64 %t2560, 1
  store i64 %t2561, ptr %local.step.2156
  br label %loop35
endloop35:
  %t2562 = load i64, ptr %local.converge_step.2176
  ret i64 %t2562
}

define i64 @"test_convergence_score"() nounwind {
entry:
  %local.conv_std.2563 = alloca i64
  %local.conv_proj.2564 = alloca i64
  %t2565 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.441)
  %t2566 = ptrtoint ptr %t2565 to i64
  %t2567 = inttoptr i64 %t2566 to ptr
  call void @intrinsic_println(ptr %t2567)
  %t2568 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.442)
  %t2569 = ptrtoint ptr %t2568 to i64
  %t2570 = inttoptr i64 %t2569 to ptr
  call void @intrinsic_println(ptr %t2570)
  %t2571 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.443)
  %t2572 = ptrtoint ptr %t2571 to i64
  %t2573 = inttoptr i64 %t2572 to ptr
  call void @intrinsic_println(ptr %t2573)
  %t2574 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.444)
  %t2575 = ptrtoint ptr %t2574 to i64
  %t2576 = inttoptr i64 %t2575 to ptr
  call void @intrinsic_println(ptr %t2576)
  %t2577 = call i64 @"run_conv_score"(i64 0)
  store i64 %t2577, ptr %local.conv_std.2563
  %t2578 = load i64, ptr %local.conv_std.2563
  %t2579 = icmp slt i64 %t2578, 0
  %t2580 = zext i1 %t2579 to i64
  %t2581 = icmp ne i64 %t2580, 0
  br i1 %t2581, label %then45, label %else45
then45:
  %t2582 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.445)
  %t2583 = ptrtoint ptr %t2582 to i64
  %t2584 = inttoptr i64 %t2583 to ptr
  call void @intrinsic_println(ptr %t2584)
  br label %then45_end
then45_end:
  br label %endif45
else45:
  %t2585 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.446)
  %t2586 = ptrtoint ptr %t2585 to i64
  %t2587 = inttoptr i64 %t2586 to ptr
  call void @intrinsic_print(ptr %t2587)
  %t2588 = load i64, ptr %local.conv_std.2563
  call void @print_i64(i64 %t2588)
  %t2589 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.447)
  %t2590 = ptrtoint ptr %t2589 to i64
  %t2591 = inttoptr i64 %t2590 to ptr
  call void @intrinsic_println(ptr %t2591)
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t2592 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t2593 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.448)
  %t2594 = ptrtoint ptr %t2593 to i64
  %t2595 = inttoptr i64 %t2594 to ptr
  call void @intrinsic_println(ptr %t2595)
  %t2596 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.449)
  %t2597 = ptrtoint ptr %t2596 to i64
  %t2598 = inttoptr i64 %t2597 to ptr
  call void @intrinsic_println(ptr %t2598)
  %t2599 = call i64 @"run_conv_score"(i64 1)
  store i64 %t2599, ptr %local.conv_proj.2564
  %t2600 = load i64, ptr %local.conv_proj.2564
  %t2601 = icmp slt i64 %t2600, 0
  %t2602 = zext i1 %t2601 to i64
  %t2603 = icmp ne i64 %t2602, 0
  br i1 %t2603, label %then46, label %else46
then46:
  %t2604 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.450)
  %t2605 = ptrtoint ptr %t2604 to i64
  %t2606 = inttoptr i64 %t2605 to ptr
  call void @intrinsic_println(ptr %t2606)
  br label %then46_end
then46_end:
  br label %endif46
else46:
  %t2607 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.451)
  %t2608 = ptrtoint ptr %t2607 to i64
  %t2609 = inttoptr i64 %t2608 to ptr
  call void @intrinsic_print(ptr %t2609)
  %t2610 = load i64, ptr %local.conv_proj.2564
  call void @print_i64(i64 %t2610)
  %t2611 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.452)
  %t2612 = ptrtoint ptr %t2611 to i64
  %t2613 = inttoptr i64 %t2612 to ptr
  call void @intrinsic_println(ptr %t2613)
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t2614 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t2615 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.453)
  %t2616 = ptrtoint ptr %t2615 to i64
  %t2617 = inttoptr i64 %t2616 to ptr
  call void @intrinsic_println(ptr %t2617)
  %t2618 = load i64, ptr %local.conv_proj.2564
  %t2619 = icmp sge i64 %t2618, 0
  %t2620 = zext i1 %t2619 to i64
  %t2621 = icmp ne i64 %t2620, 0
  br i1 %t2621, label %then47, label %else47
then47:
  %t2622 = load i64, ptr %local.conv_std.2563
  %t2623 = icmp slt i64 %t2622, 0
  %t2624 = zext i1 %t2623 to i64
  %t2625 = icmp ne i64 %t2624, 0
  br i1 %t2625, label %then48, label %else48
then48:
  %t2626 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.454)
  %t2627 = ptrtoint ptr %t2626 to i64
  %t2628 = inttoptr i64 %t2627 to ptr
  call void @intrinsic_println(ptr %t2628)
  %t2629 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.455)
  %t2630 = ptrtoint ptr %t2629 to i64
  %t2631 = inttoptr i64 %t2630 to ptr
  call void @intrinsic_println(ptr %t2631)
  br label %then48_end
then48_end:
  br label %endif48
else48:
  %t2632 = load i64, ptr %local.conv_proj.2564
  %t2633 = load i64, ptr %local.conv_std.2563
  %t2634 = icmp slt i64 %t2632, %t2633
  %t2635 = zext i1 %t2634 to i64
  %t2636 = icmp ne i64 %t2635, 0
  br i1 %t2636, label %then49, label %else49
then49:
  %t2637 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.456)
  %t2638 = ptrtoint ptr %t2637 to i64
  %t2639 = inttoptr i64 %t2638 to ptr
  call void @intrinsic_println(ptr %t2639)
  br label %then49_end
then49_end:
  br label %endif49
else49:
  %t2640 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.457)
  %t2641 = ptrtoint ptr %t2640 to i64
  %t2642 = inttoptr i64 %t2641 to ptr
  call void @intrinsic_println(ptr %t2642)
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t2643 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t2644 = phi i64 [ 0, %then48_end ], [ %t2643, %else48_end ]
  br label %then47_end
then47_end:
  br label %endif47
else47:
  %t2645 = load i64, ptr %local.conv_std.2563
  %t2646 = icmp slt i64 %t2645, 0
  %t2647 = zext i1 %t2646 to i64
  %t2648 = icmp ne i64 %t2647, 0
  br i1 %t2648, label %then50, label %else50
then50:
  %t2649 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.458)
  %t2650 = ptrtoint ptr %t2649 to i64
  %t2651 = inttoptr i64 %t2650 to ptr
  call void @intrinsic_println(ptr %t2651)
  %t2652 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.459)
  %t2653 = ptrtoint ptr %t2652 to i64
  %t2654 = inttoptr i64 %t2653 to ptr
  call void @intrinsic_println(ptr %t2654)
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t2655 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t2656 = phi i64 [ %t2644, %then47_end ], [ %t2655, %else47_end ]
  %t2657 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.460)
  %t2658 = ptrtoint ptr %t2657 to i64
  %t2659 = inttoptr i64 %t2658 to ptr
  call void @intrinsic_println(ptr %t2659)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t2660 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.461)
  %t2661 = ptrtoint ptr %t2660 to i64
  %t2662 = inttoptr i64 %t2661 to ptr
  call void @intrinsic_println(ptr %t2662)
  %t2663 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.462)
  %t2664 = ptrtoint ptr %t2663 to i64
  %t2665 = inttoptr i64 %t2664 to ptr
  call void @intrinsic_println(ptr %t2665)
  %t2666 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.463)
  %t2667 = ptrtoint ptr %t2666 to i64
  %t2668 = inttoptr i64 %t2667 to ptr
  call void @intrinsic_println(ptr %t2668)
  %t2669 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.464)
  %t2670 = ptrtoint ptr %t2669 to i64
  %t2671 = inttoptr i64 %t2670 to ptr
  call void @intrinsic_println(ptr %t2671)
  %t2672 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.465)
  %t2673 = ptrtoint ptr %t2672 to i64
  %t2674 = inttoptr i64 %t2673 to ptr
  call void @intrinsic_println(ptr %t2674)
  %t2675 = call i64 @"train_standard_gan"()
  %t2676 = call i64 @"test_projected_gan"()
  %t2677 = call i64 @"test_learned_interaction"()
  %t2678 = call i64 @"test_skeptical_desire"()
  %t2679 = call i64 @"test_convergence_score"()
  %t2680 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.466)
  %t2681 = ptrtoint ptr %t2680 to i64
  %t2682 = inttoptr i64 %t2681 to ptr
  call void @intrinsic_println(ptr %t2682)
  %t2683 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.467)
  %t2684 = ptrtoint ptr %t2683 to i64
  %t2685 = inttoptr i64 %t2684 to ptr
  call void @intrinsic_println(ptr %t2685)
  %t2686 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.468)
  %t2687 = ptrtoint ptr %t2686 to i64
  %t2688 = inttoptr i64 %t2687 to ptr
  call void @intrinsic_println(ptr %t2688)
  %t2689 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.469)
  %t2690 = ptrtoint ptr %t2689 to i64
  %t2691 = inttoptr i64 %t2690 to ptr
  call void @intrinsic_println(ptr %t2691)
  %t2692 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.470)
  %t2693 = ptrtoint ptr %t2692 to i64
  %t2694 = inttoptr i64 %t2693 to ptr
  call void @intrinsic_println(ptr %t2694)
  %t2695 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.471)
  %t2696 = ptrtoint ptr %t2695 to i64
  %t2697 = inttoptr i64 %t2696 to ptr
  call void @intrinsic_println(ptr %t2697)
  %t2698 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.472)
  %t2699 = ptrtoint ptr %t2698 to i64
  %t2700 = inttoptr i64 %t2699 to ptr
  call void @intrinsic_println(ptr %t2700)
  %t2701 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.473)
  %t2702 = ptrtoint ptr %t2701 to i64
  %t2703 = inttoptr i64 %t2702 to ptr
  call void @intrinsic_println(ptr %t2703)
  %t2704 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.474)
  %t2705 = ptrtoint ptr %t2704 to i64
  %t2706 = inttoptr i64 %t2705 to ptr
  call void @intrinsic_println(ptr %t2706)
  %t2707 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.475)
  %t2708 = ptrtoint ptr %t2707 to i64
  %t2709 = inttoptr i64 %t2708 to ptr
  call void @intrinsic_println(ptr %t2709)
  %t2710 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.476)
  %t2711 = ptrtoint ptr %t2710 to i64
  %t2712 = inttoptr i64 %t2711 to ptr
  call void @intrinsic_println(ptr %t2712)
  %t2713 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.477)
  %t2714 = ptrtoint ptr %t2713 to i64
  %t2715 = inttoptr i64 %t2714 to ptr
  call void @intrinsic_println(ptr %t2715)
  %t2716 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.478)
  %t2717 = ptrtoint ptr %t2716 to i64
  %t2718 = inttoptr i64 %t2717 to ptr
  call void @intrinsic_println(ptr %t2718)
  %t2719 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.479)
  %t2720 = ptrtoint ptr %t2719 to i64
  %t2721 = inttoptr i64 %t2720 to ptr
  call void @intrinsic_println(ptr %t2721)
  %t2722 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.480)
  %t2723 = ptrtoint ptr %t2722 to i64
  %t2724 = inttoptr i64 %t2723 to ptr
  call void @intrinsic_println(ptr %t2724)
  %t2725 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.481)
  %t2726 = ptrtoint ptr %t2725 to i64
  %t2727 = inttoptr i64 %t2726 to ptr
  call void @intrinsic_println(ptr %t2727)
  %t2728 = call ptr @intrinsic_string_new(ptr @.str.exp_gan_convergence.482)
  %t2729 = ptrtoint ptr %t2728 to i64
  %t2730 = inttoptr i64 %t2729 to ptr
  call void @intrinsic_println(ptr %t2730)
  ret i64 0
}


; String constants
@.str.exp_gan_convergence.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.2 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.3 = private unnamed_addr constant [53 x i8] c"--- Exp 1: Standard GAN Training (No Projection) ---\00"
@.str.exp_gan_convergence.4 = private unnamed_addr constant [54 x i8] c"  G and D trained simultaneously, lr=0.01, 1000 steps\00"
@.str.exp_gan_convergence.5 = private unnamed_addr constant [26 x i8] c"  Target: [2, -1, 3, 0.5]\00"
@.str.exp_gan_convergence.6 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.9 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.10 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_gan_convergence.11 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.16 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.17 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.18 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.19 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.20 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_gan_convergence.21 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.32 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.33 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.34 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.36 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.37 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.39 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.40 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.41 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.42 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.43 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.45 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.47 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.49 = private unnamed_addr constant [22 x i8] c"  Generator final:  [\00"
@.str.exp_gan_convergence.50 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_gan_convergence.51 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_gan_convergence.52 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_gan_convergence.53 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.exp_gan_convergence.54 = private unnamed_addr constant [25 x i8] c"  Discriminator final: [\00"
@.str.exp_gan_convergence.55 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_gan_convergence.56 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_gan_convergence.57 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_gan_convergence.58 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.exp_gan_convergence.59 = private unnamed_addr constant [25 x i8] c"  G distance to target: \00"
@.str.exp_gan_convergence.60 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.61 = private unnamed_addr constant [25 x i8] c"  D distance to target: \00"
@.str.exp_gan_convergence.62 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.63 = private unnamed_addr constant [40 x i8] c"  Oscillation count (dim-0 reversals): \00"
@.str.exp_gan_convergence.64 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.65 = private unnamed_addr constant [64 x i8] c"  FINDING: Heavy oscillation detected -- standard GAN struggles\00"
@.str.exp_gan_convergence.66 = private unnamed_addr constant [32 x i8] c"  FINDING: Moderate oscillation\00"
@.str.exp_gan_convergence.67 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.68 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.69 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.70 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.71 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_gan_convergence.72 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.74 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.76 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.77 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.78 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.79 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.80 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.81 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_gan_convergence.82 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.83 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.89 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.92 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.95 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.96 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.97 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.98 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.99 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.100 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.101 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.102 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.103 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.104 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.105 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.106 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.107 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.108 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.109 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.110 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.111 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.112 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.113 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.114 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.115 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.116 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.117 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.118 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_gan_convergence.119 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.120 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.121 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.122 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.123 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.124 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.125 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.126 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.127 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.128 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_gan_convergence.129 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.130 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.131 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.132 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.133 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.134 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.135 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.136 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.137 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.138 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.139 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.140 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.141 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.142 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.143 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.144 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.145 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.146 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.147 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.148 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.149 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.150 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.151 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.152 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.153 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.154 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.155 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.156 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.157 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.158 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.159 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.160 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.162 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.163 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.164 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.165 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.166 = private unnamed_addr constant [49 x i8] c"--- Exp 2: GAN with Cosine-Scaled Projection ---\00"
@.str.exp_gan_convergence.167 = private unnamed_addr constant [54 x i8] c"  Same setup, alpha=1.0 (full projection on conflict)\00"
@.str.exp_gan_convergence.168 = private unnamed_addr constant [22 x i8] c"  1000 steps, lr=0.01\00"
@.str.exp_gan_convergence.169 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.170 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.171 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.172 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.173 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.174 = private unnamed_addr constant [37 x i8] c"  No projection:   G dist to target=\00"
@.str.exp_gan_convergence.175 = private unnamed_addr constant [16 x i8] c"  oscillations=\00"
@.str.exp_gan_convergence.176 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.177 = private unnamed_addr constant [37 x i8] c"  Full projection: G dist to target=\00"
@.str.exp_gan_convergence.178 = private unnamed_addr constant [16 x i8] c"  oscillations=\00"
@.str.exp_gan_convergence.179 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.180 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_gan_convergence.181 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.182 = private unnamed_addr constant [38 x i8] c"  Projection IMPROVES convergence by \00"
@.str.exp_gan_convergence.183 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.exp_gan_convergence.184 = private unnamed_addr constant [38 x i8] c"  Projection did not improve distance\00"
@.str.exp_gan_convergence.185 = private unnamed_addr constant [24 x i8] c"  Oscillation reduced: \00"
@.str.exp_gan_convergence.186 = private unnamed_addr constant [5 x i8] c" -> \00"
@.str.exp_gan_convergence.187 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.188 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.189 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.190 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.191 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.192 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_gan_convergence.193 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.194 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.195 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.196 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.197 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.198 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.199 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.200 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.201 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.202 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_gan_convergence.203 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.204 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.205 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.206 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.207 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.208 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.209 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.210 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.211 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.212 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.213 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.214 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.215 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.216 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.217 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.218 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.219 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.220 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.221 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.222 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.223 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.224 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.225 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.226 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.227 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.228 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.229 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.230 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.231 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.232 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.233 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.234 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.235 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.236 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.237 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_gan_convergence.238 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.239 = private unnamed_addr constant [51 x i8] c"--- Exp 3: GAN with Learned Interaction Matrix ---\00"
@.str.exp_gan_convergence.240 = private unnamed_addr constant [62 x i8] c"  Learn alpha_GD (G defers to D) and alpha_DG (D defers to G)\00"
@.str.exp_gan_convergence.241 = private unnamed_addr constant [39 x i8] c"  50 meta-cycles, 100 inner steps each\00"
@.str.exp_gan_convergence.242 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.243 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.244 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.245 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.246 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_gan_convergence.247 = private unnamed_addr constant [30 x i8] c"  Initial (0.5, 0.5): G dist=\00"
@.str.exp_gan_convergence.248 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.249 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.250 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.251 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.252 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.253 = private unnamed_addr constant [22 x i8] c"  Cycle 0:  alpha_GD=\00"
@.str.exp_gan_convergence.254 = private unnamed_addr constant [12 x i8] c"  alpha_DG=\00"
@.str.exp_gan_convergence.255 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.256 = private unnamed_addr constant [22 x i8] c"  Cycle 24: alpha_GD=\00"
@.str.exp_gan_convergence.257 = private unnamed_addr constant [12 x i8] c"  alpha_DG=\00"
@.str.exp_gan_convergence.258 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.259 = private unnamed_addr constant [22 x i8] c"  Cycle 49: alpha_GD=\00"
@.str.exp_gan_convergence.260 = private unnamed_addr constant [12 x i8] c"  alpha_DG=\00"
@.str.exp_gan_convergence.261 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.262 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.263 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.264 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.265 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.266 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.267 = private unnamed_addr constant [29 x i8] c"  No projection:     G dist=\00"
@.str.exp_gan_convergence.268 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.269 = private unnamed_addr constant [29 x i8] c"  Symmetric (1,1):   G dist=\00"
@.str.exp_gan_convergence.270 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.271 = private unnamed_addr constant [12 x i8] c"  Learned (\00"
@.str.exp_gan_convergence.272 = private unnamed_addr constant [2 x i8] c",\00"
@.str.exp_gan_convergence.273 = private unnamed_addr constant [11 x i8] c"): G dist=\00"
@.str.exp_gan_convergence.274 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.275 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.276 = private unnamed_addr constant [37 x i8] c"  Asymmetry |alpha_GD - alpha_DG| = \00"
@.str.exp_gan_convergence.277 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.278 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_gan_convergence.279 = private unnamed_addr constant [75 x i8] c"  FINDING: Interaction is ASYMMETRIC -- G and D need different cooperation\00"
@.str.exp_gan_convergence.280 = private unnamed_addr constant [55 x i8] c"  G defers MORE to D (generator follows discriminator)\00"
@.str.exp_gan_convergence.281 = private unnamed_addr constant [60 x i8] c"  D defers MORE to G (discriminator accommodates generator)\00"
@.str.exp_gan_convergence.282 = private unnamed_addr constant [44 x i8] c"  FINDING: Interaction is roughly symmetric\00"
@.str.exp_gan_convergence.283 = private unnamed_addr constant [51 x i8] c"  FINDING: Learned interaction BEATS no projection\00"
@.str.exp_gan_convergence.284 = private unnamed_addr constant [58 x i8] c"  FINDING: Learned interaction BEATS symmetric projection\00"
@.str.exp_gan_convergence.285 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.286 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.287 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.288 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.289 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_gan_convergence.290 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.291 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.292 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.293 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.294 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_gan_convergence.295 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.296 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.297 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.298 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.299 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.300 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.301 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.302 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.303 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_gan_convergence.304 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.305 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.306 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.307 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.308 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.309 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.310 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.311 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.312 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.313 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.314 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.315 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.316 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.317 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.318 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.319 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.320 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.321 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.322 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.323 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.324 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.325 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.326 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.327 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.328 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.329 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.330 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.331 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.332 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.333 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.334 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.335 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.336 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.337 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.338 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.339 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.340 = private unnamed_addr constant [41 x i8] c"--- Exp 4: GAN with Skeptical Desire ---\00"
@.str.exp_gan_convergence.341 = private unnamed_addr constant [61 x i8] c"  Generator has secondary 'skeptical' target at [0, 2, 1, 3]\00"
@.str.exp_gan_convergence.342 = private unnamed_addr constant [60 x i8] c"  This partially disagrees with real target [2, -1, 3, 0.5]\00"
@.str.exp_gan_convergence.343 = private unnamed_addr constant [39 x i8] c"  Projection always active (alpha=1.0)\00"
@.str.exp_gan_convergence.344 = private unnamed_addr constant [40 x i8] c"  Sweep coupling: 0, 0.3, 0.5, 0.8, 1.0\00"
@.str.exp_gan_convergence.345 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.346 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.347 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_gan_convergence.348 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.349 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_gan_convergence.350 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.351 = private unnamed_addr constant [24 x i8] c"  coupling=0.0: G dist=\00"
@.str.exp_gan_convergence.352 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.353 = private unnamed_addr constant [24 x i8] c"  coupling=0.3: G dist=\00"
@.str.exp_gan_convergence.354 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.355 = private unnamed_addr constant [24 x i8] c"  coupling=0.5: G dist=\00"
@.str.exp_gan_convergence.356 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.357 = private unnamed_addr constant [24 x i8] c"  coupling=0.8: G dist=\00"
@.str.exp_gan_convergence.358 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.359 = private unnamed_addr constant [24 x i8] c"  coupling=1.0: G dist=\00"
@.str.exp_gan_convergence.360 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.361 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.362 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.363 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_gan_convergence.364 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.365 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_gan_convergence.366 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.367 = private unnamed_addr constant [17 x i8] c"  BEST coupling=\00"
@.str.exp_gan_convergence.368 = private unnamed_addr constant [14 x i8] c" with G dist=\00"
@.str.exp_gan_convergence.369 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.370 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.371 = private unnamed_addr constant [53 x i8] c"  FINDING: Skeptical desire IMPROVES GAN convergence\00"
@.str.exp_gan_convergence.372 = private unnamed_addr constant [58 x i8] c"  A misaligned secondary target regularises the generator\00"
@.str.exp_gan_convergence.373 = private unnamed_addr constant [67 x i8] c"  FINDING: No skeptical desire needed -- projection alone suffices\00"
@.str.exp_gan_convergence.374 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.375 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.376 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.377 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_gan_convergence.378 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_gan_convergence.379 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_gan_convergence.380 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.381 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.382 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.383 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.384 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.385 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.386 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.387 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_gan_convergence.388 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_gan_convergence.389 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.390 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.391 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.392 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.393 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.394 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.395 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.396 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.397 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.398 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.399 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.400 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.401 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.402 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.403 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.404 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.405 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.406 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.407 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.408 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.409 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.410 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.411 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.412 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.413 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.414 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.415 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.416 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.417 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.418 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.419 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.420 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.421 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.422 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.423 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_gan_convergence.424 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.425 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_gan_convergence.426 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.427 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_gan_convergence.428 = private unnamed_addr constant [18 x i8] c"    step=10:   S=\00"
@.str.exp_gan_convergence.429 = private unnamed_addr constant [5 x i8] c"  D=\00"
@.str.exp_gan_convergence.430 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.431 = private unnamed_addr constant [18 x i8] c"    step=100:  S=\00"
@.str.exp_gan_convergence.432 = private unnamed_addr constant [5 x i8] c"  D=\00"
@.str.exp_gan_convergence.433 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.434 = private unnamed_addr constant [18 x i8] c"    step=500:  S=\00"
@.str.exp_gan_convergence.435 = private unnamed_addr constant [5 x i8] c"  D=\00"
@.str.exp_gan_convergence.436 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.437 = private unnamed_addr constant [18 x i8] c"    step=999:  S=\00"
@.str.exp_gan_convergence.438 = private unnamed_addr constant [5 x i8] c"  D=\00"
@.str.exp_gan_convergence.439 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.440 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_gan_convergence.441 = private unnamed_addr constant [57 x i8] c"--- Exp 5: Convergence Score S(t) = D + |D'| + |D''| ---\00"
@.str.exp_gan_convergence.442 = private unnamed_addr constant [37 x i8] c"  Threshold for convergence: S < 0.1\00"
@.str.exp_gan_convergence.443 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.444 = private unnamed_addr constant [32 x i8] c"  Standard GAN (no projection):\00"
@.str.exp_gan_convergence.445 = private unnamed_addr constant [39 x i8] c"    Did NOT converge within 1000 steps\00"
@.str.exp_gan_convergence.446 = private unnamed_addr constant [23 x i8] c"    Converged at step \00"
@.str.exp_gan_convergence.447 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.448 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.449 = private unnamed_addr constant [29 x i8] c"  Projected GAN (alpha=1.0):\00"
@.str.exp_gan_convergence.450 = private unnamed_addr constant [39 x i8] c"    Did NOT converge within 1000 steps\00"
@.str.exp_gan_convergence.451 = private unnamed_addr constant [23 x i8] c"    Converged at step \00"
@.str.exp_gan_convergence.452 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.453 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.454 = private unnamed_addr constant [63 x i8] c"  FINDING: Projected GAN CONVERGES where standard GAN does NOT\00"
@.str.exp_gan_convergence.455 = private unnamed_addr constant [59 x i8] c"  The convergence score correctly diagnoses the difference\00"
@.str.exp_gan_convergence.456 = private unnamed_addr constant [42 x i8] c"  FINDING: Projected GAN converges FASTER\00"
@.str.exp_gan_convergence.457 = private unnamed_addr constant [54 x i8] c"  FINDING: Both converge, but standard is competitive\00"
@.str.exp_gan_convergence.458 = private unnamed_addr constant [53 x i8] c"  FINDING: Neither converged -- problem is very hard\00"
@.str.exp_gan_convergence.459 = private unnamed_addr constant [50 x i8] c"  But projected GAN should show LOWER final score\00"
@.str.exp_gan_convergence.460 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.461 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_gan_convergence.462 = private unnamed_addr constant [54 x i8] c"  GAN CONVERGENCE VIA GEOMETRIC CONTRACTION FRAMEWORK\00"
@.str.exp_gan_convergence.463 = private unnamed_addr constant [54 x i8] c"  Can projection resolve the GAN convergence problem?\00"
@.str.exp_gan_convergence.464 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_gan_convergence.465 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.466 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_gan_convergence.467 = private unnamed_addr constant [10 x i8] c"  SUMMARY\00"
@.str.exp_gan_convergence.468 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_gan_convergence.469 = private unnamed_addr constant [49 x i8] c"  1. Standard GAN: oscillates, fails to converge\00"
@.str.exp_gan_convergence.470 = private unnamed_addr constant [52 x i8] c"  2. Cosine-scaled projection: reduces oscillation,\00"
@.str.exp_gan_convergence.471 = private unnamed_addr constant [47 x i8] c"     improves generator proximity to real data\00"
@.str.exp_gan_convergence.472 = private unnamed_addr constant [59 x i8] c"  3. Learned interaction: discovers ASYMMETRIC cooperation\00"
@.str.exp_gan_convergence.473 = private unnamed_addr constant [61 x i8] c"     between G and D -- they need different deference levels\00"
@.str.exp_gan_convergence.474 = private unnamed_addr constant [55 x i8] c"  4. Skeptical desire: misaligned secondary target can\00"
@.str.exp_gan_convergence.475 = private unnamed_addr constant [54 x i8] c"     regularise the generator and improve convergence\00"
@.str.exp_gan_convergence.476 = private unnamed_addr constant [54 x i8] c"  5. Convergence score S(t): correctly diagnoses when\00"
@.str.exp_gan_convergence.477 = private unnamed_addr constant [60 x i8] c"     training has converged vs when it is still oscillating\00"
@.str.exp_gan_convergence.478 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_gan_convergence.479 = private unnamed_addr constant [53 x i8] c"  The Geometric Contraction Framework transforms the\00"
@.str.exp_gan_convergence.480 = private unnamed_addr constant [53 x i8] c"  GAN minimax game from adversarial oscillation into\00"
@.str.exp_gan_convergence.481 = private unnamed_addr constant [60 x i8] c"  cooperative convergence via gradient conflict resolution.\00"
@.str.exp_gan_convergence.482 = private unnamed_addr constant [61 x i8] c"============================================================\00"
