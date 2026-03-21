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
  %t1 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t9 = load i64, ptr %local.state
  %t10 = mul i64 %t9, 1664525
  %t11 = add i64 %t10, 1013904223
  ret i64 %t11
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.12 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t13 = load i64, ptr %local.state
  store i64 %t13, ptr %local.s.12
  %t14 = load i64, ptr %local.s.12
  %t15 = icmp slt i64 %t14, 0
  %t16 = zext i1 %t15 to i64
  %t17 = icmp ne i64 %t16, 0
  br i1 %t17, label %then1, label %else1
then1:
  %t18 = load i64, ptr %local.s.12
  %t19 = sub i64 0, %t18
  store i64 %t19, ptr %local.s.12
  br label %then1_end
then1_end:
  br label %endif1
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t20 = phi i64 [ 0, %then1_end ], [ 0, %else1_end ]
  %t21 = load i64, ptr %local.s.12
  %t22 = srem i64 %t21, 10000
  %t23 = call i64 @"sx_int_to_f64"(i64 %t22)
  %t24 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.2)
  %t25 = call i64 @"sx_f64_div"(i64 %t23, i64 %t24)
  ret i64 %t25
}

define i64 @"beta_mean"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t26 = load i64, ptr %local.a
  %t27 = load i64, ptr %local.a
  %t28 = load i64, ptr %local.b
  %t29 = call i64 @"sx_f64_add"(i64 %t27, i64 %t28)
  %t30 = call i64 @"sx_f64_div"(i64 %t26, i64 %t29)
  ret i64 %t30
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t31 = load i64, ptr %local.x
  %t32 = load i64, ptr %local.lo
  %t33 = call i64 @"sx_f64_lt"(i64 %t31, i64 %t32)
  %t34 = icmp ne i64 %t33, 0
  br i1 %t34, label %then2, label %else2
then2:
  %t35 = load i64, ptr %local.lo
  ret i64 %t35
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t36 = phi i64 [ 0, %else2_end ]
  %t37 = load i64, ptr %local.x
  %t38 = load i64, ptr %local.hi
  %t39 = call i64 @"sx_f64_gt"(i64 %t37, i64 %t38)
  %t40 = icmp ne i64 %t39, 0
  br i1 %t40, label %then3, label %else3
then3:
  %t41 = load i64, ptr %local.hi
  ret i64 %t41
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t42 = phi i64 [ 0, %else3_end ]
  %t43 = load i64, ptr %local.x
  ret i64 %t43
}

define i64 @"train_belief"(i64 %desire, i64 %coupling, i64 %true_val, i64 %observations, i64 %seed) nounwind {
entry:
  %local.al.44 = alloca i64
  %local.be.45 = alloca i64
  %local.rng.46 = alloca i64
  %local.step.47 = alloca i64
  %local.conf.48 = alloca i64
  %local.alignment.49 = alloca i64
  %local.boost.50 = alloca i64
  %local.posterior.51 = alloca i64
  %local.err.52 = alloca i64
  %local.desire = alloca i64
  store i64 %desire, ptr %local.desire
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.observations = alloca i64
  store i64 %observations, ptr %local.observations
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t53 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.3)
  store i64 %t53, ptr %local.al.44
  %t54 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.4)
  store i64 %t54, ptr %local.be.45
  %t55 = load i64, ptr %local.seed
  store i64 %t55, ptr %local.rng.46
  store i64 0, ptr %local.step.47
  %t56 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.5)
  store i64 %t56, ptr %local.conf.48
  %t57 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.6)
  store i64 %t57, ptr %local.alignment.49
  %t58 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.7)
  store i64 %t58, ptr %local.boost.50
  br label %loop4
loop4:
  %t59 = load i64, ptr %local.step.47
  %t60 = load i64, ptr %local.observations
  %t61 = icmp slt i64 %t59, %t60
  %t62 = zext i1 %t61 to i64
  %t63 = icmp ne i64 %t62, 0
  br i1 %t63, label %body4, label %endloop4
body4:
  %t64 = load i64, ptr %local.al.44
  %t65 = load i64, ptr %local.be.45
  %t66 = call i64 @"beta_mean"(i64 %t64, i64 %t65)
  store i64 %t66, ptr %local.conf.48
  %t67 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.8)
  %t68 = load i64, ptr %local.conf.48
  %t69 = load i64, ptr %local.desire
  %t70 = call i64 @"sx_f64_sub"(i64 %t68, i64 %t69)
  %t71 = call i64 @"abs_f64"(i64 %t70)
  %t72 = call i64 @"sx_f64_sub"(i64 %t67, i64 %t71)
  store i64 %t72, ptr %local.alignment.49
  %t73 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.9)
  %t74 = load i64, ptr %local.coupling
  %t75 = load i64, ptr %local.alignment.49
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_add"(i64 %t73, i64 %t76)
  store i64 %t77, ptr %local.boost.50
  %t78 = load i64, ptr %local.rng.46
  %t79 = call i64 @"lcg_next"(i64 %t78)
  store i64 %t79, ptr %local.rng.46
  %t80 = load i64, ptr %local.rng.46
  %t81 = call i64 @"lcg_f64"(i64 %t80)
  %t82 = load i64, ptr %local.true_val
  %t83 = call i64 @"sx_f64_lt"(i64 %t81, i64 %t82)
  %t84 = icmp ne i64 %t83, 0
  br i1 %t84, label %then5, label %else5
then5:
  %t85 = load i64, ptr %local.al.44
  %t86 = load i64, ptr %local.boost.50
  %t87 = call i64 @"sx_f64_add"(i64 %t85, i64 %t86)
  store i64 %t87, ptr %local.al.44
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t88 = load i64, ptr %local.be.45
  %t89 = load i64, ptr %local.boost.50
  %t90 = call i64 @"sx_f64_add"(i64 %t88, i64 %t89)
  store i64 %t90, ptr %local.be.45
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t91 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t92 = load i64, ptr %local.step.47
  %t93 = add i64 %t92, 1
  store i64 %t93, ptr %local.step.47
  br label %loop4
endloop4:
  %t94 = load i64, ptr %local.al.44
  %t95 = load i64, ptr %local.be.45
  %t96 = call i64 @"beta_mean"(i64 %t94, i64 %t95)
  store i64 %t96, ptr %local.posterior.51
  %t97 = load i64, ptr %local.posterior.51
  %t98 = load i64, ptr %local.true_val
  %t99 = call i64 @"sx_f64_sub"(i64 %t97, i64 %t98)
  store i64 %t99, ptr %local.err.52
  %t100 = load i64, ptr %local.err.52
  %t101 = load i64, ptr %local.err.52
  %t102 = call i64 @"sx_f64_mul"(i64 %t100, i64 %t101)
  ret i64 %t102
}

define i64 @"train_annealed"(i64 %true_val, i64 %seed) nounwind {
entry:
  %local.al.103 = alloca i64
  %local.be.104 = alloca i64
  %local.rng.105 = alloca i64
  %local.step.106 = alloca i64
  %local.conf.107 = alloca i64
  %local.desire.108 = alloca i64
  %local.coupling.109 = alloca i64
  %local.alignment.110 = alloca i64
  %local.boost.111 = alloca i64
  %local.posterior.112 = alloca i64
  %local.err.113 = alloca i64
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t114 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.10)
  store i64 %t114, ptr %local.al.103
  %t115 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.11)
  store i64 %t115, ptr %local.be.104
  %t116 = load i64, ptr %local.seed
  store i64 %t116, ptr %local.rng.105
  store i64 0, ptr %local.step.106
  %t117 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.12)
  store i64 %t117, ptr %local.conf.107
  %t118 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.13)
  store i64 %t118, ptr %local.desire.108
  %t119 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.14)
  store i64 %t119, ptr %local.coupling.109
  %t120 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.15)
  store i64 %t120, ptr %local.alignment.110
  %t121 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.16)
  store i64 %t121, ptr %local.boost.111
  br label %loop6
loop6:
  %t122 = load i64, ptr %local.step.106
  %t123 = icmp slt i64 %t122, 150
  %t124 = zext i1 %t123 to i64
  %t125 = icmp ne i64 %t124, 0
  br i1 %t125, label %body6, label %endloop6
body6:
  %t126 = load i64, ptr %local.al.103
  %t127 = load i64, ptr %local.be.104
  %t128 = call i64 @"beta_mean"(i64 %t126, i64 %t127)
  store i64 %t128, ptr %local.conf.107
  %t129 = load i64, ptr %local.step.106
  %t130 = icmp slt i64 %t129, 50
  %t131 = zext i1 %t130 to i64
  %t132 = icmp ne i64 %t131, 0
  br i1 %t132, label %then7, label %else7
then7:
  %t133 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.17)
  store i64 %t133, ptr %local.desire.108
  %t134 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.18)
  store i64 %t134, ptr %local.coupling.109
  br label %then7_end
then7_end:
  br label %endif7
else7:
  %t135 = load i64, ptr %local.step.106
  %t136 = icmp slt i64 %t135, 100
  %t137 = zext i1 %t136 to i64
  %t138 = icmp ne i64 %t137, 0
  br i1 %t138, label %then8, label %else8
then8:
  %t139 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.19)
  store i64 %t139, ptr %local.desire.108
  %t140 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.20)
  store i64 %t140, ptr %local.coupling.109
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t141 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.21)
  store i64 %t141, ptr %local.desire.108
  %t142 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.22)
  store i64 %t142, ptr %local.coupling.109
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t143 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t144 = phi i64 [ 0, %then7_end ], [ %t143, %else7_end ]
  %t145 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.23)
  %t146 = load i64, ptr %local.conf.107
  %t147 = load i64, ptr %local.desire.108
  %t148 = call i64 @"sx_f64_sub"(i64 %t146, i64 %t147)
  %t149 = call i64 @"abs_f64"(i64 %t148)
  %t150 = call i64 @"sx_f64_sub"(i64 %t145, i64 %t149)
  store i64 %t150, ptr %local.alignment.110
  %t151 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.24)
  %t152 = load i64, ptr %local.coupling.109
  %t153 = load i64, ptr %local.alignment.110
  %t154 = call i64 @"sx_f64_mul"(i64 %t152, i64 %t153)
  %t155 = call i64 @"sx_f64_add"(i64 %t151, i64 %t154)
  store i64 %t155, ptr %local.boost.111
  %t156 = load i64, ptr %local.rng.105
  %t157 = call i64 @"lcg_next"(i64 %t156)
  store i64 %t157, ptr %local.rng.105
  %t158 = load i64, ptr %local.rng.105
  %t159 = call i64 @"lcg_f64"(i64 %t158)
  %t160 = load i64, ptr %local.true_val
  %t161 = call i64 @"sx_f64_lt"(i64 %t159, i64 %t160)
  %t162 = icmp ne i64 %t161, 0
  br i1 %t162, label %then9, label %else9
then9:
  %t163 = load i64, ptr %local.al.103
  %t164 = load i64, ptr %local.boost.111
  %t165 = call i64 @"sx_f64_add"(i64 %t163, i64 %t164)
  store i64 %t165, ptr %local.al.103
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t166 = load i64, ptr %local.be.104
  %t167 = load i64, ptr %local.boost.111
  %t168 = call i64 @"sx_f64_add"(i64 %t166, i64 %t167)
  store i64 %t168, ptr %local.be.104
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t169 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t170 = load i64, ptr %local.step.106
  %t171 = add i64 %t170, 1
  store i64 %t171, ptr %local.step.106
  br label %loop6
endloop6:
  %t172 = load i64, ptr %local.al.103
  %t173 = load i64, ptr %local.be.104
  %t174 = call i64 @"beta_mean"(i64 %t172, i64 %t173)
  store i64 %t174, ptr %local.posterior.112
  %t175 = load i64, ptr %local.posterior.112
  %t176 = load i64, ptr %local.true_val
  %t177 = call i64 @"sx_f64_sub"(i64 %t175, i64 %t176)
  store i64 %t177, ptr %local.err.113
  %t178 = load i64, ptr %local.err.113
  %t179 = load i64, ptr %local.err.113
  %t180 = call i64 @"sx_f64_mul"(i64 %t178, i64 %t179)
  ret i64 %t180
}

define i64 @"avg_loss_fixed"(i64 %desire, i64 %coupling, i64 %true_val) nounwind {
entry:
  %local.l1.181 = alloca i64
  %local.l2.182 = alloca i64
  %local.l3.183 = alloca i64
  %local.l4.184 = alloca i64
  %local.desire = alloca i64
  store i64 %desire, ptr %local.desire
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %t185 = load i64, ptr %local.desire
  %t186 = load i64, ptr %local.coupling
  %t187 = load i64, ptr %local.true_val
  %t188 = call i64 @"train_belief"(i64 %t185, i64 %t186, i64 %t187, i64 150, i64 42)
  store i64 %t188, ptr %local.l1.181
  %t189 = load i64, ptr %local.desire
  %t190 = load i64, ptr %local.coupling
  %t191 = load i64, ptr %local.true_val
  %t192 = call i64 @"train_belief"(i64 %t189, i64 %t190, i64 %t191, i64 150, i64 137)
  store i64 %t192, ptr %local.l2.182
  %t193 = load i64, ptr %local.desire
  %t194 = load i64, ptr %local.coupling
  %t195 = load i64, ptr %local.true_val
  %t196 = call i64 @"train_belief"(i64 %t193, i64 %t194, i64 %t195, i64 150, i64 999)
  store i64 %t196, ptr %local.l3.183
  %t197 = load i64, ptr %local.desire
  %t198 = load i64, ptr %local.coupling
  %t199 = load i64, ptr %local.true_val
  %t200 = call i64 @"train_belief"(i64 %t197, i64 %t198, i64 %t199, i64 150, i64 2023)
  store i64 %t200, ptr %local.l4.184
  %t201 = load i64, ptr %local.l1.181
  %t202 = load i64, ptr %local.l2.182
  %t203 = call i64 @"sx_f64_add"(i64 %t201, i64 %t202)
  %t204 = load i64, ptr %local.l3.183
  %t205 = call i64 @"sx_f64_add"(i64 %t203, i64 %t204)
  %t206 = load i64, ptr %local.l4.184
  %t207 = call i64 @"sx_f64_add"(i64 %t205, i64 %t206)
  %t208 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.25)
  %t209 = call i64 @"sx_f64_div"(i64 %t207, i64 %t208)
  ret i64 %t209
}

define i64 @"avg_loss_annealed"(i64 %true_val) nounwind {
entry:
  %local.l1.210 = alloca i64
  %local.l2.211 = alloca i64
  %local.l3.212 = alloca i64
  %local.l4.213 = alloca i64
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %t214 = load i64, ptr %local.true_val
  %t215 = call i64 @"train_annealed"(i64 %t214, i64 42)
  store i64 %t215, ptr %local.l1.210
  %t216 = load i64, ptr %local.true_val
  %t217 = call i64 @"train_annealed"(i64 %t216, i64 137)
  store i64 %t217, ptr %local.l2.211
  %t218 = load i64, ptr %local.true_val
  %t219 = call i64 @"train_annealed"(i64 %t218, i64 999)
  store i64 %t219, ptr %local.l3.212
  %t220 = load i64, ptr %local.true_val
  %t221 = call i64 @"train_annealed"(i64 %t220, i64 2023)
  store i64 %t221, ptr %local.l4.213
  %t222 = load i64, ptr %local.l1.210
  %t223 = load i64, ptr %local.l2.211
  %t224 = call i64 @"sx_f64_add"(i64 %t222, i64 %t223)
  %t225 = load i64, ptr %local.l3.212
  %t226 = call i64 @"sx_f64_add"(i64 %t224, i64 %t225)
  %t227 = load i64, ptr %local.l4.213
  %t228 = call i64 @"sx_f64_add"(i64 %t226, i64 %t227)
  %t229 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.26)
  %t230 = call i64 @"sx_f64_div"(i64 %t228, i64 %t229)
  ret i64 %t230
}

define i64 @"test_annealing_schedule"() nounwind {
entry:
  %local.true_val.231 = alloca i64
  %local.loss_none.232 = alloca i64
  %local.loss_aligned.233 = alloca i64
  %local.loss_skeptical.234 = alloca i64
  %local.loss_annealed.235 = alloca i64
  %local.best_name.236 = alloca i64
  %local.best_loss.237 = alloca i64
  %t238 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.27)
  %t239 = ptrtoint ptr %t238 to i64
  %t240 = inttoptr i64 %t239 to ptr
  call void @intrinsic_println(ptr %t240)
  %t241 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.28)
  %t242 = ptrtoint ptr %t241 to i64
  %t243 = inttoptr i64 %t242 to ptr
  call void @intrinsic_println(ptr %t243)
  %t244 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.29)
  %t245 = ptrtoint ptr %t244 to i64
  %t246 = inttoptr i64 %t245 to ptr
  call void @intrinsic_println(ptr %t246)
  %t247 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.30)
  %t248 = ptrtoint ptr %t247 to i64
  %t249 = inttoptr i64 %t248 to ptr
  call void @intrinsic_println(ptr %t249)
  %t250 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.31)
  store i64 %t250, ptr %local.true_val.231
  %t251 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.32)
  %t252 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.33)
  %t253 = load i64, ptr %local.true_val.231
  %t254 = call i64 @"avg_loss_fixed"(i64 %t251, i64 %t252, i64 %t253)
  store i64 %t254, ptr %local.loss_none.232
  %t255 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.34)
  %t256 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.35)
  %t257 = load i64, ptr %local.true_val.231
  %t258 = call i64 @"avg_loss_fixed"(i64 %t255, i64 %t256, i64 %t257)
  store i64 %t258, ptr %local.loss_aligned.233
  %t259 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.36)
  %t260 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.37)
  %t261 = load i64, ptr %local.true_val.231
  %t262 = call i64 @"avg_loss_fixed"(i64 %t259, i64 %t260, i64 %t261)
  store i64 %t262, ptr %local.loss_skeptical.234
  %t263 = load i64, ptr %local.true_val.231
  %t264 = call i64 @"avg_loss_annealed"(i64 %t263)
  store i64 %t264, ptr %local.loss_annealed.235
  %t265 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.38)
  %t266 = ptrtoint ptr %t265 to i64
  %t267 = inttoptr i64 %t266 to ptr
  call void @intrinsic_print(ptr %t267)
  %t268 = load i64, ptr %local.loss_none.232
  %t269 = call i64 @"print_f64"(i64 %t268)
  %t270 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.39)
  %t271 = ptrtoint ptr %t270 to i64
  %t272 = inttoptr i64 %t271 to ptr
  call void @intrinsic_println(ptr %t272)
  %t273 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.40)
  %t274 = ptrtoint ptr %t273 to i64
  %t275 = inttoptr i64 %t274 to ptr
  call void @intrinsic_print(ptr %t275)
  %t276 = load i64, ptr %local.loss_aligned.233
  %t277 = call i64 @"print_f64"(i64 %t276)
  %t278 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.41)
  %t279 = ptrtoint ptr %t278 to i64
  %t280 = inttoptr i64 %t279 to ptr
  call void @intrinsic_println(ptr %t280)
  %t281 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.42)
  %t282 = ptrtoint ptr %t281 to i64
  %t283 = inttoptr i64 %t282 to ptr
  call void @intrinsic_print(ptr %t283)
  %t284 = load i64, ptr %local.loss_skeptical.234
  %t285 = call i64 @"print_f64"(i64 %t284)
  %t286 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.43)
  %t287 = ptrtoint ptr %t286 to i64
  %t288 = inttoptr i64 %t287 to ptr
  call void @intrinsic_println(ptr %t288)
  %t289 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.44)
  %t290 = ptrtoint ptr %t289 to i64
  %t291 = inttoptr i64 %t290 to ptr
  call void @intrinsic_print(ptr %t291)
  %t292 = load i64, ptr %local.loss_annealed.235
  %t293 = call i64 @"print_f64"(i64 %t292)
  %t294 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.45)
  %t295 = ptrtoint ptr %t294 to i64
  %t296 = inttoptr i64 %t295 to ptr
  call void @intrinsic_println(ptr %t296)
  %t297 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.46)
  %t298 = ptrtoint ptr %t297 to i64
  %t299 = inttoptr i64 %t298 to ptr
  call void @intrinsic_println(ptr %t299)
  store i64 0, ptr %local.best_name.236
  %t300 = load i64, ptr %local.loss_none.232
  store i64 %t300, ptr %local.best_loss.237
  %t301 = load i64, ptr %local.loss_aligned.233
  %t302 = load i64, ptr %local.best_loss.237
  %t303 = call i64 @"sx_f64_lt"(i64 %t301, i64 %t302)
  %t304 = icmp ne i64 %t303, 0
  br i1 %t304, label %then10, label %else10
then10:
  %t305 = load i64, ptr %local.loss_aligned.233
  store i64 %t305, ptr %local.best_loss.237
  store i64 1, ptr %local.best_name.236
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t306 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t307 = load i64, ptr %local.loss_skeptical.234
  %t308 = load i64, ptr %local.best_loss.237
  %t309 = call i64 @"sx_f64_lt"(i64 %t307, i64 %t308)
  %t310 = icmp ne i64 %t309, 0
  br i1 %t310, label %then11, label %else11
then11:
  %t311 = load i64, ptr %local.loss_skeptical.234
  store i64 %t311, ptr %local.best_loss.237
  store i64 2, ptr %local.best_name.236
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t312 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t313 = load i64, ptr %local.loss_annealed.235
  %t314 = load i64, ptr %local.best_loss.237
  %t315 = call i64 @"sx_f64_lt"(i64 %t313, i64 %t314)
  %t316 = icmp ne i64 %t315, 0
  br i1 %t316, label %then12, label %else12
then12:
  %t317 = load i64, ptr %local.loss_annealed.235
  store i64 %t317, ptr %local.best_loss.237
  store i64 3, ptr %local.best_name.236
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t318 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t319 = load i64, ptr %local.best_name.236
  %t320 = icmp eq i64 %t319, 0
  %t321 = zext i1 %t320 to i64
  %t322 = icmp ne i64 %t321, 0
  br i1 %t322, label %then13, label %else13
then13:
  %t323 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.47)
  %t324 = ptrtoint ptr %t323 to i64
  %t325 = inttoptr i64 %t324 to ptr
  call void @intrinsic_println(ptr %t325)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t326 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t327 = load i64, ptr %local.best_name.236
  %t328 = icmp eq i64 %t327, 1
  %t329 = zext i1 %t328 to i64
  %t330 = icmp ne i64 %t329, 0
  br i1 %t330, label %then14, label %else14
then14:
  %t331 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.48)
  %t332 = ptrtoint ptr %t331 to i64
  %t333 = inttoptr i64 %t332 to ptr
  call void @intrinsic_println(ptr %t333)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t334 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t335 = load i64, ptr %local.best_name.236
  %t336 = icmp eq i64 %t335, 2
  %t337 = zext i1 %t336 to i64
  %t338 = icmp ne i64 %t337, 0
  br i1 %t338, label %then15, label %else15
then15:
  %t339 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.49)
  %t340 = ptrtoint ptr %t339 to i64
  %t341 = inttoptr i64 %t340 to ptr
  call void @intrinsic_println(ptr %t341)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t342 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t343 = load i64, ptr %local.best_name.236
  %t344 = icmp eq i64 %t343, 3
  %t345 = zext i1 %t344 to i64
  %t346 = icmp ne i64 %t345, 0
  br i1 %t346, label %then16, label %else16
then16:
  %t347 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.50)
  %t348 = ptrtoint ptr %t347 to i64
  %t349 = inttoptr i64 %t348 to ptr
  call void @intrinsic_println(ptr %t349)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t350 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t351 = load i64, ptr %local.loss_annealed.235
  %t352 = load i64, ptr %local.loss_skeptical.234
  %t353 = call i64 @"sx_f64_lt"(i64 %t351, i64 %t352)
  %t354 = icmp ne i64 %t353, 0
  br i1 %t354, label %then17, label %else17
then17:
  %t355 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.51)
  %t356 = ptrtoint ptr %t355 to i64
  %t357 = inttoptr i64 %t356 to ptr
  call void @intrinsic_println(ptr %t357)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  %t358 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.52)
  %t359 = ptrtoint ptr %t358 to i64
  %t360 = inttoptr i64 %t359 to ptr
  call void @intrinsic_println(ptr %t360)
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t361 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t362 = load i64, ptr %local.loss_annealed.235
  %t363 = load i64, ptr %local.loss_aligned.233
  %t364 = call i64 @"sx_f64_lt"(i64 %t362, i64 %t363)
  %t365 = icmp ne i64 %t364, 0
  br i1 %t365, label %then18, label %else18
then18:
  %t366 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.53)
  %t367 = ptrtoint ptr %t366 to i64
  %t368 = inttoptr i64 %t367 to ptr
  call void @intrinsic_println(ptr %t368)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t369 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t370 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.54)
  %t371 = ptrtoint ptr %t370 to i64
  %t372 = inttoptr i64 %t371 to ptr
  call void @intrinsic_println(ptr %t372)
  ret i64 0
}

define i64 @"train_binned"(i64 %d0, i64 %d1, i64 %d2, i64 %d3, i64 %d4, i64 %d5, i64 %coupling, i64 %true_val, i64 %seed) nounwind {
entry:
  %local.al.373 = alloca i64
  %local.be.374 = alloca i64
  %local.rng.375 = alloca i64
  %local.step.376 = alloca i64
  %local.conf.377 = alloca i64
  %local.desire.378 = alloca i64
  %local.alignment.379 = alloca i64
  %local.boost.380 = alloca i64
  %local.bin.381 = alloca i64
  %local.posterior.382 = alloca i64
  %local.err.383 = alloca i64
  %local.d0 = alloca i64
  store i64 %d0, ptr %local.d0
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %local.d4 = alloca i64
  store i64 %d4, ptr %local.d4
  %local.d5 = alloca i64
  store i64 %d5, ptr %local.d5
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t384 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.55)
  store i64 %t384, ptr %local.al.373
  %t385 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.56)
  store i64 %t385, ptr %local.be.374
  %t386 = load i64, ptr %local.seed
  store i64 %t386, ptr %local.rng.375
  store i64 0, ptr %local.step.376
  %t387 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.57)
  store i64 %t387, ptr %local.conf.377
  %t388 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.58)
  store i64 %t388, ptr %local.desire.378
  %t389 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.59)
  store i64 %t389, ptr %local.alignment.379
  %t390 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.60)
  store i64 %t390, ptr %local.boost.380
  store i64 0, ptr %local.bin.381
  br label %loop19
loop19:
  %t391 = load i64, ptr %local.step.376
  %t392 = icmp slt i64 %t391, 150
  %t393 = zext i1 %t392 to i64
  %t394 = icmp ne i64 %t393, 0
  br i1 %t394, label %body19, label %endloop19
body19:
  %t395 = load i64, ptr %local.al.373
  %t396 = load i64, ptr %local.be.374
  %t397 = call i64 @"beta_mean"(i64 %t395, i64 %t396)
  store i64 %t397, ptr %local.conf.377
  %t398 = load i64, ptr %local.step.376
  %t399 = sdiv i64 %t398, 25
  store i64 %t399, ptr %local.bin.381
  %t400 = load i64, ptr %local.bin.381
  %t401 = icmp eq i64 %t400, 0
  %t402 = zext i1 %t401 to i64
  %t403 = icmp ne i64 %t402, 0
  br i1 %t403, label %then20, label %else20
then20:
  %t404 = load i64, ptr %local.d0
  store i64 %t404, ptr %local.desire.378
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t405 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t406 = load i64, ptr %local.bin.381
  %t407 = icmp eq i64 %t406, 1
  %t408 = zext i1 %t407 to i64
  %t409 = icmp ne i64 %t408, 0
  br i1 %t409, label %then21, label %else21
then21:
  %t410 = load i64, ptr %local.d1
  store i64 %t410, ptr %local.desire.378
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t411 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t412 = load i64, ptr %local.bin.381
  %t413 = icmp eq i64 %t412, 2
  %t414 = zext i1 %t413 to i64
  %t415 = icmp ne i64 %t414, 0
  br i1 %t415, label %then22, label %else22
then22:
  %t416 = load i64, ptr %local.d2
  store i64 %t416, ptr %local.desire.378
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t417 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  %t418 = load i64, ptr %local.bin.381
  %t419 = icmp eq i64 %t418, 3
  %t420 = zext i1 %t419 to i64
  %t421 = icmp ne i64 %t420, 0
  br i1 %t421, label %then23, label %else23
then23:
  %t422 = load i64, ptr %local.d3
  store i64 %t422, ptr %local.desire.378
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t423 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t424 = load i64, ptr %local.bin.381
  %t425 = icmp eq i64 %t424, 4
  %t426 = zext i1 %t425 to i64
  %t427 = icmp ne i64 %t426, 0
  br i1 %t427, label %then24, label %else24
then24:
  %t428 = load i64, ptr %local.d4
  store i64 %t428, ptr %local.desire.378
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t429 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t430 = load i64, ptr %local.bin.381
  %t431 = icmp eq i64 %t430, 5
  %t432 = zext i1 %t431 to i64
  %t433 = icmp ne i64 %t432, 0
  br i1 %t433, label %then25, label %else25
then25:
  %t434 = load i64, ptr %local.d5
  store i64 %t434, ptr %local.desire.378
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t435 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t436 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.61)
  %t437 = load i64, ptr %local.conf.377
  %t438 = load i64, ptr %local.desire.378
  %t439 = call i64 @"sx_f64_sub"(i64 %t437, i64 %t438)
  %t440 = call i64 @"abs_f64"(i64 %t439)
  %t441 = call i64 @"sx_f64_sub"(i64 %t436, i64 %t440)
  store i64 %t441, ptr %local.alignment.379
  %t442 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.62)
  %t443 = load i64, ptr %local.coupling
  %t444 = load i64, ptr %local.alignment.379
  %t445 = call i64 @"sx_f64_mul"(i64 %t443, i64 %t444)
  %t446 = call i64 @"sx_f64_add"(i64 %t442, i64 %t445)
  store i64 %t446, ptr %local.boost.380
  %t447 = load i64, ptr %local.rng.375
  %t448 = call i64 @"lcg_next"(i64 %t447)
  store i64 %t448, ptr %local.rng.375
  %t449 = load i64, ptr %local.rng.375
  %t450 = call i64 @"lcg_f64"(i64 %t449)
  %t451 = load i64, ptr %local.true_val
  %t452 = call i64 @"sx_f64_lt"(i64 %t450, i64 %t451)
  %t453 = icmp ne i64 %t452, 0
  br i1 %t453, label %then26, label %else26
then26:
  %t454 = load i64, ptr %local.al.373
  %t455 = load i64, ptr %local.boost.380
  %t456 = call i64 @"sx_f64_add"(i64 %t454, i64 %t455)
  store i64 %t456, ptr %local.al.373
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t457 = load i64, ptr %local.be.374
  %t458 = load i64, ptr %local.boost.380
  %t459 = call i64 @"sx_f64_add"(i64 %t457, i64 %t458)
  store i64 %t459, ptr %local.be.374
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t460 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t461 = load i64, ptr %local.step.376
  %t462 = add i64 %t461, 1
  store i64 %t462, ptr %local.step.376
  br label %loop19
endloop19:
  %t463 = load i64, ptr %local.al.373
  %t464 = load i64, ptr %local.be.374
  %t465 = call i64 @"beta_mean"(i64 %t463, i64 %t464)
  store i64 %t465, ptr %local.posterior.382
  %t466 = load i64, ptr %local.posterior.382
  %t467 = load i64, ptr %local.true_val
  %t468 = call i64 @"sx_f64_sub"(i64 %t466, i64 %t467)
  store i64 %t468, ptr %local.err.383
  %t469 = load i64, ptr %local.err.383
  %t470 = load i64, ptr %local.err.383
  %t471 = call i64 @"sx_f64_mul"(i64 %t469, i64 %t470)
  ret i64 %t471
}

define i64 @"avg_binned"(i64 %d0, i64 %d1, i64 %d2, i64 %d3, i64 %d4, i64 %d5, i64 %coupling, i64 %true_val) nounwind {
entry:
  %local.l1.472 = alloca i64
  %local.l2.473 = alloca i64
  %local.l3.474 = alloca i64
  %local.d0 = alloca i64
  store i64 %d0, ptr %local.d0
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %local.d4 = alloca i64
  store i64 %d4, ptr %local.d4
  %local.d5 = alloca i64
  store i64 %d5, ptr %local.d5
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %t475 = load i64, ptr %local.d0
  %t476 = load i64, ptr %local.d1
  %t477 = load i64, ptr %local.d2
  %t478 = load i64, ptr %local.d3
  %t479 = load i64, ptr %local.d4
  %t480 = load i64, ptr %local.d5
  %t481 = load i64, ptr %local.coupling
  %t482 = load i64, ptr %local.true_val
  %t483 = call i64 @"train_binned"(i64 %t475, i64 %t476, i64 %t477, i64 %t478, i64 %t479, i64 %t480, i64 %t481, i64 %t482, i64 42)
  store i64 %t483, ptr %local.l1.472
  %t484 = load i64, ptr %local.d0
  %t485 = load i64, ptr %local.d1
  %t486 = load i64, ptr %local.d2
  %t487 = load i64, ptr %local.d3
  %t488 = load i64, ptr %local.d4
  %t489 = load i64, ptr %local.d5
  %t490 = load i64, ptr %local.coupling
  %t491 = load i64, ptr %local.true_val
  %t492 = call i64 @"train_binned"(i64 %t484, i64 %t485, i64 %t486, i64 %t487, i64 %t488, i64 %t489, i64 %t490, i64 %t491, i64 137)
  store i64 %t492, ptr %local.l2.473
  %t493 = load i64, ptr %local.d0
  %t494 = load i64, ptr %local.d1
  %t495 = load i64, ptr %local.d2
  %t496 = load i64, ptr %local.d3
  %t497 = load i64, ptr %local.d4
  %t498 = load i64, ptr %local.d5
  %t499 = load i64, ptr %local.coupling
  %t500 = load i64, ptr %local.true_val
  %t501 = call i64 @"train_binned"(i64 %t493, i64 %t494, i64 %t495, i64 %t496, i64 %t497, i64 %t498, i64 %t499, i64 %t500, i64 999)
  store i64 %t501, ptr %local.l3.474
  %t502 = load i64, ptr %local.l1.472
  %t503 = load i64, ptr %local.l2.473
  %t504 = call i64 @"sx_f64_add"(i64 %t502, i64 %t503)
  %t505 = load i64, ptr %local.l3.474
  %t506 = call i64 @"sx_f64_add"(i64 %t504, i64 %t505)
  %t507 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.63)
  %t508 = call i64 @"sx_f64_div"(i64 %t506, i64 %t507)
  ret i64 %t508
}

define i64 @"mg_bin"(i64 %d0, i64 %d1, i64 %d2, i64 %d3, i64 %d4, i64 %d5, i64 %coupling, i64 %true_val, i64 %which) nounwind {
entry:
  %local.h.509 = alloca i64
  %local.d0p.510 = alloca i64
  %local.d1p.511 = alloca i64
  %local.d2p.512 = alloca i64
  %local.d3p.513 = alloca i64
  %local.d4p.514 = alloca i64
  %local.d5p.515 = alloca i64
  %local.d0m.516 = alloca i64
  %local.d1m.517 = alloca i64
  %local.d2m.518 = alloca i64
  %local.d3m.519 = alloca i64
  %local.d4m.520 = alloca i64
  %local.d5m.521 = alloca i64
  %local.lp.522 = alloca i64
  %local.lm.523 = alloca i64
  %local.d0 = alloca i64
  store i64 %d0, ptr %local.d0
  %local.d1 = alloca i64
  store i64 %d1, ptr %local.d1
  %local.d2 = alloca i64
  store i64 %d2, ptr %local.d2
  %local.d3 = alloca i64
  store i64 %d3, ptr %local.d3
  %local.d4 = alloca i64
  store i64 %d4, ptr %local.d4
  %local.d5 = alloca i64
  store i64 %d5, ptr %local.d5
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t524 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.64)
  store i64 %t524, ptr %local.h.509
  %t525 = load i64, ptr %local.d0
  store i64 %t525, ptr %local.d0p.510
  %t526 = load i64, ptr %local.d1
  store i64 %t526, ptr %local.d1p.511
  %t527 = load i64, ptr %local.d2
  store i64 %t527, ptr %local.d2p.512
  %t528 = load i64, ptr %local.d3
  store i64 %t528, ptr %local.d3p.513
  %t529 = load i64, ptr %local.d4
  store i64 %t529, ptr %local.d4p.514
  %t530 = load i64, ptr %local.d5
  store i64 %t530, ptr %local.d5p.515
  %t531 = load i64, ptr %local.d0
  store i64 %t531, ptr %local.d0m.516
  %t532 = load i64, ptr %local.d1
  store i64 %t532, ptr %local.d1m.517
  %t533 = load i64, ptr %local.d2
  store i64 %t533, ptr %local.d2m.518
  %t534 = load i64, ptr %local.d3
  store i64 %t534, ptr %local.d3m.519
  %t535 = load i64, ptr %local.d4
  store i64 %t535, ptr %local.d4m.520
  %t536 = load i64, ptr %local.d5
  store i64 %t536, ptr %local.d5m.521
  %t537 = load i64, ptr %local.which
  %t538 = icmp eq i64 %t537, 0
  %t539 = zext i1 %t538 to i64
  %t540 = icmp ne i64 %t539, 0
  br i1 %t540, label %then27, label %else27
then27:
  %t541 = load i64, ptr %local.d0
  %t542 = load i64, ptr %local.h.509
  %t543 = call i64 @"sx_f64_add"(i64 %t541, i64 %t542)
  store i64 %t543, ptr %local.d0p.510
  %t544 = load i64, ptr %local.d0
  %t545 = load i64, ptr %local.h.509
  %t546 = call i64 @"sx_f64_sub"(i64 %t544, i64 %t545)
  store i64 %t546, ptr %local.d0m.516
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t547 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t548 = load i64, ptr %local.which
  %t549 = icmp eq i64 %t548, 1
  %t550 = zext i1 %t549 to i64
  %t551 = icmp ne i64 %t550, 0
  br i1 %t551, label %then28, label %else28
then28:
  %t552 = load i64, ptr %local.d1
  %t553 = load i64, ptr %local.h.509
  %t554 = call i64 @"sx_f64_add"(i64 %t552, i64 %t553)
  store i64 %t554, ptr %local.d1p.511
  %t555 = load i64, ptr %local.d1
  %t556 = load i64, ptr %local.h.509
  %t557 = call i64 @"sx_f64_sub"(i64 %t555, i64 %t556)
  store i64 %t557, ptr %local.d1m.517
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t558 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t559 = load i64, ptr %local.which
  %t560 = icmp eq i64 %t559, 2
  %t561 = zext i1 %t560 to i64
  %t562 = icmp ne i64 %t561, 0
  br i1 %t562, label %then29, label %else29
then29:
  %t563 = load i64, ptr %local.d2
  %t564 = load i64, ptr %local.h.509
  %t565 = call i64 @"sx_f64_add"(i64 %t563, i64 %t564)
  store i64 %t565, ptr %local.d2p.512
  %t566 = load i64, ptr %local.d2
  %t567 = load i64, ptr %local.h.509
  %t568 = call i64 @"sx_f64_sub"(i64 %t566, i64 %t567)
  store i64 %t568, ptr %local.d2m.518
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t569 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t570 = load i64, ptr %local.which
  %t571 = icmp eq i64 %t570, 3
  %t572 = zext i1 %t571 to i64
  %t573 = icmp ne i64 %t572, 0
  br i1 %t573, label %then30, label %else30
then30:
  %t574 = load i64, ptr %local.d3
  %t575 = load i64, ptr %local.h.509
  %t576 = call i64 @"sx_f64_add"(i64 %t574, i64 %t575)
  store i64 %t576, ptr %local.d3p.513
  %t577 = load i64, ptr %local.d3
  %t578 = load i64, ptr %local.h.509
  %t579 = call i64 @"sx_f64_sub"(i64 %t577, i64 %t578)
  store i64 %t579, ptr %local.d3m.519
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t580 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t581 = load i64, ptr %local.which
  %t582 = icmp eq i64 %t581, 4
  %t583 = zext i1 %t582 to i64
  %t584 = icmp ne i64 %t583, 0
  br i1 %t584, label %then31, label %else31
then31:
  %t585 = load i64, ptr %local.d4
  %t586 = load i64, ptr %local.h.509
  %t587 = call i64 @"sx_f64_add"(i64 %t585, i64 %t586)
  store i64 %t587, ptr %local.d4p.514
  %t588 = load i64, ptr %local.d4
  %t589 = load i64, ptr %local.h.509
  %t590 = call i64 @"sx_f64_sub"(i64 %t588, i64 %t589)
  store i64 %t590, ptr %local.d4m.520
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t591 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t592 = load i64, ptr %local.which
  %t593 = icmp eq i64 %t592, 5
  %t594 = zext i1 %t593 to i64
  %t595 = icmp ne i64 %t594, 0
  br i1 %t595, label %then32, label %else32
then32:
  %t596 = load i64, ptr %local.d5
  %t597 = load i64, ptr %local.h.509
  %t598 = call i64 @"sx_f64_add"(i64 %t596, i64 %t597)
  store i64 %t598, ptr %local.d5p.515
  %t599 = load i64, ptr %local.d5
  %t600 = load i64, ptr %local.h.509
  %t601 = call i64 @"sx_f64_sub"(i64 %t599, i64 %t600)
  store i64 %t601, ptr %local.d5m.521
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t602 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t603 = load i64, ptr %local.d0p.510
  %t604 = load i64, ptr %local.d1p.511
  %t605 = load i64, ptr %local.d2p.512
  %t606 = load i64, ptr %local.d3p.513
  %t607 = load i64, ptr %local.d4p.514
  %t608 = load i64, ptr %local.d5p.515
  %t609 = load i64, ptr %local.coupling
  %t610 = load i64, ptr %local.true_val
  %t611 = call i64 @"avg_binned"(i64 %t603, i64 %t604, i64 %t605, i64 %t606, i64 %t607, i64 %t608, i64 %t609, i64 %t610)
  store i64 %t611, ptr %local.lp.522
  %t612 = load i64, ptr %local.d0m.516
  %t613 = load i64, ptr %local.d1m.517
  %t614 = load i64, ptr %local.d2m.518
  %t615 = load i64, ptr %local.d3m.519
  %t616 = load i64, ptr %local.d4m.520
  %t617 = load i64, ptr %local.d5m.521
  %t618 = load i64, ptr %local.coupling
  %t619 = load i64, ptr %local.true_val
  %t620 = call i64 @"avg_binned"(i64 %t612, i64 %t613, i64 %t614, i64 %t615, i64 %t616, i64 %t617, i64 %t618, i64 %t619)
  store i64 %t620, ptr %local.lm.523
  %t621 = load i64, ptr %local.lp.522
  %t622 = load i64, ptr %local.lm.523
  %t623 = call i64 @"sx_f64_sub"(i64 %t621, i64 %t622)
  %t624 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.65)
  %t625 = load i64, ptr %local.h.509
  %t626 = call i64 @"sx_f64_mul"(i64 %t624, i64 %t625)
  %t627 = call i64 @"sx_f64_div"(i64 %t623, i64 %t626)
  ret i64 %t627
}

define i64 @"test_learnable_schedule"() nounwind {
entry:
  %local.true_val.628 = alloca i64
  %local.coupling.629 = alloca i64
  %local.lr.630 = alloca i64
  %local.d0.631 = alloca i64
  %local.d1.632 = alloca i64
  %local.d2.633 = alloca i64
  %local.d3.634 = alloca i64
  %local.d4.635 = alloca i64
  %local.d5.636 = alloca i64
  %local.mg.637 = alloca i64
  %local.cycle.638 = alloca i64
  %local.loss_init.639 = alloca i64
  %local.loss_learned.640 = alloca i64
  %local.early_avg.641 = alloca i64
  %local.late_avg.642 = alloca i64
  %t643 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.66)
  %t644 = ptrtoint ptr %t643 to i64
  %t645 = inttoptr i64 %t644 to ptr
  call void @intrinsic_println(ptr %t645)
  %t646 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.67)
  %t647 = ptrtoint ptr %t646 to i64
  %t648 = inttoptr i64 %t647 to ptr
  call void @intrinsic_println(ptr %t648)
  %t649 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.68)
  %t650 = ptrtoint ptr %t649 to i64
  %t651 = inttoptr i64 %t650 to ptr
  call void @intrinsic_println(ptr %t651)
  %t652 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.69)
  %t653 = ptrtoint ptr %t652 to i64
  %t654 = inttoptr i64 %t653 to ptr
  call void @intrinsic_println(ptr %t654)
  %t655 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.70)
  store i64 %t655, ptr %local.true_val.628
  %t656 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.71)
  store i64 %t656, ptr %local.coupling.629
  %t657 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.72)
  store i64 %t657, ptr %local.lr.630
  %t658 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.73)
  store i64 %t658, ptr %local.d0.631
  %t659 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.74)
  store i64 %t659, ptr %local.d1.632
  %t660 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.75)
  store i64 %t660, ptr %local.d2.633
  %t661 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.76)
  store i64 %t661, ptr %local.d3.634
  %t662 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.77)
  store i64 %t662, ptr %local.d4.635
  %t663 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.78)
  store i64 %t663, ptr %local.d5.636
  %t664 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.79)
  store i64 %t664, ptr %local.mg.637
  store i64 0, ptr %local.cycle.638
  %t665 = load i64, ptr %local.d0.631
  %t666 = load i64, ptr %local.d1.632
  %t667 = load i64, ptr %local.d2.633
  %t668 = load i64, ptr %local.d3.634
  %t669 = load i64, ptr %local.d4.635
  %t670 = load i64, ptr %local.d5.636
  %t671 = load i64, ptr %local.coupling.629
  %t672 = load i64, ptr %local.true_val.628
  %t673 = call i64 @"avg_binned"(i64 %t665, i64 %t666, i64 %t667, i64 %t668, i64 %t669, i64 %t670, i64 %t671, i64 %t672)
  store i64 %t673, ptr %local.loss_init.639
  %t674 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.80)
  %t675 = ptrtoint ptr %t674 to i64
  %t676 = inttoptr i64 %t675 to ptr
  call void @intrinsic_print(ptr %t676)
  %t677 = load i64, ptr %local.loss_init.639
  %t678 = call i64 @"print_f64"(i64 %t677)
  %t679 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.81)
  %t680 = ptrtoint ptr %t679 to i64
  %t681 = inttoptr i64 %t680 to ptr
  call void @intrinsic_println(ptr %t681)
  br label %loop33
loop33:
  %t682 = load i64, ptr %local.cycle.638
  %t683 = icmp slt i64 %t682, 50
  %t684 = zext i1 %t683 to i64
  %t685 = icmp ne i64 %t684, 0
  br i1 %t685, label %body33, label %endloop33
body33:
  %t686 = load i64, ptr %local.d0.631
  %t687 = load i64, ptr %local.d1.632
  %t688 = load i64, ptr %local.d2.633
  %t689 = load i64, ptr %local.d3.634
  %t690 = load i64, ptr %local.d4.635
  %t691 = load i64, ptr %local.d5.636
  %t692 = load i64, ptr %local.coupling.629
  %t693 = load i64, ptr %local.true_val.628
  %t694 = call i64 @"mg_bin"(i64 %t686, i64 %t687, i64 %t688, i64 %t689, i64 %t690, i64 %t691, i64 %t692, i64 %t693, i64 0)
  store i64 %t694, ptr %local.mg.637
  %t695 = load i64, ptr %local.d0.631
  %t696 = load i64, ptr %local.lr.630
  %t697 = load i64, ptr %local.mg.637
  %t698 = call i64 @"sx_f64_mul"(i64 %t696, i64 %t697)
  %t699 = call i64 @"sx_f64_sub"(i64 %t695, i64 %t698)
  %t700 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.82)
  %t701 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.83)
  %t702 = call i64 @"clamp"(i64 %t699, i64 %t700, i64 %t701)
  store i64 %t702, ptr %local.d0.631
  %t703 = load i64, ptr %local.d0.631
  %t704 = load i64, ptr %local.d1.632
  %t705 = load i64, ptr %local.d2.633
  %t706 = load i64, ptr %local.d3.634
  %t707 = load i64, ptr %local.d4.635
  %t708 = load i64, ptr %local.d5.636
  %t709 = load i64, ptr %local.coupling.629
  %t710 = load i64, ptr %local.true_val.628
  %t711 = call i64 @"mg_bin"(i64 %t703, i64 %t704, i64 %t705, i64 %t706, i64 %t707, i64 %t708, i64 %t709, i64 %t710, i64 1)
  store i64 %t711, ptr %local.mg.637
  %t712 = load i64, ptr %local.d1.632
  %t713 = load i64, ptr %local.lr.630
  %t714 = load i64, ptr %local.mg.637
  %t715 = call i64 @"sx_f64_mul"(i64 %t713, i64 %t714)
  %t716 = call i64 @"sx_f64_sub"(i64 %t712, i64 %t715)
  %t717 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.84)
  %t718 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.85)
  %t719 = call i64 @"clamp"(i64 %t716, i64 %t717, i64 %t718)
  store i64 %t719, ptr %local.d1.632
  %t720 = load i64, ptr %local.d0.631
  %t721 = load i64, ptr %local.d1.632
  %t722 = load i64, ptr %local.d2.633
  %t723 = load i64, ptr %local.d3.634
  %t724 = load i64, ptr %local.d4.635
  %t725 = load i64, ptr %local.d5.636
  %t726 = load i64, ptr %local.coupling.629
  %t727 = load i64, ptr %local.true_val.628
  %t728 = call i64 @"mg_bin"(i64 %t720, i64 %t721, i64 %t722, i64 %t723, i64 %t724, i64 %t725, i64 %t726, i64 %t727, i64 2)
  store i64 %t728, ptr %local.mg.637
  %t729 = load i64, ptr %local.d2.633
  %t730 = load i64, ptr %local.lr.630
  %t731 = load i64, ptr %local.mg.637
  %t732 = call i64 @"sx_f64_mul"(i64 %t730, i64 %t731)
  %t733 = call i64 @"sx_f64_sub"(i64 %t729, i64 %t732)
  %t734 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.86)
  %t735 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.87)
  %t736 = call i64 @"clamp"(i64 %t733, i64 %t734, i64 %t735)
  store i64 %t736, ptr %local.d2.633
  %t737 = load i64, ptr %local.d0.631
  %t738 = load i64, ptr %local.d1.632
  %t739 = load i64, ptr %local.d2.633
  %t740 = load i64, ptr %local.d3.634
  %t741 = load i64, ptr %local.d4.635
  %t742 = load i64, ptr %local.d5.636
  %t743 = load i64, ptr %local.coupling.629
  %t744 = load i64, ptr %local.true_val.628
  %t745 = call i64 @"mg_bin"(i64 %t737, i64 %t738, i64 %t739, i64 %t740, i64 %t741, i64 %t742, i64 %t743, i64 %t744, i64 3)
  store i64 %t745, ptr %local.mg.637
  %t746 = load i64, ptr %local.d3.634
  %t747 = load i64, ptr %local.lr.630
  %t748 = load i64, ptr %local.mg.637
  %t749 = call i64 @"sx_f64_mul"(i64 %t747, i64 %t748)
  %t750 = call i64 @"sx_f64_sub"(i64 %t746, i64 %t749)
  %t751 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.88)
  %t752 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.89)
  %t753 = call i64 @"clamp"(i64 %t750, i64 %t751, i64 %t752)
  store i64 %t753, ptr %local.d3.634
  %t754 = load i64, ptr %local.d0.631
  %t755 = load i64, ptr %local.d1.632
  %t756 = load i64, ptr %local.d2.633
  %t757 = load i64, ptr %local.d3.634
  %t758 = load i64, ptr %local.d4.635
  %t759 = load i64, ptr %local.d5.636
  %t760 = load i64, ptr %local.coupling.629
  %t761 = load i64, ptr %local.true_val.628
  %t762 = call i64 @"mg_bin"(i64 %t754, i64 %t755, i64 %t756, i64 %t757, i64 %t758, i64 %t759, i64 %t760, i64 %t761, i64 4)
  store i64 %t762, ptr %local.mg.637
  %t763 = load i64, ptr %local.d4.635
  %t764 = load i64, ptr %local.lr.630
  %t765 = load i64, ptr %local.mg.637
  %t766 = call i64 @"sx_f64_mul"(i64 %t764, i64 %t765)
  %t767 = call i64 @"sx_f64_sub"(i64 %t763, i64 %t766)
  %t768 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.90)
  %t769 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.91)
  %t770 = call i64 @"clamp"(i64 %t767, i64 %t768, i64 %t769)
  store i64 %t770, ptr %local.d4.635
  %t771 = load i64, ptr %local.d0.631
  %t772 = load i64, ptr %local.d1.632
  %t773 = load i64, ptr %local.d2.633
  %t774 = load i64, ptr %local.d3.634
  %t775 = load i64, ptr %local.d4.635
  %t776 = load i64, ptr %local.d5.636
  %t777 = load i64, ptr %local.coupling.629
  %t778 = load i64, ptr %local.true_val.628
  %t779 = call i64 @"mg_bin"(i64 %t771, i64 %t772, i64 %t773, i64 %t774, i64 %t775, i64 %t776, i64 %t777, i64 %t778, i64 5)
  store i64 %t779, ptr %local.mg.637
  %t780 = load i64, ptr %local.d5.636
  %t781 = load i64, ptr %local.lr.630
  %t782 = load i64, ptr %local.mg.637
  %t783 = call i64 @"sx_f64_mul"(i64 %t781, i64 %t782)
  %t784 = call i64 @"sx_f64_sub"(i64 %t780, i64 %t783)
  %t785 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.92)
  %t786 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.93)
  %t787 = call i64 @"clamp"(i64 %t784, i64 %t785, i64 %t786)
  store i64 %t787, ptr %local.d5.636
  %t788 = load i64, ptr %local.cycle.638
  %t789 = add i64 %t788, 1
  store i64 %t789, ptr %local.cycle.638
  br label %loop33
endloop33:
  %t790 = load i64, ptr %local.d0.631
  %t791 = load i64, ptr %local.d1.632
  %t792 = load i64, ptr %local.d2.633
  %t793 = load i64, ptr %local.d3.634
  %t794 = load i64, ptr %local.d4.635
  %t795 = load i64, ptr %local.d5.636
  %t796 = load i64, ptr %local.coupling.629
  %t797 = load i64, ptr %local.true_val.628
  %t798 = call i64 @"avg_binned"(i64 %t790, i64 %t791, i64 %t792, i64 %t793, i64 %t794, i64 %t795, i64 %t796, i64 %t797)
  store i64 %t798, ptr %local.loss_learned.640
  %t799 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.94)
  %t800 = ptrtoint ptr %t799 to i64
  %t801 = inttoptr i64 %t800 to ptr
  call void @intrinsic_print(ptr %t801)
  %t802 = load i64, ptr %local.loss_learned.640
  %t803 = call i64 @"print_f64"(i64 %t802)
  %t804 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.95)
  %t805 = ptrtoint ptr %t804 to i64
  %t806 = inttoptr i64 %t805 to ptr
  call void @intrinsic_println(ptr %t806)
  %t807 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.96)
  %t808 = ptrtoint ptr %t807 to i64
  %t809 = inttoptr i64 %t808 to ptr
  call void @intrinsic_println(ptr %t809)
  %t810 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.97)
  %t811 = ptrtoint ptr %t810 to i64
  %t812 = inttoptr i64 %t811 to ptr
  call void @intrinsic_println(ptr %t812)
  %t813 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.98)
  %t814 = ptrtoint ptr %t813 to i64
  %t815 = inttoptr i64 %t814 to ptr
  call void @intrinsic_print(ptr %t815)
  %t816 = load i64, ptr %local.d0.631
  %t817 = call i64 @"print_f64"(i64 %t816)
  %t818 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.99)
  %t819 = ptrtoint ptr %t818 to i64
  %t820 = inttoptr i64 %t819 to ptr
  call void @intrinsic_println(ptr %t820)
  %t821 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.100)
  %t822 = ptrtoint ptr %t821 to i64
  %t823 = inttoptr i64 %t822 to ptr
  call void @intrinsic_print(ptr %t823)
  %t824 = load i64, ptr %local.d1.632
  %t825 = call i64 @"print_f64"(i64 %t824)
  %t826 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.101)
  %t827 = ptrtoint ptr %t826 to i64
  %t828 = inttoptr i64 %t827 to ptr
  call void @intrinsic_println(ptr %t828)
  %t829 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.102)
  %t830 = ptrtoint ptr %t829 to i64
  %t831 = inttoptr i64 %t830 to ptr
  call void @intrinsic_print(ptr %t831)
  %t832 = load i64, ptr %local.d2.633
  %t833 = call i64 @"print_f64"(i64 %t832)
  %t834 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.103)
  %t835 = ptrtoint ptr %t834 to i64
  %t836 = inttoptr i64 %t835 to ptr
  call void @intrinsic_println(ptr %t836)
  %t837 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.104)
  %t838 = ptrtoint ptr %t837 to i64
  %t839 = inttoptr i64 %t838 to ptr
  call void @intrinsic_print(ptr %t839)
  %t840 = load i64, ptr %local.d3.634
  %t841 = call i64 @"print_f64"(i64 %t840)
  %t842 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.105)
  %t843 = ptrtoint ptr %t842 to i64
  %t844 = inttoptr i64 %t843 to ptr
  call void @intrinsic_println(ptr %t844)
  %t845 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.106)
  %t846 = ptrtoint ptr %t845 to i64
  %t847 = inttoptr i64 %t846 to ptr
  call void @intrinsic_print(ptr %t847)
  %t848 = load i64, ptr %local.d4.635
  %t849 = call i64 @"print_f64"(i64 %t848)
  %t850 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.107)
  %t851 = ptrtoint ptr %t850 to i64
  %t852 = inttoptr i64 %t851 to ptr
  call void @intrinsic_println(ptr %t852)
  %t853 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.108)
  %t854 = ptrtoint ptr %t853 to i64
  %t855 = inttoptr i64 %t854 to ptr
  call void @intrinsic_print(ptr %t855)
  %t856 = load i64, ptr %local.d5.636
  %t857 = call i64 @"print_f64"(i64 %t856)
  %t858 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.109)
  %t859 = ptrtoint ptr %t858 to i64
  %t860 = inttoptr i64 %t859 to ptr
  call void @intrinsic_println(ptr %t860)
  %t861 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.110)
  %t862 = ptrtoint ptr %t861 to i64
  %t863 = inttoptr i64 %t862 to ptr
  call void @intrinsic_println(ptr %t863)
  %t864 = load i64, ptr %local.d0.631
  %t865 = load i64, ptr %local.d1.632
  %t866 = call i64 @"sx_f64_add"(i64 %t864, i64 %t865)
  %t867 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.111)
  %t868 = call i64 @"sx_f64_div"(i64 %t866, i64 %t867)
  store i64 %t868, ptr %local.early_avg.641
  %t869 = load i64, ptr %local.d4.635
  %t870 = load i64, ptr %local.d5.636
  %t871 = call i64 @"sx_f64_add"(i64 %t869, i64 %t870)
  %t872 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.112)
  %t873 = call i64 @"sx_f64_div"(i64 %t871, i64 %t872)
  store i64 %t873, ptr %local.late_avg.642
  %t874 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.113)
  %t875 = ptrtoint ptr %t874 to i64
  %t876 = inttoptr i64 %t875 to ptr
  call void @intrinsic_print(ptr %t876)
  %t877 = load i64, ptr %local.early_avg.641
  %t878 = call i64 @"print_f64"(i64 %t877)
  %t879 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.114)
  %t880 = ptrtoint ptr %t879 to i64
  %t881 = inttoptr i64 %t880 to ptr
  call void @intrinsic_println(ptr %t881)
  %t882 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.115)
  %t883 = ptrtoint ptr %t882 to i64
  %t884 = inttoptr i64 %t883 to ptr
  call void @intrinsic_print(ptr %t884)
  %t885 = load i64, ptr %local.late_avg.642
  %t886 = call i64 @"print_f64"(i64 %t885)
  %t887 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.116)
  %t888 = ptrtoint ptr %t887 to i64
  %t889 = inttoptr i64 %t888 to ptr
  call void @intrinsic_println(ptr %t889)
  %t890 = load i64, ptr %local.late_avg.642
  %t891 = load i64, ptr %local.early_avg.641
  %t892 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.117)
  %t893 = call i64 @"sx_f64_add"(i64 %t891, i64 %t892)
  %t894 = call i64 @"sx_f64_gt"(i64 %t890, i64 %t893)
  %t895 = icmp ne i64 %t894, 0
  br i1 %t895, label %then34, label %else34
then34:
  %t896 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.118)
  %t897 = ptrtoint ptr %t896 to i64
  %t898 = inttoptr i64 %t897 to ptr
  call void @intrinsic_println(ptr %t898)
  %t899 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.119)
  %t900 = ptrtoint ptr %t899 to i64
  %t901 = inttoptr i64 %t900 to ptr
  call void @intrinsic_println(ptr %t901)
  br label %then34_end
then34_end:
  br label %endif34
else34:
  %t902 = load i64, ptr %local.early_avg.641
  %t903 = load i64, ptr %local.late_avg.642
  %t904 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.120)
  %t905 = call i64 @"sx_f64_add"(i64 %t903, i64 %t904)
  %t906 = call i64 @"sx_f64_gt"(i64 %t902, i64 %t905)
  %t907 = icmp ne i64 %t906, 0
  br i1 %t907, label %then35, label %else35
then35:
  %t908 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.121)
  %t909 = ptrtoint ptr %t908 to i64
  %t910 = inttoptr i64 %t909 to ptr
  call void @intrinsic_println(ptr %t910)
  %t911 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.122)
  %t912 = ptrtoint ptr %t911 to i64
  %t913 = inttoptr i64 %t912 to ptr
  call void @intrinsic_println(ptr %t913)
  br label %then35_end
then35_end:
  br label %endif35
else35:
  %t914 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.123)
  %t915 = ptrtoint ptr %t914 to i64
  %t916 = inttoptr i64 %t915 to ptr
  call void @intrinsic_println(ptr %t916)
  %t917 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.124)
  %t918 = ptrtoint ptr %t917 to i64
  %t919 = inttoptr i64 %t918 to ptr
  call void @intrinsic_println(ptr %t919)
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t920 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t921 = phi i64 [ 0, %then34_end ], [ %t920, %else34_end ]
  %t922 = load i64, ptr %local.loss_learned.640
  %t923 = load i64, ptr %local.loss_init.639
  %t924 = call i64 @"sx_f64_lt"(i64 %t922, i64 %t923)
  %t925 = icmp ne i64 %t924, 0
  br i1 %t925, label %then36, label %else36
then36:
  %t926 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.125)
  %t927 = ptrtoint ptr %t926 to i64
  %t928 = inttoptr i64 %t927 to ptr
  call void @intrinsic_println(ptr %t928)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t929 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t930 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.126)
  %t931 = ptrtoint ptr %t930 to i64
  %t932 = inttoptr i64 %t931 to ptr
  call void @intrinsic_println(ptr %t932)
  ret i64 0
}

define i64 @"train_agent_snapshot"(i64 %desire, i64 %coupling, i64 %true_val, i64 %observations, i64 %seed) nounwind {
entry:
  %local.al.933 = alloca i64
  %local.be.934 = alloca i64
  %local.rng.935 = alloca i64
  %local.step.936 = alloca i64
  %local.conf.937 = alloca i64
  %local.alignment.938 = alloca i64
  %local.boost.939 = alloca i64
  %local.posterior.940 = alloca i64
  %local.err.941 = alloca i64
  %local.desire = alloca i64
  store i64 %desire, ptr %local.desire
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.observations = alloca i64
  store i64 %observations, ptr %local.observations
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t942 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.127)
  store i64 %t942, ptr %local.al.933
  %t943 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.128)
  store i64 %t943, ptr %local.be.934
  %t944 = load i64, ptr %local.seed
  store i64 %t944, ptr %local.rng.935
  store i64 0, ptr %local.step.936
  %t945 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.129)
  store i64 %t945, ptr %local.conf.937
  %t946 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.130)
  store i64 %t946, ptr %local.alignment.938
  %t947 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.131)
  store i64 %t947, ptr %local.boost.939
  br label %loop37
loop37:
  %t948 = load i64, ptr %local.step.936
  %t949 = load i64, ptr %local.observations
  %t950 = icmp slt i64 %t948, %t949
  %t951 = zext i1 %t950 to i64
  %t952 = icmp ne i64 %t951, 0
  br i1 %t952, label %body37, label %endloop37
body37:
  %t953 = load i64, ptr %local.al.933
  %t954 = load i64, ptr %local.be.934
  %t955 = call i64 @"beta_mean"(i64 %t953, i64 %t954)
  store i64 %t955, ptr %local.conf.937
  %t956 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.132)
  %t957 = load i64, ptr %local.conf.937
  %t958 = load i64, ptr %local.desire
  %t959 = call i64 @"sx_f64_sub"(i64 %t957, i64 %t958)
  %t960 = call i64 @"abs_f64"(i64 %t959)
  %t961 = call i64 @"sx_f64_sub"(i64 %t956, i64 %t960)
  store i64 %t961, ptr %local.alignment.938
  %t962 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.133)
  %t963 = load i64, ptr %local.coupling
  %t964 = load i64, ptr %local.alignment.938
  %t965 = call i64 @"sx_f64_mul"(i64 %t963, i64 %t964)
  %t966 = call i64 @"sx_f64_add"(i64 %t962, i64 %t965)
  store i64 %t966, ptr %local.boost.939
  %t967 = load i64, ptr %local.rng.935
  %t968 = call i64 @"lcg_next"(i64 %t967)
  store i64 %t968, ptr %local.rng.935
  %t969 = load i64, ptr %local.rng.935
  %t970 = call i64 @"lcg_f64"(i64 %t969)
  %t971 = load i64, ptr %local.true_val
  %t972 = call i64 @"sx_f64_lt"(i64 %t970, i64 %t971)
  %t973 = icmp ne i64 %t972, 0
  br i1 %t973, label %then38, label %else38
then38:
  %t974 = load i64, ptr %local.al.933
  %t975 = load i64, ptr %local.boost.939
  %t976 = call i64 @"sx_f64_add"(i64 %t974, i64 %t975)
  store i64 %t976, ptr %local.al.933
  br label %then38_end
then38_end:
  br label %endif38
else38:
  %t977 = load i64, ptr %local.be.934
  %t978 = load i64, ptr %local.boost.939
  %t979 = call i64 @"sx_f64_add"(i64 %t977, i64 %t978)
  store i64 %t979, ptr %local.be.934
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t980 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t981 = load i64, ptr %local.step.936
  %t982 = add i64 %t981, 1
  store i64 %t982, ptr %local.step.936
  br label %loop37
endloop37:
  %t983 = load i64, ptr %local.al.933
  %t984 = load i64, ptr %local.be.934
  %t985 = call i64 @"beta_mean"(i64 %t983, i64 %t984)
  store i64 %t985, ptr %local.posterior.940
  %t986 = load i64, ptr %local.posterior.940
  %t987 = load i64, ptr %local.true_val
  %t988 = call i64 @"sx_f64_sub"(i64 %t986, i64 %t987)
  store i64 %t988, ptr %local.err.941
  %t989 = load i64, ptr %local.err.941
  %t990 = call i64 @"abs_f64"(i64 %t989)
  ret i64 %t990
}

define i64 @"avg_agent_error"(i64 %desire, i64 %coupling, i64 %true_val, i64 %obs) nounwind {
entry:
  %local.e1.991 = alloca i64
  %local.e2.992 = alloca i64
  %local.e3.993 = alloca i64
  %local.e4.994 = alloca i64
  %local.e5.995 = alloca i64
  %local.desire = alloca i64
  store i64 %desire, ptr %local.desire
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t996 = load i64, ptr %local.desire
  %t997 = load i64, ptr %local.coupling
  %t998 = load i64, ptr %local.true_val
  %t999 = load i64, ptr %local.obs
  %t1000 = call i64 @"train_agent_snapshot"(i64 %t996, i64 %t997, i64 %t998, i64 %t999, i64 42)
  store i64 %t1000, ptr %local.e1.991
  %t1001 = load i64, ptr %local.desire
  %t1002 = load i64, ptr %local.coupling
  %t1003 = load i64, ptr %local.true_val
  %t1004 = load i64, ptr %local.obs
  %t1005 = call i64 @"train_agent_snapshot"(i64 %t1001, i64 %t1002, i64 %t1003, i64 %t1004, i64 137)
  store i64 %t1005, ptr %local.e2.992
  %t1006 = load i64, ptr %local.desire
  %t1007 = load i64, ptr %local.coupling
  %t1008 = load i64, ptr %local.true_val
  %t1009 = load i64, ptr %local.obs
  %t1010 = call i64 @"train_agent_snapshot"(i64 %t1006, i64 %t1007, i64 %t1008, i64 %t1009, i64 999)
  store i64 %t1010, ptr %local.e3.993
  %t1011 = load i64, ptr %local.desire
  %t1012 = load i64, ptr %local.coupling
  %t1013 = load i64, ptr %local.true_val
  %t1014 = load i64, ptr %local.obs
  %t1015 = call i64 @"train_agent_snapshot"(i64 %t1011, i64 %t1012, i64 %t1013, i64 %t1014, i64 2023)
  store i64 %t1015, ptr %local.e4.994
  %t1016 = load i64, ptr %local.desire
  %t1017 = load i64, ptr %local.coupling
  %t1018 = load i64, ptr %local.true_val
  %t1019 = load i64, ptr %local.obs
  %t1020 = call i64 @"train_agent_snapshot"(i64 %t1016, i64 %t1017, i64 %t1018, i64 %t1019, i64 7777)
  store i64 %t1020, ptr %local.e5.995
  %t1021 = load i64, ptr %local.e1.991
  %t1022 = load i64, ptr %local.e2.992
  %t1023 = call i64 @"sx_f64_add"(i64 %t1021, i64 %t1022)
  %t1024 = load i64, ptr %local.e3.993
  %t1025 = call i64 @"sx_f64_add"(i64 %t1023, i64 %t1024)
  %t1026 = load i64, ptr %local.e4.994
  %t1027 = call i64 @"sx_f64_add"(i64 %t1025, i64 %t1026)
  %t1028 = load i64, ptr %local.e5.995
  %t1029 = call i64 @"sx_f64_add"(i64 %t1027, i64 %t1028)
  %t1030 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.134)
  %t1031 = call i64 @"sx_f64_div"(i64 %t1029, i64 %t1030)
  ret i64 %t1031
}

define i64 @"test_adversarial_challenge"() nounwind {
entry:
  %local.true_val.1032 = alloca i64
  %local.trust_early.1033 = alloca i64
  %local.skept_early.1034 = alloca i64
  %local.none_early.1035 = alloca i64
  %local.trust_mid.1036 = alloca i64
  %local.skept_mid.1037 = alloca i64
  %local.none_mid.1038 = alloca i64
  %local.trust_late.1039 = alloca i64
  %local.skept_late.1040 = alloca i64
  %local.none_late.1041 = alloca i64
  %t1042 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.135)
  %t1043 = ptrtoint ptr %t1042 to i64
  %t1044 = inttoptr i64 %t1043 to ptr
  call void @intrinsic_println(ptr %t1044)
  %t1045 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.136)
  %t1046 = ptrtoint ptr %t1045 to i64
  %t1047 = inttoptr i64 %t1046 to ptr
  call void @intrinsic_println(ptr %t1047)
  %t1048 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.137)
  %t1049 = ptrtoint ptr %t1048 to i64
  %t1050 = inttoptr i64 %t1049 to ptr
  call void @intrinsic_println(ptr %t1050)
  %t1051 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.138)
  %t1052 = ptrtoint ptr %t1051 to i64
  %t1053 = inttoptr i64 %t1052 to ptr
  call void @intrinsic_println(ptr %t1053)
  %t1054 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.139)
  %t1055 = ptrtoint ptr %t1054 to i64
  %t1056 = inttoptr i64 %t1055 to ptr
  call void @intrinsic_println(ptr %t1056)
  %t1057 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.140)
  %t1058 = ptrtoint ptr %t1057 to i64
  %t1059 = inttoptr i64 %t1058 to ptr
  call void @intrinsic_println(ptr %t1059)
  %t1060 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.141)
  store i64 %t1060, ptr %local.true_val.1032
  %t1061 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.142)
  %t1062 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.143)
  %t1063 = load i64, ptr %local.true_val.1032
  %t1064 = call i64 @"avg_agent_error"(i64 %t1061, i64 %t1062, i64 %t1063, i64 20)
  store i64 %t1064, ptr %local.trust_early.1033
  %t1065 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.144)
  %t1066 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.145)
  %t1067 = load i64, ptr %local.true_val.1032
  %t1068 = call i64 @"avg_agent_error"(i64 %t1065, i64 %t1066, i64 %t1067, i64 20)
  store i64 %t1068, ptr %local.skept_early.1034
  %t1069 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.146)
  %t1070 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.147)
  %t1071 = load i64, ptr %local.true_val.1032
  %t1072 = call i64 @"avg_agent_error"(i64 %t1069, i64 %t1070, i64 %t1071, i64 20)
  store i64 %t1072, ptr %local.none_early.1035
  %t1073 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.148)
  %t1074 = ptrtoint ptr %t1073 to i64
  %t1075 = inttoptr i64 %t1074 to ptr
  call void @intrinsic_println(ptr %t1075)
  %t1076 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.149)
  %t1077 = ptrtoint ptr %t1076 to i64
  %t1078 = inttoptr i64 %t1077 to ptr
  call void @intrinsic_print(ptr %t1078)
  %t1079 = load i64, ptr %local.trust_early.1033
  %t1080 = call i64 @"print_f64"(i64 %t1079)
  %t1081 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.150)
  %t1082 = ptrtoint ptr %t1081 to i64
  %t1083 = inttoptr i64 %t1082 to ptr
  call void @intrinsic_println(ptr %t1083)
  %t1084 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.151)
  %t1085 = ptrtoint ptr %t1084 to i64
  %t1086 = inttoptr i64 %t1085 to ptr
  call void @intrinsic_print(ptr %t1086)
  %t1087 = load i64, ptr %local.skept_early.1034
  %t1088 = call i64 @"print_f64"(i64 %t1087)
  %t1089 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.152)
  %t1090 = ptrtoint ptr %t1089 to i64
  %t1091 = inttoptr i64 %t1090 to ptr
  call void @intrinsic_println(ptr %t1091)
  %t1092 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.153)
  %t1093 = ptrtoint ptr %t1092 to i64
  %t1094 = inttoptr i64 %t1093 to ptr
  call void @intrinsic_print(ptr %t1094)
  %t1095 = load i64, ptr %local.none_early.1035
  %t1096 = call i64 @"print_f64"(i64 %t1095)
  %t1097 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.154)
  %t1098 = ptrtoint ptr %t1097 to i64
  %t1099 = inttoptr i64 %t1098 to ptr
  call void @intrinsic_println(ptr %t1099)
  %t1100 = load i64, ptr %local.skept_early.1034
  %t1101 = load i64, ptr %local.trust_early.1033
  %t1102 = call i64 @"sx_f64_lt"(i64 %t1100, i64 %t1101)
  %t1103 = icmp ne i64 %t1102, 0
  br i1 %t1103, label %then39, label %else39
then39:
  %t1104 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.155)
  %t1105 = ptrtoint ptr %t1104 to i64
  %t1106 = inttoptr i64 %t1105 to ptr
  call void @intrinsic_println(ptr %t1106)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  %t1107 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.156)
  %t1108 = ptrtoint ptr %t1107 to i64
  %t1109 = inttoptr i64 %t1108 to ptr
  call void @intrinsic_println(ptr %t1109)
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1110 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1111 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.157)
  %t1112 = ptrtoint ptr %t1111 to i64
  %t1113 = inttoptr i64 %t1112 to ptr
  call void @intrinsic_println(ptr %t1113)
  %t1114 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.158)
  %t1115 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.159)
  %t1116 = load i64, ptr %local.true_val.1032
  %t1117 = call i64 @"avg_agent_error"(i64 %t1114, i64 %t1115, i64 %t1116, i64 80)
  store i64 %t1117, ptr %local.trust_mid.1036
  %t1118 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.160)
  %t1119 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.161)
  %t1120 = load i64, ptr %local.true_val.1032
  %t1121 = call i64 @"avg_agent_error"(i64 %t1118, i64 %t1119, i64 %t1120, i64 80)
  store i64 %t1121, ptr %local.skept_mid.1037
  %t1122 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.162)
  %t1123 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.163)
  %t1124 = load i64, ptr %local.true_val.1032
  %t1125 = call i64 @"avg_agent_error"(i64 %t1122, i64 %t1123, i64 %t1124, i64 80)
  store i64 %t1125, ptr %local.none_mid.1038
  %t1126 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.164)
  %t1127 = ptrtoint ptr %t1126 to i64
  %t1128 = inttoptr i64 %t1127 to ptr
  call void @intrinsic_println(ptr %t1128)
  %t1129 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.165)
  %t1130 = ptrtoint ptr %t1129 to i64
  %t1131 = inttoptr i64 %t1130 to ptr
  call void @intrinsic_print(ptr %t1131)
  %t1132 = load i64, ptr %local.trust_mid.1036
  %t1133 = call i64 @"print_f64"(i64 %t1132)
  %t1134 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.166)
  %t1135 = ptrtoint ptr %t1134 to i64
  %t1136 = inttoptr i64 %t1135 to ptr
  call void @intrinsic_println(ptr %t1136)
  %t1137 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.167)
  %t1138 = ptrtoint ptr %t1137 to i64
  %t1139 = inttoptr i64 %t1138 to ptr
  call void @intrinsic_print(ptr %t1139)
  %t1140 = load i64, ptr %local.skept_mid.1037
  %t1141 = call i64 @"print_f64"(i64 %t1140)
  %t1142 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.168)
  %t1143 = ptrtoint ptr %t1142 to i64
  %t1144 = inttoptr i64 %t1143 to ptr
  call void @intrinsic_println(ptr %t1144)
  %t1145 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.169)
  %t1146 = ptrtoint ptr %t1145 to i64
  %t1147 = inttoptr i64 %t1146 to ptr
  call void @intrinsic_print(ptr %t1147)
  %t1148 = load i64, ptr %local.none_mid.1038
  %t1149 = call i64 @"print_f64"(i64 %t1148)
  %t1150 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.170)
  %t1151 = ptrtoint ptr %t1150 to i64
  %t1152 = inttoptr i64 %t1151 to ptr
  call void @intrinsic_println(ptr %t1152)
  %t1153 = load i64, ptr %local.skept_mid.1037
  %t1154 = load i64, ptr %local.trust_mid.1036
  %t1155 = call i64 @"sx_f64_lt"(i64 %t1153, i64 %t1154)
  %t1156 = icmp ne i64 %t1155, 0
  br i1 %t1156, label %then40, label %else40
then40:
  %t1157 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.171)
  %t1158 = ptrtoint ptr %t1157 to i64
  %t1159 = inttoptr i64 %t1158 to ptr
  call void @intrinsic_println(ptr %t1159)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  %t1160 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.172)
  %t1161 = ptrtoint ptr %t1160 to i64
  %t1162 = inttoptr i64 %t1161 to ptr
  call void @intrinsic_println(ptr %t1162)
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1163 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t1164 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.173)
  %t1165 = ptrtoint ptr %t1164 to i64
  %t1166 = inttoptr i64 %t1165 to ptr
  call void @intrinsic_println(ptr %t1166)
  %t1167 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.174)
  %t1168 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.175)
  %t1169 = load i64, ptr %local.true_val.1032
  %t1170 = call i64 @"avg_agent_error"(i64 %t1167, i64 %t1168, i64 %t1169, i64 200)
  store i64 %t1170, ptr %local.trust_late.1039
  %t1171 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.176)
  %t1172 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.177)
  %t1173 = load i64, ptr %local.true_val.1032
  %t1174 = call i64 @"avg_agent_error"(i64 %t1171, i64 %t1172, i64 %t1173, i64 200)
  store i64 %t1174, ptr %local.skept_late.1040
  %t1175 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.178)
  %t1176 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.179)
  %t1177 = load i64, ptr %local.true_val.1032
  %t1178 = call i64 @"avg_agent_error"(i64 %t1175, i64 %t1176, i64 %t1177, i64 200)
  store i64 %t1178, ptr %local.none_late.1041
  %t1179 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.180)
  %t1180 = ptrtoint ptr %t1179 to i64
  %t1181 = inttoptr i64 %t1180 to ptr
  call void @intrinsic_println(ptr %t1181)
  %t1182 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.181)
  %t1183 = ptrtoint ptr %t1182 to i64
  %t1184 = inttoptr i64 %t1183 to ptr
  call void @intrinsic_print(ptr %t1184)
  %t1185 = load i64, ptr %local.trust_late.1039
  %t1186 = call i64 @"print_f64"(i64 %t1185)
  %t1187 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.182)
  %t1188 = ptrtoint ptr %t1187 to i64
  %t1189 = inttoptr i64 %t1188 to ptr
  call void @intrinsic_println(ptr %t1189)
  %t1190 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.183)
  %t1191 = ptrtoint ptr %t1190 to i64
  %t1192 = inttoptr i64 %t1191 to ptr
  call void @intrinsic_print(ptr %t1192)
  %t1193 = load i64, ptr %local.skept_late.1040
  %t1194 = call i64 @"print_f64"(i64 %t1193)
  %t1195 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.184)
  %t1196 = ptrtoint ptr %t1195 to i64
  %t1197 = inttoptr i64 %t1196 to ptr
  call void @intrinsic_println(ptr %t1197)
  %t1198 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.185)
  %t1199 = ptrtoint ptr %t1198 to i64
  %t1200 = inttoptr i64 %t1199 to ptr
  call void @intrinsic_print(ptr %t1200)
  %t1201 = load i64, ptr %local.none_late.1041
  %t1202 = call i64 @"print_f64"(i64 %t1201)
  %t1203 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.186)
  %t1204 = ptrtoint ptr %t1203 to i64
  %t1205 = inttoptr i64 %t1204 to ptr
  call void @intrinsic_println(ptr %t1205)
  %t1206 = load i64, ptr %local.skept_late.1040
  %t1207 = load i64, ptr %local.trust_late.1039
  %t1208 = call i64 @"sx_f64_lt"(i64 %t1206, i64 %t1207)
  %t1209 = icmp ne i64 %t1208, 0
  br i1 %t1209, label %then41, label %else41
then41:
  %t1210 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.187)
  %t1211 = ptrtoint ptr %t1210 to i64
  %t1212 = inttoptr i64 %t1211 to ptr
  call void @intrinsic_println(ptr %t1212)
  br label %then41_end
then41_end:
  br label %endif41
else41:
  %t1213 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.188)
  %t1214 = ptrtoint ptr %t1213 to i64
  %t1215 = inttoptr i64 %t1214 to ptr
  call void @intrinsic_println(ptr %t1215)
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1216 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t1217 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.189)
  %t1218 = ptrtoint ptr %t1217 to i64
  %t1219 = inttoptr i64 %t1218 to ptr
  call void @intrinsic_println(ptr %t1219)
  %t1220 = load i64, ptr %local.skept_early.1034
  %t1221 = load i64, ptr %local.trust_early.1033
  %t1222 = call i64 @"sx_f64_lt"(i64 %t1220, i64 %t1221)
  %t1223 = icmp ne i64 %t1222, 0
  br i1 %t1223, label %then42, label %else42
then42:
  %t1224 = load i64, ptr %local.trust_late.1039
  %t1225 = load i64, ptr %local.skept_late.1040
  %t1226 = call i64 @"sx_f64_lt"(i64 %t1224, i64 %t1225)
  %t1227 = icmp ne i64 %t1226, 0
  br i1 %t1227, label %then43, label %else43
then43:
  %t1228 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.190)
  %t1229 = ptrtoint ptr %t1228 to i64
  %t1230 = inttoptr i64 %t1229 to ptr
  call void @intrinsic_println(ptr %t1230)
  %t1231 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.191)
  %t1232 = ptrtoint ptr %t1231 to i64
  %t1233 = inttoptr i64 %t1232 to ptr
  call void @intrinsic_println(ptr %t1233)
  br label %then43_end
then43_end:
  br label %endif43
else43:
  %t1234 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.192)
  %t1235 = ptrtoint ptr %t1234 to i64
  %t1236 = inttoptr i64 %t1235 to ptr
  call void @intrinsic_println(ptr %t1236)
  %t1237 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.193)
  %t1238 = ptrtoint ptr %t1237 to i64
  %t1239 = inttoptr i64 %t1238 to ptr
  call void @intrinsic_println(ptr %t1239)
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1240 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  br label %then42_end
then42_end:
  br label %endif42
else42:
  %t1241 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.194)
  %t1242 = ptrtoint ptr %t1241 to i64
  %t1243 = inttoptr i64 %t1242 to ptr
  call void @intrinsic_println(ptr %t1243)
  %t1244 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.195)
  %t1245 = ptrtoint ptr %t1244 to i64
  %t1246 = inttoptr i64 %t1245 to ptr
  call void @intrinsic_println(ptr %t1246)
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1247 = phi i64 [ %t1240, %then42_end ], [ 0, %else42_end ]
  %t1248 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.196)
  %t1249 = ptrtoint ptr %t1248 to i64
  %t1250 = inttoptr i64 %t1249 to ptr
  call void @intrinsic_println(ptr %t1250)
  ret i64 0
}

define i64 @"train_ensemble"(i64 %w_trust, i64 %w_neutral, i64 %w_skept, i64 %true_val, i64 %observations, i64 %seed) nounwind {
entry:
  %local.t_al.1251 = alloca i64
  %local.t_be.1252 = alloca i64
  %local.n_al.1253 = alloca i64
  %local.n_be.1254 = alloca i64
  %local.s_al.1255 = alloca i64
  %local.s_be.1256 = alloca i64
  %local.rng.1257 = alloca i64
  %local.step.1258 = alloca i64
  %local.conf.1259 = alloca i64
  %local.alignment.1260 = alloca i64
  %local.boost.1261 = alloca i64
  %local.obs_val.1262 = alloca i64
  %local.coupling.1263 = alloca i64
  %local.d_trust.1264 = alloca i64
  %local.d_neutral.1265 = alloca i64
  %local.d_skept.1266 = alloca i64
  %local.w_sum.1267 = alloca i64
  %local.wt.1268 = alloca i64
  %local.wn.1269 = alloca i64
  %local.ws.1270 = alloca i64
  %local.ensemble.1271 = alloca i64
  %local.err.1272 = alloca i64
  %local.w_trust = alloca i64
  store i64 %w_trust, ptr %local.w_trust
  %local.w_neutral = alloca i64
  store i64 %w_neutral, ptr %local.w_neutral
  %local.w_skept = alloca i64
  store i64 %w_skept, ptr %local.w_skept
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.observations = alloca i64
  store i64 %observations, ptr %local.observations
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t1273 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.197)
  store i64 %t1273, ptr %local.t_al.1251
  %t1274 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.198)
  store i64 %t1274, ptr %local.t_be.1252
  %t1275 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.199)
  store i64 %t1275, ptr %local.n_al.1253
  %t1276 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.200)
  store i64 %t1276, ptr %local.n_be.1254
  %t1277 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.201)
  store i64 %t1277, ptr %local.s_al.1255
  %t1278 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.202)
  store i64 %t1278, ptr %local.s_be.1256
  %t1279 = load i64, ptr %local.seed
  store i64 %t1279, ptr %local.rng.1257
  store i64 0, ptr %local.step.1258
  %t1280 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.203)
  store i64 %t1280, ptr %local.conf.1259
  %t1281 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.204)
  store i64 %t1281, ptr %local.alignment.1260
  %t1282 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.205)
  store i64 %t1282, ptr %local.boost.1261
  %t1283 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.206)
  store i64 %t1283, ptr %local.obs_val.1262
  %t1284 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.207)
  store i64 %t1284, ptr %local.coupling.1263
  %t1285 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.208)
  store i64 %t1285, ptr %local.d_trust.1264
  %t1286 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.209)
  store i64 %t1286, ptr %local.d_neutral.1265
  %t1287 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.210)
  store i64 %t1287, ptr %local.d_skept.1266
  br label %loop44
loop44:
  %t1288 = load i64, ptr %local.step.1258
  %t1289 = load i64, ptr %local.observations
  %t1290 = icmp slt i64 %t1288, %t1289
  %t1291 = zext i1 %t1290 to i64
  %t1292 = icmp ne i64 %t1291, 0
  br i1 %t1292, label %body44, label %endloop44
body44:
  %t1293 = load i64, ptr %local.rng.1257
  %t1294 = call i64 @"lcg_next"(i64 %t1293)
  store i64 %t1294, ptr %local.rng.1257
  %t1295 = load i64, ptr %local.rng.1257
  %t1296 = call i64 @"lcg_f64"(i64 %t1295)
  store i64 %t1296, ptr %local.obs_val.1262
  %t1297 = load i64, ptr %local.t_al.1251
  %t1298 = load i64, ptr %local.t_be.1252
  %t1299 = call i64 @"beta_mean"(i64 %t1297, i64 %t1298)
  store i64 %t1299, ptr %local.conf.1259
  %t1300 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.211)
  %t1301 = load i64, ptr %local.conf.1259
  %t1302 = load i64, ptr %local.d_trust.1264
  %t1303 = call i64 @"sx_f64_sub"(i64 %t1301, i64 %t1302)
  %t1304 = call i64 @"abs_f64"(i64 %t1303)
  %t1305 = call i64 @"sx_f64_sub"(i64 %t1300, i64 %t1304)
  store i64 %t1305, ptr %local.alignment.1260
  %t1306 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.212)
  %t1307 = load i64, ptr %local.coupling.1263
  %t1308 = load i64, ptr %local.alignment.1260
  %t1309 = call i64 @"sx_f64_mul"(i64 %t1307, i64 %t1308)
  %t1310 = call i64 @"sx_f64_add"(i64 %t1306, i64 %t1309)
  store i64 %t1310, ptr %local.boost.1261
  %t1311 = load i64, ptr %local.obs_val.1262
  %t1312 = load i64, ptr %local.true_val
  %t1313 = call i64 @"sx_f64_lt"(i64 %t1311, i64 %t1312)
  %t1314 = icmp ne i64 %t1313, 0
  br i1 %t1314, label %then45, label %else45
then45:
  %t1315 = load i64, ptr %local.t_al.1251
  %t1316 = load i64, ptr %local.boost.1261
  %t1317 = call i64 @"sx_f64_add"(i64 %t1315, i64 %t1316)
  store i64 %t1317, ptr %local.t_al.1251
  br label %then45_end
then45_end:
  br label %endif45
else45:
  %t1318 = load i64, ptr %local.t_be.1252
  %t1319 = load i64, ptr %local.boost.1261
  %t1320 = call i64 @"sx_f64_add"(i64 %t1318, i64 %t1319)
  store i64 %t1320, ptr %local.t_be.1252
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1321 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t1322 = load i64, ptr %local.n_al.1253
  %t1323 = load i64, ptr %local.n_be.1254
  %t1324 = call i64 @"beta_mean"(i64 %t1322, i64 %t1323)
  store i64 %t1324, ptr %local.conf.1259
  %t1325 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.213)
  %t1326 = load i64, ptr %local.conf.1259
  %t1327 = load i64, ptr %local.d_neutral.1265
  %t1328 = call i64 @"sx_f64_sub"(i64 %t1326, i64 %t1327)
  %t1329 = call i64 @"abs_f64"(i64 %t1328)
  %t1330 = call i64 @"sx_f64_sub"(i64 %t1325, i64 %t1329)
  store i64 %t1330, ptr %local.alignment.1260
  %t1331 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.214)
  %t1332 = load i64, ptr %local.coupling.1263
  %t1333 = load i64, ptr %local.alignment.1260
  %t1334 = call i64 @"sx_f64_mul"(i64 %t1332, i64 %t1333)
  %t1335 = call i64 @"sx_f64_add"(i64 %t1331, i64 %t1334)
  store i64 %t1335, ptr %local.boost.1261
  %t1336 = load i64, ptr %local.obs_val.1262
  %t1337 = load i64, ptr %local.true_val
  %t1338 = call i64 @"sx_f64_lt"(i64 %t1336, i64 %t1337)
  %t1339 = icmp ne i64 %t1338, 0
  br i1 %t1339, label %then46, label %else46
then46:
  %t1340 = load i64, ptr %local.n_al.1253
  %t1341 = load i64, ptr %local.boost.1261
  %t1342 = call i64 @"sx_f64_add"(i64 %t1340, i64 %t1341)
  store i64 %t1342, ptr %local.n_al.1253
  br label %then46_end
then46_end:
  br label %endif46
else46:
  %t1343 = load i64, ptr %local.n_be.1254
  %t1344 = load i64, ptr %local.boost.1261
  %t1345 = call i64 @"sx_f64_add"(i64 %t1343, i64 %t1344)
  store i64 %t1345, ptr %local.n_be.1254
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1346 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t1347 = load i64, ptr %local.s_al.1255
  %t1348 = load i64, ptr %local.s_be.1256
  %t1349 = call i64 @"beta_mean"(i64 %t1347, i64 %t1348)
  store i64 %t1349, ptr %local.conf.1259
  %t1350 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.215)
  %t1351 = load i64, ptr %local.conf.1259
  %t1352 = load i64, ptr %local.d_skept.1266
  %t1353 = call i64 @"sx_f64_sub"(i64 %t1351, i64 %t1352)
  %t1354 = call i64 @"abs_f64"(i64 %t1353)
  %t1355 = call i64 @"sx_f64_sub"(i64 %t1350, i64 %t1354)
  store i64 %t1355, ptr %local.alignment.1260
  %t1356 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.216)
  %t1357 = load i64, ptr %local.coupling.1263
  %t1358 = load i64, ptr %local.alignment.1260
  %t1359 = call i64 @"sx_f64_mul"(i64 %t1357, i64 %t1358)
  %t1360 = call i64 @"sx_f64_add"(i64 %t1356, i64 %t1359)
  store i64 %t1360, ptr %local.boost.1261
  %t1361 = load i64, ptr %local.obs_val.1262
  %t1362 = load i64, ptr %local.true_val
  %t1363 = call i64 @"sx_f64_lt"(i64 %t1361, i64 %t1362)
  %t1364 = icmp ne i64 %t1363, 0
  br i1 %t1364, label %then47, label %else47
then47:
  %t1365 = load i64, ptr %local.s_al.1255
  %t1366 = load i64, ptr %local.boost.1261
  %t1367 = call i64 @"sx_f64_add"(i64 %t1365, i64 %t1366)
  store i64 %t1367, ptr %local.s_al.1255
  br label %then47_end
then47_end:
  br label %endif47
else47:
  %t1368 = load i64, ptr %local.s_be.1256
  %t1369 = load i64, ptr %local.boost.1261
  %t1370 = call i64 @"sx_f64_add"(i64 %t1368, i64 %t1369)
  store i64 %t1370, ptr %local.s_be.1256
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1371 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t1372 = load i64, ptr %local.step.1258
  %t1373 = add i64 %t1372, 1
  store i64 %t1373, ptr %local.step.1258
  br label %loop44
endloop44:
  %t1374 = load i64, ptr %local.w_trust
  %t1375 = call i64 @"abs_f64"(i64 %t1374)
  %t1376 = load i64, ptr %local.w_neutral
  %t1377 = call i64 @"abs_f64"(i64 %t1376)
  %t1378 = call i64 @"sx_f64_add"(i64 %t1375, i64 %t1377)
  %t1379 = load i64, ptr %local.w_skept
  %t1380 = call i64 @"abs_f64"(i64 %t1379)
  %t1381 = call i64 @"sx_f64_add"(i64 %t1378, i64 %t1380)
  %t1382 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.217)
  %t1383 = call i64 @"sx_f64_add"(i64 %t1381, i64 %t1382)
  store i64 %t1383, ptr %local.w_sum.1267
  %t1384 = load i64, ptr %local.w_trust
  %t1385 = call i64 @"abs_f64"(i64 %t1384)
  %t1386 = load i64, ptr %local.w_sum.1267
  %t1387 = call i64 @"sx_f64_div"(i64 %t1385, i64 %t1386)
  store i64 %t1387, ptr %local.wt.1268
  %t1388 = load i64, ptr %local.w_neutral
  %t1389 = call i64 @"abs_f64"(i64 %t1388)
  %t1390 = load i64, ptr %local.w_sum.1267
  %t1391 = call i64 @"sx_f64_div"(i64 %t1389, i64 %t1390)
  store i64 %t1391, ptr %local.wn.1269
  %t1392 = load i64, ptr %local.w_skept
  %t1393 = call i64 @"abs_f64"(i64 %t1392)
  %t1394 = load i64, ptr %local.w_sum.1267
  %t1395 = call i64 @"sx_f64_div"(i64 %t1393, i64 %t1394)
  store i64 %t1395, ptr %local.ws.1270
  %t1396 = load i64, ptr %local.wt.1268
  %t1397 = load i64, ptr %local.t_al.1251
  %t1398 = load i64, ptr %local.t_be.1252
  %t1399 = call i64 @"beta_mean"(i64 %t1397, i64 %t1398)
  %t1400 = call i64 @"sx_f64_mul"(i64 %t1396, i64 %t1399)
  %t1401 = load i64, ptr %local.wn.1269
  %t1402 = load i64, ptr %local.n_al.1253
  %t1403 = load i64, ptr %local.n_be.1254
  %t1404 = call i64 @"beta_mean"(i64 %t1402, i64 %t1403)
  %t1405 = call i64 @"sx_f64_mul"(i64 %t1401, i64 %t1404)
  %t1406 = call i64 @"sx_f64_add"(i64 %t1400, i64 %t1405)
  %t1407 = load i64, ptr %local.ws.1270
  %t1408 = load i64, ptr %local.s_al.1255
  %t1409 = load i64, ptr %local.s_be.1256
  %t1410 = call i64 @"beta_mean"(i64 %t1408, i64 %t1409)
  %t1411 = call i64 @"sx_f64_mul"(i64 %t1407, i64 %t1410)
  %t1412 = call i64 @"sx_f64_add"(i64 %t1406, i64 %t1411)
  store i64 %t1412, ptr %local.ensemble.1271
  %t1413 = load i64, ptr %local.ensemble.1271
  %t1414 = load i64, ptr %local.true_val
  %t1415 = call i64 @"sx_f64_sub"(i64 %t1413, i64 %t1414)
  store i64 %t1415, ptr %local.err.1272
  %t1416 = load i64, ptr %local.err.1272
  %t1417 = load i64, ptr %local.err.1272
  %t1418 = call i64 @"sx_f64_mul"(i64 %t1416, i64 %t1417)
  ret i64 %t1418
}

define i64 @"avg_ensemble"(i64 %wt, i64 %wn, i64 %ws, i64 %true_val, i64 %obs) nounwind {
entry:
  %local.l1.1419 = alloca i64
  %local.l2.1420 = alloca i64
  %local.l3.1421 = alloca i64
  %local.wt = alloca i64
  store i64 %wt, ptr %local.wt
  %local.wn = alloca i64
  store i64 %wn, ptr %local.wn
  %local.ws = alloca i64
  store i64 %ws, ptr %local.ws
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t1422 = load i64, ptr %local.wt
  %t1423 = load i64, ptr %local.wn
  %t1424 = load i64, ptr %local.ws
  %t1425 = load i64, ptr %local.true_val
  %t1426 = load i64, ptr %local.obs
  %t1427 = call i64 @"train_ensemble"(i64 %t1422, i64 %t1423, i64 %t1424, i64 %t1425, i64 %t1426, i64 42)
  store i64 %t1427, ptr %local.l1.1419
  %t1428 = load i64, ptr %local.wt
  %t1429 = load i64, ptr %local.wn
  %t1430 = load i64, ptr %local.ws
  %t1431 = load i64, ptr %local.true_val
  %t1432 = load i64, ptr %local.obs
  %t1433 = call i64 @"train_ensemble"(i64 %t1428, i64 %t1429, i64 %t1430, i64 %t1431, i64 %t1432, i64 137)
  store i64 %t1433, ptr %local.l2.1420
  %t1434 = load i64, ptr %local.wt
  %t1435 = load i64, ptr %local.wn
  %t1436 = load i64, ptr %local.ws
  %t1437 = load i64, ptr %local.true_val
  %t1438 = load i64, ptr %local.obs
  %t1439 = call i64 @"train_ensemble"(i64 %t1434, i64 %t1435, i64 %t1436, i64 %t1437, i64 %t1438, i64 999)
  store i64 %t1439, ptr %local.l3.1421
  %t1440 = load i64, ptr %local.l1.1419
  %t1441 = load i64, ptr %local.l2.1420
  %t1442 = call i64 @"sx_f64_add"(i64 %t1440, i64 %t1441)
  %t1443 = load i64, ptr %local.l3.1421
  %t1444 = call i64 @"sx_f64_add"(i64 %t1442, i64 %t1443)
  %t1445 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.218)
  %t1446 = call i64 @"sx_f64_div"(i64 %t1444, i64 %t1445)
  ret i64 %t1446
}

define i64 @"mg_ensemble"(i64 %wt, i64 %wn, i64 %ws, i64 %true_val, i64 %obs, i64 %which) nounwind {
entry:
  %local.h.1447 = alloca i64
  %local.wtp.1448 = alloca i64
  %local.wnp.1449 = alloca i64
  %local.wsp.1450 = alloca i64
  %local.wtm.1451 = alloca i64
  %local.wnm.1452 = alloca i64
  %local.wsm.1453 = alloca i64
  %local.lp.1454 = alloca i64
  %local.lm.1455 = alloca i64
  %local.wt = alloca i64
  store i64 %wt, ptr %local.wt
  %local.wn = alloca i64
  store i64 %wn, ptr %local.wn
  %local.ws = alloca i64
  store i64 %ws, ptr %local.ws
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t1456 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.219)
  store i64 %t1456, ptr %local.h.1447
  %t1457 = load i64, ptr %local.wt
  store i64 %t1457, ptr %local.wtp.1448
  %t1458 = load i64, ptr %local.wn
  store i64 %t1458, ptr %local.wnp.1449
  %t1459 = load i64, ptr %local.ws
  store i64 %t1459, ptr %local.wsp.1450
  %t1460 = load i64, ptr %local.wt
  store i64 %t1460, ptr %local.wtm.1451
  %t1461 = load i64, ptr %local.wn
  store i64 %t1461, ptr %local.wnm.1452
  %t1462 = load i64, ptr %local.ws
  store i64 %t1462, ptr %local.wsm.1453
  %t1463 = load i64, ptr %local.which
  %t1464 = icmp eq i64 %t1463, 0
  %t1465 = zext i1 %t1464 to i64
  %t1466 = icmp ne i64 %t1465, 0
  br i1 %t1466, label %then48, label %else48
then48:
  %t1467 = load i64, ptr %local.wt
  %t1468 = load i64, ptr %local.h.1447
  %t1469 = call i64 @"sx_f64_add"(i64 %t1467, i64 %t1468)
  store i64 %t1469, ptr %local.wtp.1448
  %t1470 = load i64, ptr %local.wt
  %t1471 = load i64, ptr %local.h.1447
  %t1472 = call i64 @"sx_f64_sub"(i64 %t1470, i64 %t1471)
  store i64 %t1472, ptr %local.wtm.1451
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1473 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1474 = load i64, ptr %local.which
  %t1475 = icmp eq i64 %t1474, 1
  %t1476 = zext i1 %t1475 to i64
  %t1477 = icmp ne i64 %t1476, 0
  br i1 %t1477, label %then49, label %else49
then49:
  %t1478 = load i64, ptr %local.wn
  %t1479 = load i64, ptr %local.h.1447
  %t1480 = call i64 @"sx_f64_add"(i64 %t1478, i64 %t1479)
  store i64 %t1480, ptr %local.wnp.1449
  %t1481 = load i64, ptr %local.wn
  %t1482 = load i64, ptr %local.h.1447
  %t1483 = call i64 @"sx_f64_sub"(i64 %t1481, i64 %t1482)
  store i64 %t1483, ptr %local.wnm.1452
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1484 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t1485 = load i64, ptr %local.which
  %t1486 = icmp eq i64 %t1485, 2
  %t1487 = zext i1 %t1486 to i64
  %t1488 = icmp ne i64 %t1487, 0
  br i1 %t1488, label %then50, label %else50
then50:
  %t1489 = load i64, ptr %local.ws
  %t1490 = load i64, ptr %local.h.1447
  %t1491 = call i64 @"sx_f64_add"(i64 %t1489, i64 %t1490)
  store i64 %t1491, ptr %local.wsp.1450
  %t1492 = load i64, ptr %local.ws
  %t1493 = load i64, ptr %local.h.1447
  %t1494 = call i64 @"sx_f64_sub"(i64 %t1492, i64 %t1493)
  store i64 %t1494, ptr %local.wsm.1453
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1495 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t1496 = load i64, ptr %local.wtp.1448
  %t1497 = load i64, ptr %local.wnp.1449
  %t1498 = load i64, ptr %local.wsp.1450
  %t1499 = load i64, ptr %local.true_val
  %t1500 = load i64, ptr %local.obs
  %t1501 = call i64 @"avg_ensemble"(i64 %t1496, i64 %t1497, i64 %t1498, i64 %t1499, i64 %t1500)
  store i64 %t1501, ptr %local.lp.1454
  %t1502 = load i64, ptr %local.wtm.1451
  %t1503 = load i64, ptr %local.wnm.1452
  %t1504 = load i64, ptr %local.wsm.1453
  %t1505 = load i64, ptr %local.true_val
  %t1506 = load i64, ptr %local.obs
  %t1507 = call i64 @"avg_ensemble"(i64 %t1502, i64 %t1503, i64 %t1504, i64 %t1505, i64 %t1506)
  store i64 %t1507, ptr %local.lm.1455
  %t1508 = load i64, ptr %local.lp.1454
  %t1509 = load i64, ptr %local.lm.1455
  %t1510 = call i64 @"sx_f64_sub"(i64 %t1508, i64 %t1509)
  %t1511 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.220)
  %t1512 = load i64, ptr %local.h.1447
  %t1513 = call i64 @"sx_f64_mul"(i64 %t1511, i64 %t1512)
  %t1514 = call i64 @"sx_f64_div"(i64 %t1510, i64 %t1513)
  ret i64 %t1514
}

define i64 @"learn_weights"(i64 %true_val, i64 %obs) nounwind {
entry:
  %local.wt.1515 = alloca i64
  %local.wn.1516 = alloca i64
  %local.ws.1517 = alloca i64
  %local.mg.1518 = alloca i64
  %local.cycle.1519 = alloca i64
  %local.lr.1520 = alloca i64
  %local.w_sum.1521 = alloca i64
  %local.norm_t.1522 = alloca i64
  %local.norm_n.1523 = alloca i64
  %local.norm_s.1524 = alloca i64
  %local.loss.1525 = alloca i64
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t1526 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.221)
  store i64 %t1526, ptr %local.wt.1515
  %t1527 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.222)
  store i64 %t1527, ptr %local.wn.1516
  %t1528 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.223)
  store i64 %t1528, ptr %local.ws.1517
  %t1529 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.224)
  store i64 %t1529, ptr %local.mg.1518
  store i64 0, ptr %local.cycle.1519
  %t1530 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.225)
  store i64 %t1530, ptr %local.lr.1520
  br label %loop51
loop51:
  %t1531 = load i64, ptr %local.cycle.1519
  %t1532 = icmp slt i64 %t1531, 40
  %t1533 = zext i1 %t1532 to i64
  %t1534 = icmp ne i64 %t1533, 0
  br i1 %t1534, label %body51, label %endloop51
body51:
  %t1535 = load i64, ptr %local.wt.1515
  %t1536 = load i64, ptr %local.wn.1516
  %t1537 = load i64, ptr %local.ws.1517
  %t1538 = load i64, ptr %local.true_val
  %t1539 = load i64, ptr %local.obs
  %t1540 = call i64 @"mg_ensemble"(i64 %t1535, i64 %t1536, i64 %t1537, i64 %t1538, i64 %t1539, i64 0)
  store i64 %t1540, ptr %local.mg.1518
  %t1541 = load i64, ptr %local.wt.1515
  %t1542 = load i64, ptr %local.lr.1520
  %t1543 = load i64, ptr %local.mg.1518
  %t1544 = call i64 @"sx_f64_mul"(i64 %t1542, i64 %t1543)
  %t1545 = call i64 @"sx_f64_sub"(i64 %t1541, i64 %t1544)
  %t1546 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.226)
  %t1547 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.227)
  %t1548 = call i64 @"clamp"(i64 %t1545, i64 %t1546, i64 %t1547)
  store i64 %t1548, ptr %local.wt.1515
  %t1549 = load i64, ptr %local.wt.1515
  %t1550 = load i64, ptr %local.wn.1516
  %t1551 = load i64, ptr %local.ws.1517
  %t1552 = load i64, ptr %local.true_val
  %t1553 = load i64, ptr %local.obs
  %t1554 = call i64 @"mg_ensemble"(i64 %t1549, i64 %t1550, i64 %t1551, i64 %t1552, i64 %t1553, i64 1)
  store i64 %t1554, ptr %local.mg.1518
  %t1555 = load i64, ptr %local.wn.1516
  %t1556 = load i64, ptr %local.lr.1520
  %t1557 = load i64, ptr %local.mg.1518
  %t1558 = call i64 @"sx_f64_mul"(i64 %t1556, i64 %t1557)
  %t1559 = call i64 @"sx_f64_sub"(i64 %t1555, i64 %t1558)
  %t1560 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.228)
  %t1561 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.229)
  %t1562 = call i64 @"clamp"(i64 %t1559, i64 %t1560, i64 %t1561)
  store i64 %t1562, ptr %local.wn.1516
  %t1563 = load i64, ptr %local.wt.1515
  %t1564 = load i64, ptr %local.wn.1516
  %t1565 = load i64, ptr %local.ws.1517
  %t1566 = load i64, ptr %local.true_val
  %t1567 = load i64, ptr %local.obs
  %t1568 = call i64 @"mg_ensemble"(i64 %t1563, i64 %t1564, i64 %t1565, i64 %t1566, i64 %t1567, i64 2)
  store i64 %t1568, ptr %local.mg.1518
  %t1569 = load i64, ptr %local.ws.1517
  %t1570 = load i64, ptr %local.lr.1520
  %t1571 = load i64, ptr %local.mg.1518
  %t1572 = call i64 @"sx_f64_mul"(i64 %t1570, i64 %t1571)
  %t1573 = call i64 @"sx_f64_sub"(i64 %t1569, i64 %t1572)
  %t1574 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.230)
  %t1575 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.231)
  %t1576 = call i64 @"clamp"(i64 %t1573, i64 %t1574, i64 %t1575)
  store i64 %t1576, ptr %local.ws.1517
  %t1577 = load i64, ptr %local.cycle.1519
  %t1578 = add i64 %t1577, 1
  store i64 %t1578, ptr %local.cycle.1519
  br label %loop51
endloop51:
  %t1579 = load i64, ptr %local.wt.1515
  %t1580 = load i64, ptr %local.wn.1516
  %t1581 = call i64 @"sx_f64_add"(i64 %t1579, i64 %t1580)
  %t1582 = load i64, ptr %local.ws.1517
  %t1583 = call i64 @"sx_f64_add"(i64 %t1581, i64 %t1582)
  store i64 %t1583, ptr %local.w_sum.1521
  %t1584 = load i64, ptr %local.wt.1515
  %t1585 = load i64, ptr %local.w_sum.1521
  %t1586 = call i64 @"sx_f64_div"(i64 %t1584, i64 %t1585)
  store i64 %t1586, ptr %local.norm_t.1522
  %t1587 = load i64, ptr %local.wn.1516
  %t1588 = load i64, ptr %local.w_sum.1521
  %t1589 = call i64 @"sx_f64_div"(i64 %t1587, i64 %t1588)
  store i64 %t1589, ptr %local.norm_n.1523
  %t1590 = load i64, ptr %local.ws.1517
  %t1591 = load i64, ptr %local.w_sum.1521
  %t1592 = call i64 @"sx_f64_div"(i64 %t1590, i64 %t1591)
  store i64 %t1592, ptr %local.norm_s.1524
  %t1593 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.232)
  %t1594 = ptrtoint ptr %t1593 to i64
  %t1595 = inttoptr i64 %t1594 to ptr
  call void @intrinsic_print(ptr %t1595)
  %t1596 = load i64, ptr %local.norm_t.1522
  %t1597 = call i64 @"print_f64"(i64 %t1596)
  %t1598 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.233)
  %t1599 = ptrtoint ptr %t1598 to i64
  %t1600 = inttoptr i64 %t1599 to ptr
  call void @intrinsic_println(ptr %t1600)
  %t1601 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.234)
  %t1602 = ptrtoint ptr %t1601 to i64
  %t1603 = inttoptr i64 %t1602 to ptr
  call void @intrinsic_print(ptr %t1603)
  %t1604 = load i64, ptr %local.norm_n.1523
  %t1605 = call i64 @"print_f64"(i64 %t1604)
  %t1606 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.235)
  %t1607 = ptrtoint ptr %t1606 to i64
  %t1608 = inttoptr i64 %t1607 to ptr
  call void @intrinsic_println(ptr %t1608)
  %t1609 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.236)
  %t1610 = ptrtoint ptr %t1609 to i64
  %t1611 = inttoptr i64 %t1610 to ptr
  call void @intrinsic_print(ptr %t1611)
  %t1612 = load i64, ptr %local.norm_s.1524
  %t1613 = call i64 @"print_f64"(i64 %t1612)
  %t1614 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.237)
  %t1615 = ptrtoint ptr %t1614 to i64
  %t1616 = inttoptr i64 %t1615 to ptr
  call void @intrinsic_println(ptr %t1616)
  %t1617 = load i64, ptr %local.wt.1515
  %t1618 = load i64, ptr %local.wn.1516
  %t1619 = load i64, ptr %local.ws.1517
  %t1620 = load i64, ptr %local.true_val
  %t1621 = load i64, ptr %local.obs
  %t1622 = call i64 @"avg_ensemble"(i64 %t1617, i64 %t1618, i64 %t1619, i64 %t1620, i64 %t1621)
  store i64 %t1622, ptr %local.loss.1525
  %t1623 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.238)
  %t1624 = ptrtoint ptr %t1623 to i64
  %t1625 = inttoptr i64 %t1624 to ptr
  call void @intrinsic_print(ptr %t1625)
  %t1626 = load i64, ptr %local.loss.1525
  %t1627 = call i64 @"print_f64"(i64 %t1626)
  %t1628 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.239)
  %t1629 = ptrtoint ptr %t1628 to i64
  %t1630 = inttoptr i64 %t1629 to ptr
  call void @intrinsic_println(ptr %t1630)
  %t1631 = load i64, ptr %local.norm_s.1524
  %t1632 = load i64, ptr %local.norm_t.1522
  %t1633 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.240)
  %t1634 = call i64 @"sx_f64_add"(i64 %t1632, i64 %t1633)
  %t1635 = call i64 @"sx_f64_gt"(i64 %t1631, i64 %t1634)
  %t1636 = icmp ne i64 %t1635, 0
  br i1 %t1636, label %then52, label %else52
then52:
  %t1637 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.241)
  %t1638 = ptrtoint ptr %t1637 to i64
  %t1639 = inttoptr i64 %t1638 to ptr
  call void @intrinsic_println(ptr %t1639)
  br label %then52_end
then52_end:
  br label %endif52
else52:
  %t1640 = load i64, ptr %local.norm_t.1522
  %t1641 = load i64, ptr %local.norm_s.1524
  %t1642 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.242)
  %t1643 = call i64 @"sx_f64_add"(i64 %t1641, i64 %t1642)
  %t1644 = call i64 @"sx_f64_gt"(i64 %t1640, i64 %t1643)
  %t1645 = icmp ne i64 %t1644, 0
  br i1 %t1645, label %then53, label %else53
then53:
  %t1646 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.243)
  %t1647 = ptrtoint ptr %t1646 to i64
  %t1648 = inttoptr i64 %t1647 to ptr
  call void @intrinsic_println(ptr %t1648)
  br label %then53_end
then53_end:
  br label %endif53
else53:
  %t1649 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.244)
  %t1650 = ptrtoint ptr %t1649 to i64
  %t1651 = inttoptr i64 %t1650 to ptr
  call void @intrinsic_println(ptr %t1651)
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t1652 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t1653 = phi i64 [ 0, %then52_end ], [ %t1652, %else52_end ]
  ret i64 0
}

define i64 @"test_ensemble"() nounwind {
entry:
  %local.true_val.1654 = alloca i64
  %local.loss_equal_early.1655 = alloca i64
  %local.loss_equal_late.1656 = alloca i64
  %local.best_single_late.1657 = alloca i64
  %local.best_skept_late.1658 = alloca i64
  %t1659 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.245)
  %t1660 = ptrtoint ptr %t1659 to i64
  %t1661 = inttoptr i64 %t1660 to ptr
  call void @intrinsic_println(ptr %t1661)
  %t1662 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.246)
  %t1663 = ptrtoint ptr %t1662 to i64
  %t1664 = inttoptr i64 %t1663 to ptr
  call void @intrinsic_println(ptr %t1664)
  %t1665 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.247)
  %t1666 = ptrtoint ptr %t1665 to i64
  %t1667 = inttoptr i64 %t1666 to ptr
  call void @intrinsic_println(ptr %t1667)
  %t1668 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.248)
  %t1669 = ptrtoint ptr %t1668 to i64
  %t1670 = inttoptr i64 %t1669 to ptr
  call void @intrinsic_println(ptr %t1670)
  %t1671 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.249)
  %t1672 = ptrtoint ptr %t1671 to i64
  %t1673 = inttoptr i64 %t1672 to ptr
  call void @intrinsic_println(ptr %t1673)
  %t1674 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.250)
  store i64 %t1674, ptr %local.true_val.1654
  %t1675 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.251)
  %t1676 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.252)
  %t1677 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.253)
  %t1678 = load i64, ptr %local.true_val.1654
  %t1679 = call i64 @"avg_ensemble"(i64 %t1675, i64 %t1676, i64 %t1677, i64 %t1678, i64 20)
  store i64 %t1679, ptr %local.loss_equal_early.1655
  %t1680 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.254)
  %t1681 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.255)
  %t1682 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.256)
  %t1683 = load i64, ptr %local.true_val.1654
  %t1684 = call i64 @"avg_ensemble"(i64 %t1680, i64 %t1681, i64 %t1682, i64 %t1683, i64 200)
  store i64 %t1684, ptr %local.loss_equal_late.1656
  %t1685 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.257)
  %t1686 = ptrtoint ptr %t1685 to i64
  %t1687 = inttoptr i64 %t1686 to ptr
  call void @intrinsic_print(ptr %t1687)
  %t1688 = load i64, ptr %local.loss_equal_early.1655
  %t1689 = call i64 @"print_f64"(i64 %t1688)
  %t1690 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.258)
  %t1691 = ptrtoint ptr %t1690 to i64
  %t1692 = inttoptr i64 %t1691 to ptr
  call void @intrinsic_println(ptr %t1692)
  %t1693 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.259)
  %t1694 = ptrtoint ptr %t1693 to i64
  %t1695 = inttoptr i64 %t1694 to ptr
  call void @intrinsic_print(ptr %t1695)
  %t1696 = load i64, ptr %local.loss_equal_late.1656
  %t1697 = call i64 @"print_f64"(i64 %t1696)
  %t1698 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.260)
  %t1699 = ptrtoint ptr %t1698 to i64
  %t1700 = inttoptr i64 %t1699 to ptr
  call void @intrinsic_println(ptr %t1700)
  %t1701 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.261)
  %t1702 = ptrtoint ptr %t1701 to i64
  %t1703 = inttoptr i64 %t1702 to ptr
  call void @intrinsic_println(ptr %t1703)
  %t1704 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.262)
  %t1705 = ptrtoint ptr %t1704 to i64
  %t1706 = inttoptr i64 %t1705 to ptr
  call void @intrinsic_println(ptr %t1706)
  %t1707 = load i64, ptr %local.true_val.1654
  %t1708 = call i64 @"learn_weights"(i64 %t1707, i64 20)
  %t1709 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.263)
  %t1710 = ptrtoint ptr %t1709 to i64
  %t1711 = inttoptr i64 %t1710 to ptr
  call void @intrinsic_println(ptr %t1711)
  %t1712 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.264)
  %t1713 = ptrtoint ptr %t1712 to i64
  %t1714 = inttoptr i64 %t1713 to ptr
  call void @intrinsic_println(ptr %t1714)
  %t1715 = load i64, ptr %local.true_val.1654
  %t1716 = call i64 @"learn_weights"(i64 %t1715, i64 80)
  %t1717 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.265)
  %t1718 = ptrtoint ptr %t1717 to i64
  %t1719 = inttoptr i64 %t1718 to ptr
  call void @intrinsic_println(ptr %t1719)
  %t1720 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.266)
  %t1721 = ptrtoint ptr %t1720 to i64
  %t1722 = inttoptr i64 %t1721 to ptr
  call void @intrinsic_println(ptr %t1722)
  %t1723 = load i64, ptr %local.true_val.1654
  %t1724 = call i64 @"learn_weights"(i64 %t1723, i64 200)
  %t1725 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.267)
  %t1726 = ptrtoint ptr %t1725 to i64
  %t1727 = inttoptr i64 %t1726 to ptr
  call void @intrinsic_println(ptr %t1727)
  %t1728 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.268)
  %t1729 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.269)
  %t1730 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.270)
  %t1731 = load i64, ptr %local.true_val.1654
  %t1732 = call i64 @"avg_ensemble"(i64 %t1728, i64 %t1729, i64 %t1730, i64 %t1731, i64 200)
  store i64 %t1732, ptr %local.best_single_late.1657
  %t1733 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.271)
  %t1734 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.272)
  %t1735 = call i64 @f64_parse(ptr @.str.exp_skeptical_annealing.273)
  %t1736 = load i64, ptr %local.true_val.1654
  %t1737 = call i64 @"avg_ensemble"(i64 %t1733, i64 %t1734, i64 %t1735, i64 %t1736, i64 200)
  store i64 %t1737, ptr %local.best_skept_late.1658
  %t1738 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.274)
  %t1739 = ptrtoint ptr %t1738 to i64
  %t1740 = inttoptr i64 %t1739 to ptr
  call void @intrinsic_print(ptr %t1740)
  %t1741 = load i64, ptr %local.best_single_late.1657
  %t1742 = call i64 @"print_f64"(i64 %t1741)
  %t1743 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.275)
  %t1744 = ptrtoint ptr %t1743 to i64
  %t1745 = inttoptr i64 %t1744 to ptr
  call void @intrinsic_println(ptr %t1745)
  %t1746 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.276)
  %t1747 = ptrtoint ptr %t1746 to i64
  %t1748 = inttoptr i64 %t1747 to ptr
  call void @intrinsic_print(ptr %t1748)
  %t1749 = load i64, ptr %local.best_skept_late.1658
  %t1750 = call i64 @"print_f64"(i64 %t1749)
  %t1751 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.277)
  %t1752 = ptrtoint ptr %t1751 to i64
  %t1753 = inttoptr i64 %t1752 to ptr
  call void @intrinsic_println(ptr %t1753)
  %t1754 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.278)
  %t1755 = ptrtoint ptr %t1754 to i64
  %t1756 = inttoptr i64 %t1755 to ptr
  call void @intrinsic_println(ptr %t1756)
  %t1757 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.279)
  %t1758 = ptrtoint ptr %t1757 to i64
  %t1759 = inttoptr i64 %t1758 to ptr
  call void @intrinsic_println(ptr %t1759)
  %t1760 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.280)
  %t1761 = ptrtoint ptr %t1760 to i64
  %t1762 = inttoptr i64 %t1761 to ptr
  call void @intrinsic_println(ptr %t1762)
  %t1763 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.281)
  %t1764 = ptrtoint ptr %t1763 to i64
  %t1765 = inttoptr i64 %t1764 to ptr
  call void @intrinsic_println(ptr %t1765)
  %t1766 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.282)
  %t1767 = ptrtoint ptr %t1766 to i64
  %t1768 = inttoptr i64 %t1767 to ptr
  call void @intrinsic_println(ptr %t1768)
  %t1769 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.283)
  %t1770 = ptrtoint ptr %t1769 to i64
  %t1771 = inttoptr i64 %t1770 to ptr
  call void @intrinsic_println(ptr %t1771)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1772 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.284)
  %t1773 = ptrtoint ptr %t1772 to i64
  %t1774 = inttoptr i64 %t1773 to ptr
  call void @intrinsic_println(ptr %t1774)
  %t1775 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.285)
  %t1776 = ptrtoint ptr %t1775 to i64
  %t1777 = inttoptr i64 %t1776 to ptr
  call void @intrinsic_println(ptr %t1777)
  %t1778 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.286)
  %t1779 = ptrtoint ptr %t1778 to i64
  %t1780 = inttoptr i64 %t1779 to ptr
  call void @intrinsic_println(ptr %t1780)
  %t1781 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.287)
  %t1782 = ptrtoint ptr %t1781 to i64
  %t1783 = inttoptr i64 %t1782 to ptr
  call void @intrinsic_println(ptr %t1783)
  %t1784 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.288)
  %t1785 = ptrtoint ptr %t1784 to i64
  %t1786 = inttoptr i64 %t1785 to ptr
  call void @intrinsic_println(ptr %t1786)
  %t1787 = call i64 @"test_annealing_schedule"()
  %t1788 = call i64 @"test_learnable_schedule"()
  %t1789 = call i64 @"test_adversarial_challenge"()
  %t1790 = call i64 @"test_ensemble"()
  %t1791 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.289)
  %t1792 = ptrtoint ptr %t1791 to i64
  %t1793 = inttoptr i64 %t1792 to ptr
  call void @intrinsic_println(ptr %t1793)
  %t1794 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.290)
  %t1795 = ptrtoint ptr %t1794 to i64
  %t1796 = inttoptr i64 %t1795 to ptr
  call void @intrinsic_println(ptr %t1796)
  %t1797 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.291)
  %t1798 = ptrtoint ptr %t1797 to i64
  %t1799 = inttoptr i64 %t1798 to ptr
  call void @intrinsic_println(ptr %t1799)
  %t1800 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.292)
  %t1801 = ptrtoint ptr %t1800 to i64
  %t1802 = inttoptr i64 %t1801 to ptr
  call void @intrinsic_println(ptr %t1802)
  %t1803 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.293)
  %t1804 = ptrtoint ptr %t1803 to i64
  %t1805 = inttoptr i64 %t1804 to ptr
  call void @intrinsic_println(ptr %t1805)
  %t1806 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.294)
  %t1807 = ptrtoint ptr %t1806 to i64
  %t1808 = inttoptr i64 %t1807 to ptr
  call void @intrinsic_println(ptr %t1808)
  %t1809 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.295)
  %t1810 = ptrtoint ptr %t1809 to i64
  %t1811 = inttoptr i64 %t1810 to ptr
  call void @intrinsic_println(ptr %t1811)
  %t1812 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.296)
  %t1813 = ptrtoint ptr %t1812 to i64
  %t1814 = inttoptr i64 %t1813 to ptr
  call void @intrinsic_println(ptr %t1814)
  %t1815 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.297)
  %t1816 = ptrtoint ptr %t1815 to i64
  %t1817 = inttoptr i64 %t1816 to ptr
  call void @intrinsic_println(ptr %t1817)
  %t1818 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.298)
  %t1819 = ptrtoint ptr %t1818 to i64
  %t1820 = inttoptr i64 %t1819 to ptr
  call void @intrinsic_println(ptr %t1820)
  %t1821 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.299)
  %t1822 = ptrtoint ptr %t1821 to i64
  %t1823 = inttoptr i64 %t1822 to ptr
  call void @intrinsic_println(ptr %t1823)
  %t1824 = call ptr @intrinsic_string_new(ptr @.str.exp_skeptical_annealing.300)
  %t1825 = ptrtoint ptr %t1824 to i64
  %t1826 = inttoptr i64 %t1825 to ptr
  call void @intrinsic_println(ptr %t1826)
  ret i64 0
}


; String constants
@.str.exp_skeptical_annealing.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.2 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_skeptical_annealing.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.9 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.13 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.17 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_skeptical_annealing.18 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.19 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_skeptical_annealing.20 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_skeptical_annealing.21 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.22 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_skeptical_annealing.23 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.24 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.25 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_skeptical_annealing.26 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_skeptical_annealing.27 = private unnamed_addr constant [45 x i8] c"--- Exp 1: Skepticism Annealing Schedule ---\00"
@.str.exp_skeptical_annealing.28 = private unnamed_addr constant [53 x i8] c"  True value=0.65, 150 observations, Beta(2,2) prior\00"
@.str.exp_skeptical_annealing.29 = private unnamed_addr constant [75 x i8] c"  Schedule: skeptical(0.2,c=1.0) -> warm(0.4,c=0.7) -> aligned(0.65,c=0.3)\00"
@.str.exp_skeptical_annealing.30 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.31 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.32 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.33 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.34 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.35 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.36 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_skeptical_annealing.37 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.38 = private unnamed_addr constant [26 x i8] c"  No desire:        loss=\00"
@.str.exp_skeptical_annealing.39 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.40 = private unnamed_addr constant [26 x i8] c"  Fixed aligned:    loss=\00"
@.str.exp_skeptical_annealing.41 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.42 = private unnamed_addr constant [26 x i8] c"  Fixed skeptical:  loss=\00"
@.str.exp_skeptical_annealing.43 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.44 = private unnamed_addr constant [26 x i8] c"  ANNEALED:         loss=\00"
@.str.exp_skeptical_annealing.45 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.46 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.47 = private unnamed_addr constant [20 x i8] c"  WINNER: No desire\00"
@.str.exp_skeptical_annealing.48 = private unnamed_addr constant [24 x i8] c"  WINNER: Fixed aligned\00"
@.str.exp_skeptical_annealing.49 = private unnamed_addr constant [26 x i8] c"  WINNER: Fixed skeptical\00"
@.str.exp_skeptical_annealing.50 = private unnamed_addr constant [42 x i8] c"  WINNER: Annealed (skeptical -> aligned)\00"
@.str.exp_skeptical_annealing.51 = private unnamed_addr constant [44 x i8] c"  FINDING: Annealing BEATS fixed skepticism\00"
@.str.exp_skeptical_annealing.52 = private unnamed_addr constant [61 x i8] c"  FINDING: Fixed skepticism still competitive with annealing\00"
@.str.exp_skeptical_annealing.53 = private unnamed_addr constant [43 x i8] c"  FINDING: Annealing BEATS fixed alignment\00"
@.str.exp_skeptical_annealing.54 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.55 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.56 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.58 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.61 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.62 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.63 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_skeptical_annealing.64 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_skeptical_annealing.65 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.66 = private unnamed_addr constant [45 x i8] c"--- Exp 2: Learnable Skepticism Schedule ---\00"
@.str.exp_skeptical_annealing.67 = private unnamed_addr constant [50 x i8] c"  6 time-bins (25 obs each), learn desire per bin\00"
@.str.exp_skeptical_annealing.68 = private unnamed_addr constant [32 x i8] c"  Coupling=0.8, true value=0.65\00"
@.str.exp_skeptical_annealing.69 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.70 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.71 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_skeptical_annealing.72 = private unnamed_addr constant [5 x i8] c"0.08\00"
@.str.exp_skeptical_annealing.73 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.74 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.75 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.76 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.77 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.78 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.79 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.80 = private unnamed_addr constant [27 x i8] c"  Initial loss (all 0.5): \00"
@.str.exp_skeptical_annealing.81 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.82 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.83 = private unnamed_addr constant [5 x i8] c"0.95\00"
@.str.exp_skeptical_annealing.84 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.85 = private unnamed_addr constant [5 x i8] c"0.95\00"
@.str.exp_skeptical_annealing.86 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.87 = private unnamed_addr constant [5 x i8] c"0.95\00"
@.str.exp_skeptical_annealing.88 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.89 = private unnamed_addr constant [5 x i8] c"0.95\00"
@.str.exp_skeptical_annealing.90 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.91 = private unnamed_addr constant [5 x i8] c"0.95\00"
@.str.exp_skeptical_annealing.92 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.93 = private unnamed_addr constant [5 x i8] c"0.95\00"
@.str.exp_skeptical_annealing.94 = private unnamed_addr constant [27 x i8] c"  Learned loss:           \00"
@.str.exp_skeptical_annealing.95 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.96 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.97 = private unnamed_addr constant [29 x i8] c"  Learned desire trajectory:\00"
@.str.exp_skeptical_annealing.98 = private unnamed_addr constant [32 x i8] c"    Bin 0 (obs  0-24):  desire=\00"
@.str.exp_skeptical_annealing.99 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.100 = private unnamed_addr constant [32 x i8] c"    Bin 1 (obs 25-49):  desire=\00"
@.str.exp_skeptical_annealing.101 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.102 = private unnamed_addr constant [32 x i8] c"    Bin 2 (obs 50-74):  desire=\00"
@.str.exp_skeptical_annealing.103 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.104 = private unnamed_addr constant [32 x i8] c"    Bin 3 (obs 75-99):  desire=\00"
@.str.exp_skeptical_annealing.105 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.106 = private unnamed_addr constant [33 x i8] c"    Bin 4 (obs 100-124): desire=\00"
@.str.exp_skeptical_annealing.107 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.108 = private unnamed_addr constant [33 x i8] c"    Bin 5 (obs 125-149): desire=\00"
@.str.exp_skeptical_annealing.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.110 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.111 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.112 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.113 = private unnamed_addr constant [32 x i8] c"  Early avg desire (bins 0-1): \00"
@.str.exp_skeptical_annealing.114 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.115 = private unnamed_addr constant [32 x i8] c"  Late avg desire  (bins 4-5): \00"
@.str.exp_skeptical_annealing.116 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.117 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.118 = private unnamed_addr constant [61 x i8] c"  FINDING: Desire trajectory moves from SKEPTICAL to ALIGNED\00"
@.str.exp_skeptical_annealing.119 = private unnamed_addr constant [55 x i8] c"  The meta-gradient discovers annealing spontaneously!\00"
@.str.exp_skeptical_annealing.120 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.121 = private unnamed_addr constant [45 x i8] c"  FINDING: Desire stays SKEPTICAL throughout\00"
@.str.exp_skeptical_annealing.122 = private unnamed_addr constant [39 x i8] c"  Skepticism is valuable at all stages\00"
@.str.exp_skeptical_annealing.123 = private unnamed_addr constant [45 x i8] c"  FINDING: Desire trajectory is roughly FLAT\00"
@.str.exp_skeptical_annealing.124 = private unnamed_addr constant [54 x i8] c"  Annealing not clearly preferred over fixed schedule\00"
@.str.exp_skeptical_annealing.125 = private unnamed_addr constant [50 x i8] c"  FINDING: Learned schedule beats uniform neutral\00"
@.str.exp_skeptical_annealing.126 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.127 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.128 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.129 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.130 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.131 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.132 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.133 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.134 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_skeptical_annealing.135 = private unnamed_addr constant [44 x i8] c"--- Exp 3: Adversarial Belief Challenge ---\00"
@.str.exp_skeptical_annealing.136 = private unnamed_addr constant [49 x i8] c"  Agent A: trusting  (desire=0.65, coupling=0.5)\00"
@.str.exp_skeptical_annealing.137 = private unnamed_addr constant [49 x i8] c"  Agent B: skeptical (desire=0.20, coupling=0.5)\00"
@.str.exp_skeptical_annealing.138 = private unnamed_addr constant [40 x i8] c"  Agent N: no desire (neutral baseline)\00"
@.str.exp_skeptical_annealing.139 = private unnamed_addr constant [40 x i8] c"  True value=0.65, same evidence stream\00"
@.str.exp_skeptical_annealing.140 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.141 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.142 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.143 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.144 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_skeptical_annealing.145 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.146 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.147 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.148 = private unnamed_addr constant [33 x i8] c"  After 20 observations (early):\00"
@.str.exp_skeptical_annealing.149 = private unnamed_addr constant [22 x i8] c"    Trusting error:  \00"
@.str.exp_skeptical_annealing.150 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.151 = private unnamed_addr constant [22 x i8] c"    Skeptical error: \00"
@.str.exp_skeptical_annealing.152 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.153 = private unnamed_addr constant [22 x i8] c"    No-desire error: \00"
@.str.exp_skeptical_annealing.154 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.155 = private unnamed_addr constant [26 x i8] c"    -> Skeptic WINS early\00"
@.str.exp_skeptical_annealing.156 = private unnamed_addr constant [26 x i8] c"    -> Truster WINS early\00"
@.str.exp_skeptical_annealing.157 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.158 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.159 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.160 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_skeptical_annealing.161 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.162 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.163 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.164 = private unnamed_addr constant [31 x i8] c"  After 80 observations (mid):\00"
@.str.exp_skeptical_annealing.165 = private unnamed_addr constant [22 x i8] c"    Trusting error:  \00"
@.str.exp_skeptical_annealing.166 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.167 = private unnamed_addr constant [22 x i8] c"    Skeptical error: \00"
@.str.exp_skeptical_annealing.168 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.169 = private unnamed_addr constant [22 x i8] c"    No-desire error: \00"
@.str.exp_skeptical_annealing.170 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.171 = private unnamed_addr constant [24 x i8] c"    -> Skeptic WINS mid\00"
@.str.exp_skeptical_annealing.172 = private unnamed_addr constant [24 x i8] c"    -> Truster WINS mid\00"
@.str.exp_skeptical_annealing.173 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.174 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.175 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.176 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_skeptical_annealing.177 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.178 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.179 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.180 = private unnamed_addr constant [33 x i8] c"  After 200 observations (late):\00"
@.str.exp_skeptical_annealing.181 = private unnamed_addr constant [22 x i8] c"    Trusting error:  \00"
@.str.exp_skeptical_annealing.182 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.183 = private unnamed_addr constant [22 x i8] c"    Skeptical error: \00"
@.str.exp_skeptical_annealing.184 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.185 = private unnamed_addr constant [22 x i8] c"    No-desire error: \00"
@.str.exp_skeptical_annealing.186 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.187 = private unnamed_addr constant [25 x i8] c"    -> Skeptic WINS late\00"
@.str.exp_skeptical_annealing.188 = private unnamed_addr constant [25 x i8] c"    -> Truster WINS late\00"
@.str.exp_skeptical_annealing.189 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.190 = private unnamed_addr constant [73 x i8] c"  FINDING: CROSSOVER detected! Skeptic better early, truster better late\00"
@.str.exp_skeptical_annealing.191 = private unnamed_addr constant [42 x i8] c"  This validates the annealing hypothesis\00"
@.str.exp_skeptical_annealing.192 = private unnamed_addr constant [45 x i8] c"  FINDING: Skeptic dominates at ALL horizons\00"
@.str.exp_skeptical_annealing.193 = private unnamed_addr constant [59 x i8] c"  Sustained skepticism > trust even with abundant evidence\00"
@.str.exp_skeptical_annealing.194 = private unnamed_addr constant [45 x i8] c"  FINDING: Truster dominates at ALL horizons\00"
@.str.exp_skeptical_annealing.195 = private unnamed_addr constant [33 x i8] c"  Alignment helps from the start\00"
@.str.exp_skeptical_annealing.196 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.197 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.198 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.199 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.200 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.201 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.202 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.203 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.204 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.205 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.206 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.207 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.208 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.209 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_skeptical_annealing.210 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_skeptical_annealing.211 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.212 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.213 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.214 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.215 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.216 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.217 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_skeptical_annealing.218 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_skeptical_annealing.219 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_skeptical_annealing.220 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_skeptical_annealing.221 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.222 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.223 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.224 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_skeptical_annealing.225 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_skeptical_annealing.226 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_skeptical_annealing.227 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_skeptical_annealing.228 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_skeptical_annealing.229 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_skeptical_annealing.230 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_skeptical_annealing.231 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_skeptical_annealing.232 = private unnamed_addr constant [23 x i8] c"    Trusting weight:  \00"
@.str.exp_skeptical_annealing.233 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.234 = private unnamed_addr constant [23 x i8] c"    Neutral weight:   \00"
@.str.exp_skeptical_annealing.235 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.236 = private unnamed_addr constant [23 x i8] c"    Skeptical weight: \00"
@.str.exp_skeptical_annealing.237 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.238 = private unnamed_addr constant [23 x i8] c"    Ensemble loss:    \00"
@.str.exp_skeptical_annealing.239 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.240 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.241 = private unnamed_addr constant [37 x i8] c"    -> Meta-gradient FAVOURS skeptic\00"
@.str.exp_skeptical_annealing.242 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_skeptical_annealing.243 = private unnamed_addr constant [37 x i8] c"    -> Meta-gradient FAVOURS truster\00"
@.str.exp_skeptical_annealing.244 = private unnamed_addr constant [29 x i8] c"    -> Weights roughly EQUAL\00"
@.str.exp_skeptical_annealing.245 = private unnamed_addr constant [39 x i8] c"--- Exp 4: Ensemble of Skepticisms ---\00"
@.str.exp_skeptical_annealing.246 = private unnamed_addr constant [57 x i8] c"  3 agents: trusting(0.65), neutral(0.5), skeptical(0.2)\00"
@.str.exp_skeptical_annealing.247 = private unnamed_addr constant [55 x i8] c"  Learn optimal ensemble weights at different horizons\00"
@.str.exp_skeptical_annealing.248 = private unnamed_addr constant [32 x i8] c"  True value=0.65, coupling=0.5\00"
@.str.exp_skeptical_annealing.249 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.250 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_skeptical_annealing.251 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.252 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.253 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.254 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.255 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.256 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.257 = private unnamed_addr constant [41 x i8] c"  Equal-weight ensemble (20 obs):  loss=\00"
@.str.exp_skeptical_annealing.258 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.259 = private unnamed_addr constant [41 x i8] c"  Equal-weight ensemble (200 obs): loss=\00"
@.str.exp_skeptical_annealing.260 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.261 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.262 = private unnamed_addr constant [47 x i8] c"  Learning weights at 20 observations (early):\00"
@.str.exp_skeptical_annealing.263 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.264 = private unnamed_addr constant [45 x i8] c"  Learning weights at 80 observations (mid):\00"
@.str.exp_skeptical_annealing.265 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.266 = private unnamed_addr constant [47 x i8] c"  Learning weights at 200 observations (late):\00"
@.str.exp_skeptical_annealing.267 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.268 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.269 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_skeptical_annealing.270 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_skeptical_annealing.271 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_skeptical_annealing.272 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_skeptical_annealing.273 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_skeptical_annealing.274 = private unnamed_addr constant [36 x i8] c"  Single trusting (200 obs):  loss=\00"
@.str.exp_skeptical_annealing.275 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.276 = private unnamed_addr constant [36 x i8] c"  Single skeptical (200 obs): loss=\00"
@.str.exp_skeptical_annealing.277 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.278 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.279 = private unnamed_addr constant [61 x i8] c"  ANALYSIS: If early weights favour skeptic and late weights\00"
@.str.exp_skeptical_annealing.280 = private unnamed_addr constant [53 x i8] c"  favour truster, the ensemble has learned to ANNEAL\00"
@.str.exp_skeptical_annealing.281 = private unnamed_addr constant [57 x i8] c"  implicitly — the same principle as Exp 1, discovered\00"
@.str.exp_skeptical_annealing.282 = private unnamed_addr constant [59 x i8] c"  through weight optimisation rather than schedule design.\00"
@.str.exp_skeptical_annealing.283 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.284 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_skeptical_annealing.285 = private unnamed_addr constant [29 x i8] c"  SKEPTICAL DESIRE ANNEALING\00"
@.str.exp_skeptical_annealing.286 = private unnamed_addr constant [43 x i8] c"  From Misalignment to Alignment Over Time\00"
@.str.exp_skeptical_annealing.287 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_skeptical_annealing.288 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_skeptical_annealing.289 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_skeptical_annealing.290 = private unnamed_addr constant [10 x i8] c"  SUMMARY\00"
@.str.exp_skeptical_annealing.291 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_skeptical_annealing.292 = private unnamed_addr constant [50 x i8] c"  1. Annealing: skeptical-start -> aligned-finish\00"
@.str.exp_skeptical_annealing.293 = private unnamed_addr constant [45 x i8] c"     may combine benefits of both strategies\00"
@.str.exp_skeptical_annealing.294 = private unnamed_addr constant [49 x i8] c"  2. Learnable schedule: meta-gradient discovers\00"
@.str.exp_skeptical_annealing.295 = private unnamed_addr constant [45 x i8] c"     the optimal desire trajectory over time\00"
@.str.exp_skeptical_annealing.296 = private unnamed_addr constant [49 x i8] c"  3. Adversarial: tests crossover hypothesis —\00"
@.str.exp_skeptical_annealing.297 = private unnamed_addr constant [49 x i8] c"     skepticism better early, trust better late?\00"
@.str.exp_skeptical_annealing.298 = private unnamed_addr constant [46 x i8] c"  4. Ensemble: diverse skepticism levels with\00"
@.str.exp_skeptical_annealing.299 = private unnamed_addr constant [50 x i8] c"     learnable weights achieve robust performance\00"
@.str.exp_skeptical_annealing.300 = private unnamed_addr constant [45 x i8] c"============================================\00"
